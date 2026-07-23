# Contribution Guidelines

Welcome! First and foremost thank you for wanting to contribute to this project.

Please read the following guidelines to know all the information regarding
contributing code, knowing what to do in specific cases, etc.

---

## Table of Contents

- [Guidelines](#guidelines)
  - [What I Will Not Accept](#what-i-will-not-accept)
  - [Plugins](#plugins)
  - [Plugin Maintenance](#plugin-maintenance)
- [Recommendations](#recommendations)
  - [`pre-commit`](#pre-commit)
- [Annotations Guide](#annotations-guide)

---

## Guidelines

### What I Will Not Accept

- **BAD COMMIT MESSAGES**. Please follow the Conventional Commits standard.
  Read [this guide][conventional_commits] to get familiarized with Conventional Commits.
- **UNCREDITED CODE**. If pulling from somewhere else, _**paste the reference URL in a comment**_.
- **AI-GENERATED CODE**. The code here must be up to date and made with effort.
- **MERGE COMMITS**. Use `git rebase` instead, then force-push to your Pull Request.
- **UNSIGNED COMMITS**. Read [this guide][signing_guide] to know how to sign your commits.
  Unsigned commits will be promptly squashed, manually rebased by the author or rejected altogether
  if the occasion warrants it..
- **NON-UNIX LINE ENDINGS**. Make sure to set your config in your CLI:.
  ```bash
  git config --local core.autocrlf false # If you want to enforce this only in this repository
  git config --local core.eol lf

  git config --global core.autocrlf false # If you want to enforce this in your global settings
  git config --global core.eol lf
  ```
  If you're using Neovim set this in your `init.lua`:
  ```lua
  -- init.lua
  vim.o.fileformat = 'unix' -- RECOMMENDED

  vim.opt.fileformat = 'unix' -- AVOID THIS
  ```

### Plugins

If you're a plugin author and you wish to add type annotations for it, please follow these steps
in order:

- Make sure your plugin isn't already listed either in either [README.md](./README.md)
or [docs/README.md](./docs/README.md). If it is, then make a PR to suggest fixes to the existing
annotations.
- Make a new branch, please avoid a PR from your fork's `main` branch:
  ```bash
  git checkout -b feat/PLUGIN-NAME
  ```
- Execute [`scripts/new-plugin.sh`](./scripts/new-plugin.sh) in your shell:
  ```bash
  ./scripts/new-plugin.sh PLUGIN-NAME # ONLY DASHES `-` ALLOWED!
  ```
  The helper creates the Lua, Markdown, and Vimdoc files and inserts a slug-sorted placeholder entry
  in `metadata/plugins.json`. Replace its `repo` and `readme_name` TODO values before continuing.
- Edit your plugin annotations in [`lua/wezterm/types/plugins`](./lua/wezterm/types/plugins). Use
  other plugin's annotations as references, and make sure to read the [Annotations Guide](#annotations-guide)
  section.
- Edit `docs/<MY-PLUGIN>.md`. Use the other plugin docs as reference.
- Follow the [Plugin Maintenance](#plugin-maintenance) workflow below to register the plugin,
  regenerate the derived files, and run validation.
- Commit then push your changes. Make your PR afterwards.
  - Your commit message must look like this:
    ```
    feat(PLUGIN-NAME): add type annotations
    ```

### Plugin Maintenance

The plugin manifest is the source of truth for the generated `README.md` table and maintenance dashboard.
`metadata/plugin-maintenance.json` records the canonical repository, default branch, and Pages URL used by
tracked generated documentation.

1. Add or update the plugin entry in [`metadata/plugins.json`](./metadata/plugins.json). For new
   plugins, `new-plugin.sh` creates this slug-sorted placeholder:
   ```json
   {
     "slug": "plugin-name",
     "repo": "TODO: replace with owner/repository",
     "readme_name": "TODO: replace with repository display name",
     "reviewed_ref": null
   }
   ```
   Replace both TODO values. `reviewed_ref` records only the last upstream release, tag, or commit
   deliberately reviewed by a maintainer; it does not record annotation provenance or coverage.
   Use `null` when a plugin is not yet tracked by maintenance.

2. For a new plugin, complete every inventory step above. Validation requires exactly one matching
   Lua file, Markdown document, and Vimdoc file.

3. Regenerate the plugin indexes and panvimdoc workflow:
   ```bash
   ./scripts/plugin-maintenance.sh generate
   ```
   This updates the generated sections in `README.md` and `docs/README.md`, plus
   `.github/workflows/panvimdoc_plugins.yml`. Do not edit those generated sections or workflow by
   hand.

4. Run local validation:
   ```bash
   ./scripts/plugin-maintenance.sh validate
   ```
   `validate` checks the maintenance configuration, exact manifest schema and order, every plugin
   inventory, and all generated files for freshness.

5. Use the dedicated issue named `Plugin maintenance: upstream changes to review` for maintenance
   commands. Commands are accepted only on that issue, from collaborators with write access, and
   must be the only content in a comment:
   - `/help` prints the complete command reference.
   - `/accept <slug>` accepts the latest upstream ref. For a commit-tracked plugin,
     `/accept <slug> commit:<full-sha>` accepts an intermediate commit. Combine selections as
     `/accept <slug> [commit:<full-sha>] <slug> [commit:<full-sha>] ...` to open one PR containing
     the selected reviewed-baseline changes in `metadata/plugins.json`.
   - `/refresh` starts the maintenance workflow to refresh the dashboard and issue digest.

6. Review plugins marked `review_required` or `untracked` on the published maintenance dashboard.
   Leave the baseline unchanged while functional work remains outstanding. Acceptance records only
   the reviewed upstream baseline; it does not claim annotation coverage.

7. The maintenance dashboard is published by the `Plugin Maintenance` workflow:
   - every Sunday at `17:00 UTC`;
   - after `/refresh` or a manual workflow run on `main`; and
   - after a push to `main` changes maintenance inputs. Pull requests validate the maintenance
     implementation and plugin inventory but do not publish the site.

8. Before the first upstream run, an administrator must select **GitHub Actions** as the Pages
   publishing source and enable **Allow GitHub Actions to create and approve pull requests** under
   the repository's Actions settings.

9. If the dedicated issue is missing, open the repository's **Actions** tab, select
   **Plugin Maintenance**, choose **Run workflow**, and run it on `main`. After Pages is deployed,
   the workflow creates the labeled issue when at least one plugin needs review. If every plugin is
   reviewed, an existing digest is updated with the all-reviewed state and remains open. Only a
   maintainer may close the issue.

---

## Recommendations

**NOTE**: The following recommendations assume that you're using a UNIX shell
(`bash` / `sh` / `zsh` / ...).

### `pre-commit`

I encourage you to use `pre-commit` to run the hooks contained in
[`.pre-commit-config.yaml`](https://github.com/DrKJeff16/wezterm-types/blob/main/.pre-commit-config.yaml).

To install it, follow [these instructions][pre-commit-install] in the `pre-commit` website.
After that, run the following command in your terminal:

```bash
pre-commit install
```

Now every time you run `git commit` the hooks contained in `.pre-commit-config.yaml` will run.

It is recommended for you to update the hooks if required to:

```bash
pre-commit autoupdate
```

You must then commit the changes to `.pre-commit-config.yaml`.

---

## Annotations Guide

The annotation style is attempting to be more resembling of a LuaCATS style, where possible.
To be concise examples will be given with various situations.

Please respect and follow the annotations style! Willful non-adherance to the annotation style
will result in your PR/Issue being promptly closed!

Here we adhere to documentation as transparent as it can be.

### Types

Prefer setting `---@type` annotations in the same line

```lua
---AVOID
---@type boolean
local x

---CORRECT
local x ---@type boolean
```

An exception can be made if the textwidth grows too much!

```lua
---AVOID
---The textwidth is very big and the types won't fit in the screen
local x, y, z, foo, bar = 1, function() end, true, "bar", nil ---@type integer, function, boolean, string, number|nil

---ACCEPTABLE
---@type integer, function, boolean, string, number|nil
local x, y, z, foo, bar = 1, function() end, true, "bar", nil
```

Also don't use `<type>?` in `---@type` annotations! Please use `<type>|nil` instead!

```lua
---AVOID
local l ---@type string?

---CORRECT
local l ---@type string|nil
```

### Aliases

- Keep aliases to a minimum:

```lua
---PLEASE DON'T DO THIS!

---WRONG
---@alias StringArr string[]
---@alias StringArrDict table<string, StringArr>

---Redundant...
---@alias Foo { foo: 'bar' }
---@alias FooList Foo[]
---...
```

- Avoid redundant aliases at all costs!

```lua
---DON'T DO THIS OH GOD
---@alias MyTable table

---I've seen these types in other projects,
---way more than what my soul can handle...
---@alias Int integer
---@alias Bool boolean
---@alias Str string
```

- If your alias can be turned into a enum, prefer using one:

```lua
---AVOID THIS
---@alias MyChoices
---|"0"
---|"1"
---|"2"
---|"3"
---|"4"
---|"5"
---|"6"
---|"7"
---|"8"
---|"9"
---|"10"
---|"11"
---|"12"
---|"13"
---|"14"
---|"15"
---|"16"
---|"17"
---|"18"
---|"19"
---|"20"
---|"21"
---|"22"
---|"23"
---|"24"
---|"25"
---|"26"
---|"27"
---|"28"
---|"29"
---|"30"
---|"31"
---|"32"
---|"33"

---CORRECT
---Replace the values for whatever you need, if at all.
---@enum (key) MyChoices
local choices = {
  ["0"] = 1,
  ["1"] = 1,
  ["2"] = 1,
  ["3"] = 1,
  ["4"] = 1,
  ["5"] = 1,
  ["6"] = 1,
  ["7"] = 1,
  ["8"] = 1,
  ["9"] = 1,
  ["10"] = 1,
  ["11"] = 1,
  ["12"] = 1,
  ["13"] = 1,
  ["14"] = 1,
  ["15"] = 1,
  ["16"] = 1,
  ["17"] = 1,
  ["18"] = 1,
  ["19"] = 1,
  ["20"] = 1,
  ["21"] = 1,
  ["22"] = 1,
  ["23"] = 1,
  ["24"] = 1,
  ["25"] = 1,
  ["26"] = 1,
  ["27"] = 1,
  ["28"] = 1,
  ["29"] = 1,
  ["30"] = 1,
  ["31"] = 1,
  ["32"] = 1,
  ["33"] = 1,
}
```

- Use brackets in your aliases wisely!

```lua
---Will be parsed as `fun(): (string|string[])`
---@alias ListOrFunction fun(): string|string[]

---Will be parsed as `string[]|fun(): string`
---
---The `fun(): ...` type is a bit funny (AKA a headache)
---@alias ListOrFunction (fun(): string)|string[]
```

[conventional_commits]: https://gist.github.com/qoomon/5dfcdf8eec66a051ecd85625518cfd13
[signing_guide]: https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key
[pre-commit-install]: https://pre-commit.com/#install

<!-- vim: set ts=2 sts=2 sw=2 et ai si sta: -->
