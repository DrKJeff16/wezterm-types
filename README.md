<div align="center">

# wezterm-types

[![Mentioned in Awesome WezTerm](https://awesome.re/mentioned-badge.svg)](https://github.com/michaelbrusegard/awesome-wezterm) | [![Mentioned in Awesome Neovim](https://awesome.re/mentioned-badge.svg)](https://github.com/rockerBOO/awesome-neovim)

[Credits](/CREDITS.md) | [Roadmap](https://github.com/DrKJeff16/wezterm-types/discussions/48) | [Discussions](https://github.com/DrKJeff16/wezterm-types/discussions)

This project aims to provide <a href="https://github.com/LuaCATS" target="_blank" referrerpolicy="no-referrer">LuaCATS</a>-like
<a href="https://luals.github.io/wiki/annotations/" target="_blank" referrerpolicy="no-referrer">Lua Language Server type annotations</a>
for your [WezTerm](https://github.com/wezterm/wezterm) config.

</div>

> [!IMPORTANT]
> While this was made with an aim to be thorough, you should always double-check
> the [WezTerm Lua Reference](https://wezterm.org/config/lua/general.html) for any missing or unclear types.

---

<details>
<summary>Example in <a href="https://github.com/neovim/neovim">Neovim</a></summary>

https://github.com/user-attachments/assets/02c261ac-5744-4f34-b767-48095386e21b

</details>
<details>
<summary>Example in VSCodium/VSCode</summary>

https://github.com/user-attachments/assets/3693aedf-b790-4618-b969-1b712010bd4f

</details>

---

## Table of Contents

- [Features](#features)
- [Installation](#installation)
    - [Neovim](#neovim)
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
- VSCode/VSCodium support by cloning this into `~/.config/wezterm`, and editing your config in that directory

---

## Installation

### Neovim

For [Neovim](https://github.com/neovim/neovim) users, we recommend using
[`folke/lazy.nvim`](https://github.com/folke/lazy.nvim) as a package manager, to be used with [`folke/lazydev.nvim`](https://github.com/folke/lazydev.nvim):

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

> [!TIP]
> If you download this repo under a diferent name, you can use the following instead:
>
> ```lua
> {
>   'folke/lazydev.nvim',
>   ft = 'lua',
>   dependencies = {
>     {
>       'DrKJeff16/wezterm-types',
>       lazy = true,
>       name = '<my_custom_name>', -- CUSTOM DIRECTORY NAME
>       version = false, -- Get the latest version
>     },
>   },
>   opts = {
>     library = {
>       -- Other library configs...
>       { path = '<my_custom_name>', mods = { 'wezterm' } }, -- MAKE SURE TO MATCH THE PLUGIN DIRECTORY'S NAME
>     },
>   },
> }
> ```

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

These annotations enable the **Lua Language Server** to provide
proper type checking and autocompletion for WezTerm configuration options.

---

## Structure

<details>
<summary>The project is structured as such.</summary>

```
/lua/wezterm/types/
├── colorschemes.lua  <==  Contains the builtin `config.color_schemes` values
├── config.lua  <==  Contains the `Config` class and related data types
├── enum.lua  <==   Imports all the `enum/` files
├── enum/  <==   Enum types
│   ├── copy-mode-assignment.lua  <==  `CopyModeAssignment` enum types
│   └── key-assignment.lua  <==   `KeyAssignment` enum types
├── events.lua  <==  Imports all the `events/` files
├── events/  <==  Events type files
│   ├── gui.lua  <==  `Gui` event types
│   ├── multiplexer.lua  <==  `Mux` event types
│   └── window.lua  <==  `Window` event types
├── objects.lua  <==  Imports all the `objects/` files
├── objects/  <==  Objects type files
│   ├── color.lua  <==  `Color` object types
│   ├── exec-domain.lua  <==  `ExecDomain` object types
│   ├── local-process-info.lua  <==  `LocalProcessInfo` object types
│   ├── mux-domain.lua  <==  `MuxDomain` object types
│   ├── mux-tab.lua  <==  `MuxTab` object types
│   ├── mux-window.lua  <==  `MuxWindow` object types
│   ├── pane-information.lua  <==  `PaneInformation` object types
│   ├── pane.lua  <==  `Pane` object types
│   ├── spawn-command.lua  <==  `SpawnCommand` object types
│   ├── ssh-domain.lua  <==  `SshDomain` object types
│   ├── tab-information.lua  <==  `TabInformation` object types
│   ├── time.lua  <==  `Time` object types
│   ├── tls-domain-client.lua  <==  `TlsDomainClient` object types
│   ├── tls-domain-server.lua  <==  `TlsDomainServer` object types
│   ├── window.lua  <==  `Window` object types
│   └── wsl-domain.lua  <==  `WslDomain` object types
├── wezterm.lua  <==  Imports all the surrounding files, including the `wezterm/` directory
├── wezterm/  <==  Types for the `wezterm` module
│   ├── color.lua  <==  `Wezterm.Color` module types
│   ├── gui.lua  <==  `Wezterm.Gui` module types
│   ├── mux.lua  <==  `Wezterm.Mux` module types
│   ├── nerdfonts.lua  <==  `Wezterm.NerdFonts` module types
│   ├── plugin.lua  <==  `Wezterm.Plugin` module types
│   ├── procinfo.lua  <==  `Wezterm.ProcInfo` module types
│   ├── serde.lua  <==  `Wezterm.Serde` module types
│   ├── time.lua  <==  `Wezterm.Time` module types
└───└── url.lua  <==  `Wezterm.Url` module types
```

</details>

---

## License

[MIT](./LICENSE)

---

<div align="center">
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
</div>
