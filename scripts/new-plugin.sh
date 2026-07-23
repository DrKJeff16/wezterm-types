#!/usr/bin/env bash
#
# Create new plugin from template
#

TARGET_DIR="lua/wezterm/types/plugins"
TEMPLATE="template.lua"
TEMPLATE_DOC="template.md"
MANIFEST="metadata/plugins.json"
TARGET="$1"
BACKUPS=()

# Print each argument as a line to stderr
error() {
    local TXT=("$@")
    printf "%s\n" "${TXT[@]}" >&2
    return 0
}

# Check if one or more commands exist.
#
# Returns 0 (success) if all arguments are valid commands, otherwise 1 (error).
# Returns 127 (error) if no arguments are passed.
#
# Usage: _cmd_exists <PROG> [<PROG> [...]]
_cmd_exists() {
    [[ $# -eq 0 ]] && return 127
    while [[ $# -gt 0 ]]; do
        ! command -v "$1" &> /dev/null && return 1
        shift
    done
    return 0
}

# Delete all temporary files, then kill the program execution with an optional exit code.
#
# This function can also print a set of messages to either stdout or stderr
# depending on the exit code.
#
# Usage: die [[<EXIT_CODE>] <MESSAGE> [<MESSAGE> [...]]]
die() {
    rm -f "${BACKUPS[@]}"

    local EC=0
    if [[ $# -ge 1 ]] && [[ $1 =~ ^(0|-?[1-9][0-9]*)$ ]]; then
        EC="$1"
        shift
    fi
    if [[ $# -ge 1 ]]; then
        local TXT=("$@")
        if [[ $EC -eq 0 ]]; then
            printf "%s\n" "${TXT[@]}"
        else
            error "${TXT[@]}"
        fi
    fi
    exit "$EC"
}

_file_readable_writeable() {
    [[ $# -eq 0 ]] && return 127
    [[ -f "$1" ]] || return 1
    [[ -r "$1" ]] || return 1
    [[ -w "$1" ]] || return 1
    return 0
}

_file_rw_not_empty() {
    [[ $# -eq 0 ]] && return 127

    _file_readable_writeable "$1" || return 1
    [[ -s "$1" ]] || return 1

    return 0
}

[[ $# -eq 0 ]] && die 127 "No arguments!"

! _cmd_exists 'cp' 'jq' 'mktemp' 'mv' 'touch' \
    && die 1 "One or more required commands are not available: cp, jq, mktemp, mv, touch"

[[ "$TARGET" =~ ^[a-z0-9][a-z0-9-]*$ ]] \
    || die 1 "Invalid plugin slug: $TARGET (use lowercase letters, numbers, and dashes)"
[[ -f "$MANIFEST" ]] || die 1 "Missing plugin manifest: $MANIFEST"

jq -e --arg slug "$TARGET" 'all(.[]; .slug != $slug)' "$MANIFEST" >/dev/null \
    || die 1 "Plugin \`$TARGET\` is already registered in $MANIFEST"

_file_rw_not_empty "${TARGET_DIR}/${TARGET}.lua" \
    && die 1 "${TARGET}.lua already exists and is not empty!"

if ! [[ -f "${TARGET_DIR}/${TARGET}.lua" ]]; then
    cp -v "scripts/${TEMPLATE}" "${TARGET_DIR}/${TARGET}.lua" || exit 1
fi

if ! _file_rw_not_empty "docs/${TARGET}.md"; then
    cp -v "scripts/${TEMPLATE_DOC}" "docs/${TARGET}.md" || exit 1
fi

if ! _file_rw_not_empty "doc/wezterm-types-plugin.${TARGET}.txt"; then
    touch "doc/wezterm-types-plugin.${TARGET}.txt"
    echo "Created \`doc/wezterm-types-plugin.${TARGET}.txt\`"
fi

MANIFEST_TMP=$(mktemp)
BACKUPS+=("$MANIFEST_TMP")
jq --arg slug "$TARGET" '
    . + [{
        slug: $slug,
        repo: "TODO: replace with owner/repository",
        readme_name: "TODO: replace with repository display name",
        reviewed_ref: null
    }]
    | sort_by(.slug)
' "$MANIFEST" >"$MANIFEST_TMP" || die 1 "Failed to update $MANIFEST"
mv "$MANIFEST_TMP" "$MANIFEST" || die 1 "Failed to replace $MANIFEST"

die 0 \
    "Added a placeholder entry for \`$TARGET\` to $MANIFEST." \
    "Next steps:" \
    "1. Replace both TODO values in $MANIFEST." \
    "2. Run ./scripts/plugin-maintenance.sh generate." \
    "3. Complete the Lua and Markdown stubs, then run ./scripts/plugin-maintenance.sh validate."
