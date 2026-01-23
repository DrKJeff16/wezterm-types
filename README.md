# wezterm-types

[![Mentioned in Awesome WezTerm](https://awesome.re/mentioned-badge.svg)](https://github.com/michaelbrusegard/awesome-wezterm) | [![Mentioned in Awesome Neovim](https://awesome.re/mentioned-badge.svg)](https://github.com/rockerBOO/awesome-neovim)

- [Credits](https://github.com/DrKJeff16/wezterm-types/blob/main/CREDITS.md)
- [Roadmap](https://github.com/DrKJeff16/wezterm-types/discussions/48)
- [Discussions](https://github.com/DrKJeff16/wezterm-types/discussions)

This project aims to provide [LuaCATS](https://github.com/LuaCATS)-like
[Lua Language Server type annotations](https://luals.github.io/wiki/annotations/) for your
[WezTerm](https://github.com/wezterm/wezterm) config.

**NOTE**: While this was made with an aim to be thorough you should always double-check
the [WezTerm Lua Reference](https://wezterm.org/config/lua/general.html) for any missing
or unclear types.

**Examples can be found in**
[EXAMPLES.md](https://github.com/DrKJeff16/wezterm-types/blob/main/EXAMPLES.md).

---

## Table of Contents

- [Features](#features)
- [Installation](#installation)
  - [Neovim](#neovim)
  - [LuaRocks](#luarocks)
- [Usage](#usage)
- [Structure](#structure)
- [License](#license)

---

## Features

- LuaCATS-like type annotations
- [Built-in colorschemes included](./lua/wezterm/types/colorschemes.lua) (`config.color_scheme`)
- Up-to-date descriptions
- Function overrides (_e.g. `wezterm.on()`_)
- Neovim support through [`folke/lazydev.nvim`](https://github.com/folke/lazydev.nvim)
- VSCode/VSCodium support by cloning this into `~/.config/wezterm`,
  and editing your config in that directory

---

## Installation

### Neovim

For [Neovim](https://github.com/neovim/neovim) users, we recommend using
[`folke/lazy.nvim`](https://github.com/folke/lazy.nvim) as a package manager,
to be used with [`folke/lazydev.nvim`](https://github.com/folke/lazydev.nvim):

```lua
{
  'folke/lazydev.nvim',
  ft = 'lua',
  dependencies = {
    {
      'DrKJeff16/wezterm-types',
      lazy = true,
      version = false, -- Get the latest version
    },
  },
  opts = {
    library = {
      -- Other library configs...
      { path = 'wezterm-types', mods = { 'wezterm' } },
    },
  },
}
```

If you download this repo under a diferent name, you can use the following instead:

```lua
{
  'folke/lazydev.nvim',
  ft = 'lua',
  dependencies = {
    {
      'DrKJeff16/wezterm-types',
      lazy = true,
      name = '<my_custom_name>', -- CUSTOM DIRECTORY NAME
      version = false, -- Get the latest version
    },
  },
  opts = {
    library = {
      -- MAKE SURE TO MATCH THE PLUGIN DIRECTORY'S NAME
      { path = '<my_custom_name>', mods = { 'wezterm' } },
    },
  },
}
```

### LuaRocks

You can now install this with LuaRocks:

```bash
luarocks install wezterm-types # Global install
luarocks install --local wezterm-types # Local install
```

---

## Usage

After installing the types, add the type annotations to `wezterm` and `config` respectively
when running `require("wezterm")` in your configuration.

A useful example:

```lua
local wezterm = require("wezterm") ---@type Wezterm

local config = wezterm.config_builder() ---@type Config

config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW"

return config
```

These annotations enable the **Lua Language Server** to provide proper type checking
and autocompletion for WezTerm configuration options.

---

## Collaborators

<!-- readme: collaborators -start -->
<table>
	<tbody>
		<tr>
            <td align="center">
                <a href="https://github.com/gonstoll">
                    <img src="https://avatars.githubusercontent.com/u/25900010?v=4" width="100;" alt="gonstoll"/>
                    <br />
                    <sub><b>Gonzalo Stoll</b></sub>
                </a>
            </td>
            <td align="center">
                <a href="https://github.com/DrKJeff16">
                    <img src="https://avatars.githubusercontent.com/u/72052712?v=4" width="100;" alt="DrKJeff16"/>
                    <br />
                    <sub><b>Guennadi Maximov C</b></sub>
                </a>
            </td>
            <td align="center">
                <a href="https://github.com/justinsgithub">
                    <img src="https://avatars.githubusercontent.com/u/74565194?v=4" width="100;" alt="justinsgithub"/>
                    <br />
                    <sub><b>Justin Angeles</b></sub>
                </a>
            </td>
		</tr>
	<tbody>
</table>
<!-- readme: collaborators -end -->

## Contributors

<!-- readme: contributors -start -->
<table>
	<tbody>
		<tr>
            <td align="center">
                <a href="https://github.com/DrKJeff16">
                    <img src="https://avatars.githubusercontent.com/u/72052712?v=4" width="100;" alt="DrKJeff16"/>
                    <br />
                    <sub><b>Guennadi Maximov C</b></sub>
                </a>
            </td>
            <td align="center">
                <a href="https://github.com/justinsgithub">
                    <img src="https://avatars.githubusercontent.com/u/74565194?v=4" width="100;" alt="justinsgithub"/>
                    <br />
                    <sub><b>Justin Angeles</b></sub>
                </a>
            </td>
            <td align="center">
                <a href="https://github.com/craigmac">
                    <img src="https://avatars.githubusercontent.com/u/7416158?v=4" width="100;" alt="craigmac"/>
                    <br />
                    <sub><b>C.D. MacEachern</b></sub>
                </a>
            </td>
            <td align="center">
                <a href="https://github.com/chrisgrieser">
                    <img src="https://avatars.githubusercontent.com/u/73286100?v=4" width="100;" alt="chrisgrieser"/>
                    <br />
                    <sub><b>Chris Grieser</b></sub>
                </a>
            </td>
            <td align="center">
                <a href="https://github.com/AtifChy">
                    <img src="https://avatars.githubusercontent.com/u/42291930?v=4" width="100;" alt="AtifChy"/>
                    <br />
                    <sub><b>Md. Iftakhar Awal Chowdhury</b></sub>
                </a>
            </td>
            <td align="center">
                <a href="https://github.com/TheLeoP">
                    <img src="https://avatars.githubusercontent.com/u/53507599?v=4" width="100;" alt="TheLeoP"/>
                    <br />
                    <sub><b>Luis Calle</b></sub>
                </a>
            </td>
		</tr>
		<tr>
            <td align="center">
                <a href="https://github.com/reegnz">
                    <img src="https://avatars.githubusercontent.com/u/5672001?v=4" width="100;" alt="reegnz"/>
                    <br />
                    <sub><b>Zoltán Reegn</b></sub>
                </a>
            </td>
            <td align="center">
                <a href="https://github.com/Zuyoutoki">
                    <img src="https://avatars.githubusercontent.com/u/4701322?v=4" width="100;" alt="Zuyoutoki"/>
                    <br />
                    <sub><b>Zuyoutoki</b></sub>
                </a>
            </td>
		</tr>
	<tbody>
</table>
<!-- readme: contributors -end -->

---

## License

[MIT](https://github.com/DrKJeff16/wezterm-types/blob/main/LICENSE)

---

<a href="https://www.star-history.com/#DrKJeff16/wezterm-types&type=date&legend=bottom-right">
<picture>
<source
media="(prefers-color-scheme: dark)"
srcset="https://api.star-history.com/svg?repos=DrKJeff16/wezterm-types&type=date&theme=dark&legend=bottom-right"
/>
<source
media="(prefers-color-scheme: light)"
srcset="https://api.star-history.com/svg?repos=DrKJeff16/wezterm-types&type=date&legend=bottom-right"
/>
<img
alt="Star History Chart"
src="https://api.star-history.com/svg?repos=DrKJeff16/wezterm-types&type=date&legend=bottom-right"
/>
</picture>
</a>

<!-- vim: set ts=2 sts=2 sw=2 et ai si sta: -->
