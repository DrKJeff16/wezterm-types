# Contribution Guidelines

Welcome! First and foremost thank you for wanting to contribute to this project.

Please read the following guidelines to know all the information regarding
contributing code, knowing what to do in specific cases, etc.

---

## Table of Contents

- [Guidelines](#guidelines)
  - [What I Will Not Accept](#what-i-will-not-accept)
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
