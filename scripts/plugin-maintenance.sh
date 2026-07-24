#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
MAINTENANCE_CONFIG_PATH="${WEZTERM_TYPES_MAINTENANCE_CONFIG:-$ROOT_DIR/metadata/plugin-maintenance.json}"
MANIFEST_PATH="${WEZTERM_TYPES_MANIFEST:-$ROOT_DIR/metadata/plugins.json}"
README_PATH="${WEZTERM_TYPES_README:-$ROOT_DIR/README.md}"
DOCS_README_PATH="${WEZTERM_TYPES_DOCS_README:-$ROOT_DIR/docs/README.md}"
PANVIMDOC_PATH="${WEZTERM_TYPES_PANVIMDOC_CONFIG:-$ROOT_DIR/.github/workflows/panvimdoc_plugins.yml}"
PANVIMDOC_TEMPLATE_PATH="${WEZTERM_TYPES_PANVIMDOC_TEMPLATE:-$ROOT_DIR/scripts/templates/panvimdoc-plugins.yml.tmpl}"
PAGE_TEMPLATE_PATH="${WEZTERM_TYPES_PAGE_TEMPLATE:-$ROOT_DIR/scripts/templates/plugin-maintenance-page.html.tmpl}"
REDIRECT_TEMPLATE_PATH="${WEZTERM_TYPES_REDIRECT_TEMPLATE:-$ROOT_DIR/scripts/templates/plugin-maintenance-redirect.html.tmpl}"
BUILD_DIR="${PLUGIN_MAINTENANCE_BUILD_DIR:-$ROOT_DIR/.tmp/plugin-maintenance}"
SYNC_PATH="${PLUGIN_MAINTENANCE_SYNC_PATH:-$BUILD_DIR/report.json}"
PAGES_DIR="${PLUGIN_MAINTENANCE_PAGES_DIR:-$BUILD_DIR/pages}"
START_MARKER="<!-- plugin-table:start -->"
END_MARKER="<!-- plugin-table:end -->"
DOCS_START_MARKER="<!-- plugin-docs:start -->"
DOCS_END_MARKER="<!-- plugin-docs:end -->"
TEMP_FILES=()
TEMP_PATH=""

cleanup_temp_files() {
  if ((${#TEMP_FILES[@]} > 0)); then
    rm -f -- "${TEMP_FILES[@]}"
  fi
}

new_temp() {
  TEMP_PATH=$(mktemp)
  TEMP_FILES+=("$TEMP_PATH")
}

trap cleanup_temp_files EXIT

die() {
  printf '%s\n' "$*" >&2
  exit 1
}

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || die "Missing required command: $1"
}

main_usage() {
  printf 'Usage: %s {generate|table|validate|sync|accept|render-pages} ...\nRequires: jq\n' "$0"
}

generate_usage() {
  printf 'Usage: %s generate [--check]\n' "$0"
}

table_usage() {
  printf 'Usage: %s table [--check]\n' "$0"
}

sync_usage() {
  printf 'Usage: %s sync [slug ...]\n' "$0"
}

accept_usage() {
  printf 'Usage: %s accept <slug> --from <none|kind:value> --to <kind:value> [--defer-generated]\n' "$0"
}

repo_slug() {
  local remote

  if [[ -n "${WEZTERM_TYPES_PAGES_REPO:-}" ]]; then
    printf '%s\n' "${WEZTERM_TYPES_PAGES_REPO}"
    return
  fi

  if [[ -n "${GITHUB_REPOSITORY:-}" ]]; then
    printf '%s\n' "${GITHUB_REPOSITORY}"
    return
  fi

  remote=$(git -C "$ROOT_DIR" remote get-url origin 2>/dev/null || true)
  if [[ -z "$remote" ]]; then
    jq -r '.canonical_repository' "$MAINTENANCE_CONFIG_PATH"
    return
  fi

  remote=${remote#https://github.com/}
  remote=${remote#git@github.com:}
  remote=${remote%.git}
  printf '%s\n' "$remote"
}

runtime_pages_base_url() {
  local slug owner repo

  if [[ -n "${WEZTERM_TYPES_PAGES_BASE_URL:-}" ]]; then
    printf '%s\n' "${WEZTERM_TYPES_PAGES_BASE_URL%/}"
    return
  fi

  slug=$(repo_slug)
  owner=${slug%/*}
  repo=${slug#*/}
  printf 'https://%s.github.io/%s\n' "$owner" "$repo"
}

repo_branch() {
  if [[ -n "${WEZTERM_TYPES_REPO_BRANCH:-}" ]]; then
    printf '%s\n' "${WEZTERM_TYPES_REPO_BRANCH}"
    return
  fi

  jq -r '.default_branch' "$MAINTENANCE_CONFIG_PATH"
}

json_list_from_find() {
  local path=$1
  shift

  find "$path" "$@" -print |
    sed "s#^$ROOT_DIR/##" |
    LC_ALL=C sort |
    jq -Rsc 'split("\n") | map(select(length > 0))'
}

compare_lists() {
  local label=$1
  local expected=$2
  local actual=$3

  if [[ "$expected" == "$actual" ]]; then
    return
  fi

  printf '%s manifest mismatch\n' "$label" >&2
  diff -u \
    <(jq -r '.[]' <<<"$expected") \
    <(jq -r '.[]' <<<"$actual") || true
  exit 1
}

require_sync_report() {
  [[ -f "$SYNC_PATH" ]] || die "Missing sync report: $SYNC_PATH. Run '$0 sync' first."
}

ref_badge_text() {
  local kind=$1
  local value=$2

  if [[ "$kind" == "none" ]]; then
    printf 'none\n'
    return
  fi

  if [[ "$kind" == "commit" ]]; then
    printf 'commit:%s\n' "${value:0:7}"
    return
  fi

  printf '%s:%s\n' "$kind" "$value"
}

render_badge_svg() {
  local label=$1
  local message=$2
  local color=$3
  local output=$4
  local label_width message_width total_width label_x message_x aria_label label_text message_text

  label_width=$(( ${#label} * 7 + 10 ))
  message_width=$(( ${#message} * 7 + 10 ))
  total_width=$(( label_width + message_width ))
  label_x=$(( label_width / 2 ))
  message_x=$(( label_width + message_width / 2 ))
  aria_label=$(jq -rn --arg value "$label: $message" '$value | @html')
  label_text=$(jq -rn --arg value "$label" '$value | @html')
  message_text=$(jq -rn --arg value "$message" '$value | @html')

  {
    printf '<svg xmlns="http://www.w3.org/2000/svg" width="%s" height="20" role="img" aria-label="%s">\n' "$total_width" "$aria_label"
    printf '  <title>%s</title>\n' "$aria_label"
    printf '  <clipPath id="r"><rect width="%s" height="20" rx="3"/></clipPath>\n' "$total_width"
    printf '  <g clip-path="url(#r)">\n'
    printf '    <rect width="%s" height="20" fill="#555"/>\n' "$label_width"
    printf '    <rect x="%s" width="%s" height="20" fill="%s"/>\n' "$label_width" "$message_width" "$color"
    printf '  </g>\n'
    printf '  <g fill="#fff" text-anchor="middle" font-family="Verdana, Geneva, DejaVu Sans, sans-serif" font-size="11">\n'
    printf '    <text x="%s" y="14">%s</text>\n' "$label_x" "$label_text"
    printf '    <text x="%s" y="14">%s</text>\n' "$message_x" "$message_text"
    printf '  </g>\n'
    printf '</svg>\n'
  } >"$output"
}

repo_ref_url() {
  local repo_url=$1
  local kind=$2
  local value=$3

  if [[ "$kind" != "none" ]]; then
    printf '%s/tree/%s\n' "$repo_url" "$value"
    return
  fi

  printf '%s\n' "$repo_url"
}

render_ref_redirect() {
  local target_url=$1
  local output=$2
  local escaped_url

  escaped_url=$(jq -rn --arg value "$target_url" '$value | @html')
  {
    printf '<!doctype html>\n'
    printf '<html lang="en">\n'
    printf '<head>\n'
    printf '  <meta charset="utf-8">\n'
    printf '  <meta http-equiv="refresh" content="0; url=%s">\n' "$escaped_url"
    printf '  <link rel="canonical" href="%s">\n' "$escaped_url"
    printf '  <title>Redirecting…</title>\n'
    printf '</head>\n'
    printf '<body><p>Redirecting to <a href="%s">the reviewed upstream reference</a>.</p></body>\n' "$escaped_url"
    printf '</html>\n'
  } >"$output"
}

render_table_block() {
  local canonical_pages_base_url
  canonical_pages_base_url=$(jq -r '.pages_base_url' "$MAINTENANCE_CONFIG_PATH")

  printf '| Plugin | Documentation | Maintenance |\n'
  printf '| --- | --- | --- |\n'

  while IFS=$'\t' read -r slug readme_name repo; do
    local plugin_cell docs_cell maintenance_cell status_url reviewed_url upstream_url
    local reviewed_link upstream_link
    local docs_path="docs/${slug}.md"
    local vimdoc_path="doc/wezterm-types-plugin.${slug}.txt"
    plugin_cell="[$readme_name](https://github.com/$repo)"
    docs_cell="[$docs_path](./$docs_path)<br>[:h $(basename "$vimdoc_path")](./$vimdoc_path)"
    status_url="${canonical_pages_base_url}/plugin-maintenance/badges/${slug}-status.svg"
    reviewed_url="${canonical_pages_base_url}/plugin-maintenance/badges/${slug}-reviewed.svg"
    upstream_url="${canonical_pages_base_url}/plugin-maintenance/badges/${slug}-upstream.svg"
    reviewed_link="${canonical_pages_base_url}/plugin-maintenance/refs/${slug}-reviewed.html"
    upstream_link="${canonical_pages_base_url}/plugin-maintenance/refs/${slug}-upstream.html"
    maintenance_cell="[![Status](${status_url})](${canonical_pages_base_url}/plugin-maintenance/#${slug})<br>[![Reviewed baseline](${reviewed_url})](${reviewed_link})<br>[![Latest upstream](${upstream_url})](${upstream_link})"

    printf '| %s | %s | %s |\n' \
      "$plugin_cell" "$docs_cell" "$maintenance_cell"
  done < <(
    jq -r '
      sort_by(.readme_name | ascii_downcase)
      | .[]
      | [
          .slug,
          .readme_name,
          .repo
        ]
      | @tsv
    ' "$MANIFEST_PATH"
  )
}

rewrite_marked_block() {
  local source=$1 start=$2 end=$3 renderer=$4 label=$5
  local rendered tmp
  rendered=$("$renderer")
  new_temp
  tmp=$TEMP_PATH

  awk -v start="$start" -v end="$end" -v block="$rendered" '
    BEGIN {
      in_block = 0
      saw_start = 0
      saw_end = 0
    }
    $0 == start {
      print
      print block
      in_block = 1
      saw_start = 1
      next
    }
    $0 == end {
      in_block = 0
      saw_end = 1
      print
      next
    }
    !in_block {
      print
    }
    END {
      if (!saw_start || !saw_end) {
        exit 3
      }
    }
  ' "$source" >"$tmp" || {
    rm -f "$tmp"
    die "$label markers not found in $source"
  }

  GENERATED_PATH=$tmp
}

rewrite_readme_with_table() {
  rewrite_marked_block \
    "$README_PATH" "$START_MARKER" "$END_MARKER" render_table_block "README plugin table"
  GENERATED_README_PATH=$GENERATED_PATH
}

check_generated_file() {
  local source=$1 generated=$2 label=$3

  if cmp -s "$generated" "$source"; then
    return
  fi

  diff -u "$source" "$generated" || true
  die "$label is out of date"
}

write_generated_file() {
  local source=$1 generated=$2

  cp "$generated" "$source"
  rm -f "$generated"
}

check_readme_table() {
  rewrite_readme_with_table
  check_generated_file "$README_PATH" "$GENERATED_README_PATH" "README plugin table"
}

write_readme_table() {
  rewrite_readme_with_table
  write_generated_file "$README_PATH" "$GENERATED_README_PATH"
}

render_docs_readme_links() {
  jq -r '
    sort_by(.readme_name | ascii_downcase)
    | .[]
    | "- [" + .readme_name + "](./" + .slug + ".md)"
  ' "$MANIFEST_PATH"
}

rewrite_docs_readme() {
  rewrite_marked_block \
    "$DOCS_README_PATH" "$DOCS_START_MARKER" "$DOCS_END_MARKER" \
    render_docs_readme_links "documentation index"
  GENERATED_DOCS_README_PATH=$GENERATED_PATH
}

render_panvimdoc_steps() {
  while IFS= read -r slug; do
    printf '      - name: Run panvimdoc for %s.md\n' "$slug"
    printf '        uses: kdheepak/panvimdoc@v4.0.1\n'
    printf '        with:\n'
    printf '          vimdoc: wezterm-types-plugin.%s\n' "$slug"
    printf '          description: "%s types"\n' "\`$slug\`"
    printf '          pandoc: docs/%s.md\n' "$slug"
    printf '          toc: false\n'
    printf '          demojify: true\n'
    printf '          dedupsubheadings: false\n'
    printf '          treesitter: true\n'
    printf '          ignorerawblocks: true\n'
    printf '          docmapping: false\n'
    printf '          docmappingprojectname: false\n'
  done < <(jq -r 'sort_by(.slug) | .[].slug' "$MANIFEST_PATH")
}

render_panvimdoc_workflow() {
  local rendered tmp
  rendered=$(render_panvimdoc_steps)
  new_temp
  tmp=$TEMP_PATH

  awk -v block="$rendered" '
    $0 == "__PLUGIN_STEPS__" {
      print block
      saw_placeholder = 1
      next
    }
    {
      print
    }
    END {
      if (!saw_placeholder) {
        exit 3
      }
    }
  ' "$PANVIMDOC_TEMPLATE_PATH" >"$tmp" || {
    rm -f "$tmp"
    die "Plugin steps placeholder not found in $PANVIMDOC_TEMPLATE_PATH"
  }

  GENERATED_PANVIMDOC_PATH=$tmp
}

prepare_generated_artifacts() {
  [[ -f "$README_PATH" ]] || die "Missing README: $README_PATH"
  [[ -f "$DOCS_README_PATH" ]] || die "Missing documentation index: $DOCS_README_PATH"
  [[ -f "$PANVIMDOC_PATH" ]] || die "Missing panvimdoc plugin configuration: $PANVIMDOC_PATH"
  [[ -f "$PANVIMDOC_TEMPLATE_PATH" ]] ||
    die "Missing panvimdoc workflow template: $PANVIMDOC_TEMPLATE_PATH"

  rewrite_readme_with_table
  rewrite_docs_readme
  render_panvimdoc_workflow
}

check_generated_artifacts() {
  prepare_generated_artifacts
  check_generated_file "$README_PATH" "$GENERATED_README_PATH" "README plugin table"
  check_generated_file \
    "$DOCS_README_PATH" "$GENERATED_DOCS_README_PATH" "Documentation index"
  check_generated_file \
    "$PANVIMDOC_PATH" "$GENERATED_PANVIMDOC_PATH" "Panvimdoc plugin workflow"
}

write_generated_artifacts() {
  prepare_generated_artifacts
  write_generated_file "$README_PATH" "$GENERATED_README_PATH"
  write_generated_file "$DOCS_README_PATH" "$GENERATED_DOCS_README_PATH"
  write_generated_file "$PANVIMDOC_PATH" "$GENERATED_PANVIMDOC_PATH"
}

validate_generation_inputs() {
  require_cmd jq
  validate_maintenance_config
  [[ -f "$MANIFEST_PATH" ]] || die "Missing manifest: $MANIFEST_PATH"
  validate_manifest_schema
}

generate() {
  local mode=${1:-write}

  if [[ $# -gt 1 ]]; then
    die "$(generate_usage)"
  fi

  validate_generation_inputs

  case "$mode" in
  write)
    write_generated_artifacts
    ;;
  --check)
    check_generated_artifacts
    ;;
  *)
    die "$(generate_usage)"
    ;;
  esac
}

table() {
  local mode=${1:-write}

  if [[ $# -gt 1 ]]; then
    die "$(table_usage)"
  fi

  validate_generation_inputs

  case "$mode" in
  write)
    [[ -f "$README_PATH" ]] || die "Missing README: $README_PATH"
    write_readme_table
    ;;
  --check)
    [[ -f "$README_PATH" ]] || die "Missing README: $README_PATH"
    check_readme_table
    ;;
  *)
    die "$(table_usage)"
    ;;
  esac
}

normalize_error_text() {
  tr '\n' ' ' <"$1" | sed 's/[[:space:]]\+/ /g; s/^ //; s/ $//'
}

validate_maintenance_config() {
  local default_branch

  [[ -f "$MAINTENANCE_CONFIG_PATH" ]] ||
    die "Missing plugin maintenance config: $MAINTENANCE_CONFIG_PATH"

  jq -e '
    type == "object"
    and (keys == ["canonical_repository", "default_branch", "pages_base_url"])
    and (.canonical_repository | type == "string" and test("^[A-Za-z0-9](?:[A-Za-z0-9-]{0,37}[A-Za-z0-9])?/[A-Za-z0-9._-]+$"))
    and ((.canonical_repository | split("/")[1]) as $name | $name != "." and $name != "..")
    and (.default_branch | type == "string" and length > 0)
    and (.pages_base_url | type == "string" and test("^https://[^[:space:]]+$") and (endswith("/") | not))
  ' "$MAINTENANCE_CONFIG_PATH" >/dev/null ||
    die "Plugin maintenance config validation failed"

  default_branch=$(jq -r '.default_branch' "$MAINTENANCE_CONFIG_PATH")
  git check-ref-format "refs/heads/$default_branch" >/dev/null 2>&1 ||
    die "Plugin maintenance config contains an invalid default branch: $default_branch"
}

emit_sync_error_record() {
  local manifest_json=$1
  local repo_url=$2
  local error_text=$3

  jq -nc \
    --argjson manifest "$manifest_json" \
    --arg repo_url "$repo_url" \
    --arg status "error" \
    --arg error "$error_text" \
    '$manifest + {
      repo_url: $repo_url,
      status: $status,
      error: $error,
      upstream_ref: null,
      compare_url: null
    }'
}

emit_sync_status_record() {
  local manifest_json=$1
  local repo_url=$2
  local status=$3
  local upstream_kind=$4
  local upstream_value=$5

  jq -nc \
    --argjson manifest "$manifest_json" \
    --arg repo_url "$repo_url" \
    --arg status "$status" \
    --arg upstream_kind "$upstream_kind" \
    --arg upstream_value "$upstream_value" \
    '$manifest + {
      repo_url: $repo_url,
      status: $status,
      upstream_ref: {
        kind: $upstream_kind,
        value: $upstream_value
      },
      compare_url: (
        if $status == "review_required" then
          $repo_url + "/compare/" + $manifest.reviewed_ref.value + "..." + $upstream_value
        else
          null
        end
      )
    }'
}

validate_manifest_schema() {
  jq -e '
    type == "array"
    and length > 0
    and ([.[].slug] | length == (unique | length))
    and ([.[].repo] | length == (unique | length))
    and ([.[].slug] == ([.[].slug] | sort))
    and all(
      .[];
      (keys == ["readme_name", "repo", "reviewed_ref", "slug"])
      and (.slug | type == "string" and test("^[a-z0-9][a-z0-9-]*$"))
      and (.repo | type == "string" and test("^[A-Za-z0-9](?:[A-Za-z0-9-]{0,37}[A-Za-z0-9])?/[A-Za-z0-9._-]+$"))
      and ((.repo | split("/")[1]) as $name | $name != "." and $name != "..")
      and (.readme_name | type == "string" and length > 0)
      and has("reviewed_ref")
      and (
        .reviewed_ref == null
        or (
          (.reviewed_ref | type == "object")
          and (.reviewed_ref | keys == ["kind", "value"])
          and (
            .reviewed_ref.kind == "release"
            or .reviewed_ref.kind == "tag"
            or .reviewed_ref.kind == "commit"
          )
          and (.reviewed_ref.value | type == "string" and length > 0)
          and (
            .reviewed_ref.kind != "commit"
            or (.reviewed_ref.value | test("^[0-9a-f]{40}$"))
          )
        )
      )
    )
  ' "$MANIFEST_PATH" >/dev/null || die "Manifest validation failed"

  while IFS= read -r ref; do
    git check-ref-format "refs/tags/$ref" >/dev/null 2>&1 ||
      die "Manifest contains an invalid release or tag ref: $ref"
  done < <(jq -r '.[] | select(.reviewed_ref.kind == "release" or .reviewed_ref.kind == "tag") | .reviewed_ref.value' "$MANIFEST_PATH")
}

validate_inventory() {
  local manifest_docs manifest_lua manifest_vimdoc actual_docs actual_lua actual_vimdoc

  manifest_docs=$(jq -c '[.[].slug | "docs/" + . + ".md"] | sort' "$MANIFEST_PATH")
  manifest_lua=$(jq -c '[.[].slug | "lua/wezterm/types/plugins/" + . + ".lua"] | sort' "$MANIFEST_PATH")
  manifest_vimdoc=$(jq -c '[.[].slug | "doc/wezterm-types-plugin." + . + ".txt"] | sort' "$MANIFEST_PATH")

  actual_docs=$(json_list_from_find "$ROOT_DIR/docs" -maxdepth 1 -type f -name '*.md' ! -name 'README.md')
  actual_lua=$(json_list_from_find "$ROOT_DIR/lua/wezterm/types/plugins" -maxdepth 1 -type f -name '*.lua')
  actual_vimdoc=$(json_list_from_find "$ROOT_DIR/doc" -maxdepth 1 -type f -name 'wezterm-types-plugin.*.txt')

  compare_lists "docs" "$manifest_docs" "$actual_docs"
  compare_lists "lua" "$manifest_lua" "$actual_lua"
  compare_lists "vimdoc" "$manifest_vimdoc" "$actual_vimdoc"
}

validate() {
  if [[ $# -gt 0 ]]; then
    die "$(main_usage)"
  fi

  validate_generation_inputs
  validate_inventory
  check_generated_artifacts
}

sync_entry() {
  trap - EXIT

  local entry=$1
  local output_path=$2
  local error_path=$3
  local repo reviewed_kind reviewed_value response_json repo_url
  local latest_release latest_tag default_commit upstream_kind upstream_value status
  local owner name
  local -a repository_fields=()
  # shellcheck disable=SC2016 # GraphQL variables are expanded by GitHub, not Bash.
  local query='query($owner: String!, $name: String!) {
    repository(owner: $owner, name: $name) {
      url
      latestRelease { tagName }
      refs(
        refPrefix: "refs/tags/"
        first: 1
        orderBy: { field: TAG_COMMIT_DATE, direction: DESC }
      ) { nodes { name } }
      defaultBranchRef { target { ... on Commit { oid } } }
    }
  }'

  repo=$(jq -r '.repo' <<<"$entry")
  reviewed_kind=$(jq -r '.reviewed_ref.kind // "none"' <<<"$entry")
  reviewed_value=$(jq -r '.reviewed_ref.value // ""' <<<"$entry")
  repo_url="https://github.com/$repo"
  owner=${repo%%/*}
  name=${repo#*/}

  if ! response_json=$(gh api graphql \
    -f query="$query" \
    -F owner="$owner" \
    -F name="$name" \
    2>"$error_path"); then
    emit_sync_error_record "$entry" "$repo_url" "$(normalize_error_text "$error_path")" >"$output_path"
    printf '\n' >>"$output_path"
    return
  fi

  mapfile -t repository_fields < <(
    jq -er '
      .data.repository
      | .url,
        (.latestRelease.tagName // ""),
        (.refs.nodes[0].name // ""),
        (.defaultBranchRef.target.oid // "")
    ' <<<"$response_json"
  )
  if ((${#repository_fields[@]} != 4)); then
    emit_sync_error_record "$entry" "$repo_url" "Repository data was not returned by GitHub" >"$output_path"
    printf '\n' >>"$output_path"
    return
  fi
  repo_url=${repository_fields[0]}
  latest_release=${repository_fields[1]}
  latest_tag=${repository_fields[2]}
  default_commit=${repository_fields[3]}

  if [[ -n "$latest_release" ]]; then
    upstream_kind="release"
    upstream_value=$latest_release
  elif [[ -n "$latest_tag" ]]; then
    upstream_kind="tag"
    upstream_value=$latest_tag
  elif [[ -n "$default_commit" ]]; then
    upstream_kind="commit"
    upstream_value=$default_commit
  else
    emit_sync_error_record "$entry" "$repo_url" "Repository has no release, tag, or default-branch commit" >"$output_path"
    printf '\n' >>"$output_path"
    return
  fi

  if [[ "$reviewed_kind" == "none" ]]; then
    status="untracked"
  elif [[ "$reviewed_kind" == "$upstream_kind" && "$reviewed_value" == "$upstream_value" ]]; then
    status="reviewed"
  else
    status="review_required"
  fi

  emit_sync_status_record "$entry" "$repo_url" "$status" "$upstream_kind" "$upstream_value" >"$output_path"
  printf '\n' >>"$output_path"
}

sync() {
  local checked_at repo_slug_value pages_base_url_value tmp entries_path
  local selected_slugs=null selected_count unique_count manifest_count unknown_slugs slug
  local sync_jobs=${PLUGIN_MAINTENANCE_SYNC_JOBS:-4}
  local entry result_path error_path pid
  local -a entries=() result_paths=() active_pids=()

  require_cmd gh
  require_cmd jq
  validate_maintenance_config
  validate_manifest_schema
  [[ "$sync_jobs" =~ ^[1-9][0-9]*$ ]] \
    || die "PLUGIN_MAINTENANCE_SYNC_JOBS must be a positive integer"

  if [[ $# -gt 0 ]]; then
    for slug in "$@"; do
      [[ "$slug" =~ ^[a-z0-9][a-z0-9-]*$ ]] || die "$(sync_usage)"
    done
    selected_slugs=$(printf '%s\n' "$@" | jq -Rsc 'split("\n") | map(select(length > 0))')
    selected_count=$(jq 'length' <<<"$selected_slugs")
    unique_count=$(jq 'unique | length' <<<"$selected_slugs")
    [[ "$selected_count" == "$unique_count" ]] || die "Duplicate plugin slugs are not allowed"

    manifest_count=$(jq --argjson slugs "$selected_slugs" \
      '[.[] | select(.slug as $slug | $slugs | index($slug))] | length' \
      "$MANIFEST_PATH")
    if [[ "$manifest_count" != "$selected_count" ]]; then
      unknown_slugs=$(jq -r --argjson slugs "$selected_slugs" \
        '$slugs - [.[].slug] | join(", ")' \
        "$MANIFEST_PATH")
      die "Unknown plugin slug(s): $unknown_slugs"
    fi
  fi

  mkdir -p "$BUILD_DIR"
  new_temp
  tmp=$TEMP_PATH
  new_temp
  entries_path=$TEMP_PATH
  checked_at=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  repo_slug_value=$(repo_slug)
  pages_base_url_value=$(runtime_pages_base_url)

  jq -c --argjson selected_slugs "$selected_slugs" '
    (if $selected_slugs == null then . else [.[] | select(.slug as $slug | $selected_slugs | index($slug))] end)
    | sort_by(.readme_name | ascii_downcase)[]
  ' "$MANIFEST_PATH" >"$entries_path"
  mapfile -t entries <"$entries_path"

  for entry in "${entries[@]}"; do
    new_temp
    result_path=$TEMP_PATH
    result_paths+=("$result_path")
    new_temp
    error_path=$TEMP_PATH

    sync_entry "$entry" "$result_path" "$error_path" &
    active_pids+=("$!")

    if ((${#active_pids[@]} >= sync_jobs)); then
      wait "${active_pids[0]}"
      active_pids=("${active_pids[@]:1}")
    fi
  done

  for pid in "${active_pids[@]}"; do
    wait "$pid"
  done

  for result_path in "${result_paths[@]}"; do
    cat "$result_path" >>"$tmp"
  done

  jq -s \
    --arg checked_at "$checked_at" \
    --arg repo_slug "$repo_slug_value" \
    --arg pages_base_url "$pages_base_url_value" \
    --arg repo_branch "$(repo_branch)" \
    '{
      schema_version: 3,
      checked_at: $checked_at,
      repo_slug: $repo_slug,
      repo_branch: $repo_branch,
      pages_base_url: $pages_base_url,
      summary: {
        total: length,
        reviewed: (map(select(.status == "reviewed")) | length),
        review_required: (map(select(.status == "review_required")) | length),
        untracked: (map(select(.status == "untracked")) | length),
        error: (map(select(.status == "error")) | length)
      },
      plugins: .
    }' "$tmp" >"$SYNC_PATH"

}

parse_ref_arg() {
  local value=$1
  local allow_none=${2:-0}

  if [[ "$value" == "none" && $allow_none -eq 1 ]]; then
    PARSED_REF_KIND="none"
    PARSED_REF_VALUE=""
    return
  fi

  [[ "$value" == *:* ]] || die "Invalid ref '$value'; expected kind:value"
  PARSED_REF_KIND=${value%%:*}
  PARSED_REF_VALUE=${value#*:}
  case "$PARSED_REF_KIND" in
  release | tag | commit) ;;
  *) die "Invalid ref kind: $PARSED_REF_KIND" ;;
  esac
  [[ -n "$PARSED_REF_VALUE" ]] || die "Ref value cannot be empty"
}

accept() {
  local slug=${1:-}
  local from_arg="" to_arg=""
  local defer_generated=false
  local from_kind from_value to_kind to_value manifest_count current_ref report_count report_status report_ref
  local report_kind report_value repo candidate_sha baseline_sha comparison merge_base_sha
  local tmp manifest_backup readme_backup

  [[ -n "$slug" ]] || die "$(accept_usage)"
  shift

  while [[ $# -gt 0 ]]; do
    case "$1" in
    --from)
      [[ $# -gt 1 ]] || die "$(accept_usage)"
      from_arg=$2
      shift 2
      ;;
    --to)
      [[ $# -gt 1 ]] || die "$(accept_usage)"
      to_arg=$2
      shift 2
      ;;
    --defer-generated)
      defer_generated=true
      shift
      ;;
    *) die "$(accept_usage)" ;;
    esac
  done

  [[ -n "$from_arg" && -n "$to_arg" ]] || die "$(accept_usage)"
  require_cmd jq
  require_sync_report
  validate_manifest_schema

  parse_ref_arg "$from_arg" 1
  from_kind=$PARSED_REF_KIND
  from_value=$PARSED_REF_VALUE
  parse_ref_arg "$to_arg" 0
  to_kind=$PARSED_REF_KIND
  to_value=$PARSED_REF_VALUE

  manifest_count=$(jq --arg slug "$slug" '[.[] | select(.slug == $slug)] | length' "$MANIFEST_PATH")
  [[ "$manifest_count" == "1" ]] || die "Unknown or ambiguous plugin slug: $slug"

  current_ref=$(jq -r --arg slug "$slug" '
    .[] | select(.slug == $slug)
    | if .reviewed_ref == null then "none" else .reviewed_ref.kind + ":" + .reviewed_ref.value end
  ' "$MANIFEST_PATH")

  if [[ "$current_ref" == "$to_kind:$to_value" ]]; then
    printf '%s is already reviewed at %s\n' "$slug" "$current_ref"
    return
  fi

  [[ "$current_ref" == "$from_arg" ]] || die "Stale reviewed baseline for $slug: expected $from_arg, found $current_ref"

  report_count=$(jq --arg slug "$slug" '[.plugins[] | select(.slug == $slug)] | length' "$SYNC_PATH")
  [[ "$report_count" == "1" ]] || die "Plugin $slug is missing or duplicated in $SYNC_PATH"
  report_status=$(jq -r --arg slug "$slug" '.plugins[] | select(.slug == $slug) | .status' "$SYNC_PATH")
  [[ "$report_status" != "error" ]] || die "Cannot accept $slug because upstream resolution failed"
  report_ref=$(jq -r --arg slug "$slug" '
    .plugins[] | select(.slug == $slug)
    | if .upstream_ref == null then "none" else .upstream_ref.kind + ":" + .upstream_ref.value end
  ' "$SYNC_PATH")

  if [[ "$report_ref" != "$to_arg" ]]; then
    report_kind=${report_ref%%:*}
    report_value=${report_ref#*:}
    [[ "$to_kind" == "commit" && "$report_kind" == "commit" ]] ||
      die "Custom acceptance refs are only supported for commit-tracked plugins"
    [[ "$to_value" =~ ^[[:xdigit:]]{40}$ ]] ||
      die "Custom commit refs must use a full 40-character SHA"

    require_cmd gh
    repo=$(jq -r --arg slug "$slug" '.plugins[] | select(.slug == $slug) | .repo' "$SYNC_PATH")
    [[ "$repo" =~ ^[^/]+/[^/]+$ ]] || die "Invalid upstream repository for $slug: $repo"

    candidate_sha=$(gh api "repos/$repo/commits/$to_value" --jq '.sha') ||
      die "Cannot resolve candidate commit $to_value for $slug"
    candidate_sha=${candidate_sha,,}
    to_value=${to_value,,}
    [[ "$candidate_sha" == "$to_value" ]] || die "Candidate commit did not resolve exactly: $to_value"

    comparison=$(gh api "repos/$repo/compare/$candidate_sha...$report_value") ||
      die "Cannot compare candidate $candidate_sha with upstream $report_value"
    merge_base_sha=$(jq -r '.merge_base_commit.sha' <<<"$comparison")
    [[ "$merge_base_sha" == "$candidate_sha" ]] ||
      die "Candidate commit $candidate_sha is not an ancestor of upstream $report_value"

    if [[ "$current_ref" != "none" ]]; then
      [[ "$from_kind" == "commit" ]] ||
        die "Cannot accept an intermediate commit from a non-commit baseline"
      baseline_sha=$(gh api "repos/$repo/commits/$from_value" --jq '.sha') ||
        die "Cannot resolve reviewed baseline $from_value for $slug"
      comparison=$(gh api "repos/$repo/compare/$baseline_sha...$candidate_sha") ||
        die "Cannot compare reviewed baseline $baseline_sha with candidate $candidate_sha"
      merge_base_sha=$(jq -r '.merge_base_commit.sha' <<<"$comparison")
      [[ "$merge_base_sha" == "$baseline_sha" ]] ||
        die "Candidate commit $candidate_sha is not newer than reviewed baseline $baseline_sha"
    fi

    to_arg="commit:$candidate_sha"
  fi

  new_temp
  tmp=$TEMP_PATH

  if [[ "$defer_generated" == "true" ]]; then
    jq --arg slug "$slug" --arg kind "$to_kind" --arg value "$to_value" '
      map(if .slug == $slug then .reviewed_ref = {kind: $kind, value: $value} else . end)
    ' "$MANIFEST_PATH" >"$tmp"
    mv "$tmp" "$MANIFEST_PATH"
    printf 'Accepted %s: %s -> %s (generated files deferred)\n' "$slug" "$from_arg" "$to_arg"
    return
  fi

  new_temp
  manifest_backup=$TEMP_PATH
  new_temp
  readme_backup=$TEMP_PATH
  cp "$MANIFEST_PATH" "$manifest_backup"
  cp "$README_PATH" "$readme_backup"

  if ! (
    jq --arg slug "$slug" --arg kind "$to_kind" --arg value "$to_value" '
      map(if .slug == $slug then .reviewed_ref = {kind: $kind, value: $value} else . end)
    ' "$MANIFEST_PATH" >"$tmp"
    mv "$tmp" "$MANIFEST_PATH"
    write_readme_table
    validate
  ); then
    cp "$manifest_backup" "$MANIFEST_PATH"
    cp "$readme_backup" "$README_PATH"
    rm -f "$tmp" "$manifest_backup" "$readme_backup"
    die "Failed to accept $slug; restored manifest and README"
  fi

  rm -f "$tmp" "$manifest_backup" "$readme_backup"
  printf 'Accepted %s: %s -> %s\n' "$slug" "$from_arg" "$to_arg"
}

validate_pages_dir() {
  local resolved build_resolved

  [[ -n "$PAGES_DIR" ]] || die "Plugin maintenance pages directory cannot be empty"
  require_cmd realpath
  resolved=$(realpath -m -- "$PAGES_DIR")
  build_resolved=$(realpath -m -- "$BUILD_DIR")

  [[ "$resolved" != "$build_resolved" ]] ||
    die "Refusing to replace unsafe pages directory: $resolved"
  [[ "$resolved" == "$build_resolved/"* ]] ||
    die "Pages directory must be inside the build directory: $resolved"
  [[ ! -L "$PAGES_DIR" ]] || die "Refusing to replace symlinked pages directory: $PAGES_DIR"
  PAGES_DIR=$resolved
}

render_pages() {
  local report_path repo_slug_value repo_branch_value plugin_rows summary_html summary_tmp rows_tmp redirect_template

  require_cmd jq
  require_sync_report
  report_path="$SYNC_PATH"
  [[ -f "$PAGE_TEMPLATE_PATH" ]] || die "Missing page template: $PAGE_TEMPLATE_PATH"
  [[ -f "$REDIRECT_TEMPLATE_PATH" ]] || die "Missing redirect template: $REDIRECT_TEMPLATE_PATH"

  repo_slug_value=$(jq -r '.repo_slug' "$report_path")
  repo_branch_value=$(jq -r '.repo_branch' "$report_path")

  validate_pages_dir
  rm -rf "$PAGES_DIR"
  mkdir -p "$PAGES_DIR/plugin-maintenance/badges" "$PAGES_DIR/plugin-maintenance/refs"
  cp "$report_path" "$PAGES_DIR/plugin-maintenance/report.json"

  jq -c '.plugins[]' "$report_path" | while IFS= read -r plugin; do
    local slug status message svg_color reviewed_kind reviewed_value reviewed_badge_text
    local upstream_kind upstream_value upstream_badge_text repo_url reviewed_target upstream_target
    slug=$(jq -r '.slug' <<<"$plugin")
    status=$(jq -r '.status' <<<"$plugin")
    repo_url=$(jq -r '.repo_url' <<<"$plugin")
    reviewed_kind=$(jq -r '.reviewed_ref.kind // "none"' <<<"$plugin")
    reviewed_value=$(jq -r '.reviewed_ref.value // ""' <<<"$plugin")
    reviewed_badge_text=$(ref_badge_text "$reviewed_kind" "$reviewed_value")
    upstream_kind=$(jq -r '.upstream_ref.kind // "none"' <<<"$plugin")
    upstream_value=$(jq -r '.upstream_ref.value // ""' <<<"$plugin")
    upstream_badge_text=$(ref_badge_text "$upstream_kind" "$upstream_value")

    case "$status" in
    reviewed)
      message="reviewed"
      svg_color="#4c1"
      ;;
    review_required)
      message="to review"
      svg_color="#dfb317"
      ;;
  untracked)
    message="untracked"
      svg_color="#fe7d37"
      ;;
    *)
      message="error"
      svg_color="#e05d44"
      ;;
    esac

    render_badge_svg "status" "$message" "$svg_color" \
      "$PAGES_DIR/plugin-maintenance/badges/${slug}-status.svg"
    render_badge_svg "reviewed" "$reviewed_badge_text" "#007ec6" \
      "$PAGES_DIR/plugin-maintenance/badges/${slug}-reviewed.svg"
    render_badge_svg "upstream" "$upstream_badge_text" "#007ec6" \
      "$PAGES_DIR/plugin-maintenance/badges/${slug}-upstream.svg"

    reviewed_target=$(repo_ref_url "$repo_url" "$reviewed_kind" "$reviewed_value")
    upstream_target=$(repo_ref_url "$repo_url" "$upstream_kind" "$upstream_value")
    render_ref_redirect "$reviewed_target" \
      "$PAGES_DIR/plugin-maintenance/refs/${slug}-reviewed.html"
    render_ref_redirect "$upstream_target" \
      "$PAGES_DIR/plugin-maintenance/refs/${slug}-upstream.html"
  done

  summary_html=$(jq -r '
    "<ul class=\"summary\">"
    + "<li><strong>Total:</strong> \(.summary.total)</li>"
    + "<li><strong>Reviewed:</strong> \(.summary.reviewed)</li>"
    + "<li><strong>To Review:</strong> \(.summary.review_required)</li>"
      + "<li><strong>Untracked:</strong> \(.summary.untracked)</li>"
    + "<li><strong>Errors:</strong> \(.summary.error)</li>"
    + "<li><strong>Checked at:</strong> <code>\(.checked_at)</code></li>"
    + "</ul>"
  ' "$report_path")

  plugin_rows=$(jq -r --arg repo_slug "$repo_slug_value" --arg repo_branch "$repo_branch_value" '
    .plugins[]
    | (
      if .upstream_ref then
        if .upstream_ref.kind == "commit" then
          (.upstream_ref.kind + ":" + .upstream_ref.value[0:7])
        else
          (.upstream_ref.kind + ":" + .upstream_ref.value)
        end
      else
        "-"
      end
    ) as $upstream_text
    | (
      if .reviewed_ref == null then
        "none"
      elif .reviewed_ref.kind == "commit" then
        (.reviewed_ref.kind + ":" + .reviewed_ref.value[0:7])
      else
        (.reviewed_ref.kind + ":" + .reviewed_ref.value)
      end
    ) as $reviewed_text
    | (
      if .status == "reviewed" then
        {text: "reviewed", class: "reviewed"}
      elif .status == "review_required" then
        {text: "to review", class: "review-required"}
          elif .status == "untracked" then
            {text: "untracked", class: "untracked"}
      else
        {text: "error", class: "error"}
      end
    ) as $status_badge
    | (
      if .upstream_ref == null then
        ""
      elif .upstream_ref.kind == "commit" then
        .repo_url + "/commit/" + .upstream_ref.value
      elif .upstream_ref.kind == "release" then
        .repo_url + "/releases/tag/" + .upstream_ref.value
      else
        .repo_url + "/tree/" + .upstream_ref.value
      end
    ) as $upstream_url
    | (
      if .status == "review_required" then
        "<a class=\"compare-link\" href=\"" + (.compare_url | @html) + "\">Review diff ↗</a>"
          elif .status == "untracked" then
        "<a class=\"compare-link\" href=\"" + ($upstream_url | @html) + "\">Review upstream ↗</a>"
      else
        ""
      end
    ) as $review_link
    | (
          if .status == "review_required" or .status == "untracked" then
        $review_link
      else
        ""
      end
    ) as $actions_cell
    | "<tr id=\"\(.slug)\" data-status=\"\(.status | @html)\">"
      + "<td><a href=\"https://github.com/\(.repo)\">\(.readme_name | @html)</a></td>"
      + "<td><a href=\"https://github.com/\($repo_slug)/blob/\($repo_branch)/docs/\(.slug).md\">docs/\(.slug).md</a></td>"
      + "<td><a href=\"https://github.com/\($repo_slug)/blob/\($repo_branch)/doc/wezterm-types-plugin.\(.slug).txt\">doc/wezterm-types-plugin.\(.slug).txt</a></td>"
      + "<td><span class=\"badge\"><span class=\"badge__label\">status</span><span class=\"badge__value badge__value--\($status_badge.class)\">\($status_badge.text)</span></span>"
      + (if .status == "error" then "<div class=\"error-text\">" + (.error | @html) + "</div>" else "" end)
      + "</td>"
      + "<td><span class=\"badge\"><span class=\"badge__label\">reviewed</span><span class=\"badge__value badge__value--ref\">\($reviewed_text | @html)</span></span></td>"
      + "<td><span class=\"badge\"><span class=\"badge__label\">upstream</span><span class=\"badge__value badge__value--ref\">\($upstream_text | @html)</span></span></td>"
      + "<td>" + $actions_cell + "</td>"
      + "</tr>"
  ' "$report_path")

  new_temp
  summary_tmp=$TEMP_PATH
  new_temp
  rows_tmp=$TEMP_PATH
  printf '%s\n' "$summary_html" >"$summary_tmp"
  printf '%s\n' "$plugin_rows" >"$rows_tmp"
  awk -v summary_file="$summary_tmp" -v rows_file="$rows_tmp" '
    $0 == "__SUMMARY_HTML__" {
      while ((getline line < summary_file) > 0) print line
      close(summary_file)
      next
    }
    $0 == "__PLUGIN_ROWS__" {
      while ((getline line < rows_file) > 0) print line
      close(rows_file)
      next
    }
    { print }
  ' "$PAGE_TEMPLATE_PATH" >"$PAGES_DIR/plugin-maintenance/index.html"
  rm -f "$summary_tmp" "$rows_tmp"

  redirect_template=$(<"$REDIRECT_TEMPLATE_PATH")
  printf '%s\n' "$redirect_template" >"$PAGES_DIR/index.html"
}

main() {
  local command=${1:-}

  case "$command" in
  generate)
    shift
    generate "$@"
    ;;
  table)
    shift
    table "$@"
    ;;
  validate)
    shift
    validate "$@"
    ;;
  sync)
    shift
    sync "$@"
    ;;
  accept)
    shift
    accept "$@"
    ;;
  render-pages)
    shift
    [[ $# -eq 0 ]] || die "$(main_usage)"
    render_pages
    ;;
  *)
    die "$(main_usage)"
    ;;
  esac
}

main "$@"
