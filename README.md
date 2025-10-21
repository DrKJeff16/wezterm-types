<div align="center">

# wezterm-types

[![Mentioned in Awesome WezTerm](https://awesome.re/mentioned-badge.svg)](https://github.com/michaelbrusegard/awesome-wezterm) | [![Mentioned in Awesome Neovim](https://awesome.re/mentioned-badge.svg)](https://github.com/rockerBOO/awesome-neovim)

[Roadmap](https://github.com/DrKJeff16/wezterm-types/discussions/48) | [Discussions](https://github.com/DrKJeff16/wezterm-types/discussions)

This project aims to provide LuaCATS-like [Lua Language Server](https://luals.github.io/) type annotations
for your [WezTerm](https://github.com/wezterm/wezterm) config.

</div>

> [!IMPORTANT]
> While this was made with an aim to be thorough, you should always double-check
> the [WezTerm Lua Reference](https://wezterm.org/config/lua/general.html) for any
> missing or unclear types.

---

<details>
<summary><b>Example in <a href="https://github.com/neovim/neovim">Neovim</a></b></summary>

https://github.com/user-attachments/assets/02c261ac-5744-4f34-b767-48095386e21b

</details>
<br />
<details>
<summary><b>Example in VSCodium (VSCode)</b></summary>

https://github.com/user-attachments/assets/3693aedf-b790-4618-b969-1b712010bd4f

</details>

---

## Table of Contents

1. [Features](#features)
2. [Installation](#installation)
    1. [Neovim](#neovim)
3. [Usage](#usage)
4. [Credits](#credits)
    1. [Maintainers](#maintainers)
    2. [Maintainers](#maintainers)
5. [Structure](#structure)

---

## Features

- LuaCATS-like type annotations
- Built-in colorschemes included (`config.color_scheme`)
- Up to date descriptions
- Function overrides (_e.g. `wezterm.on()`_)
- Neovim support through [`lazydev.nvim`](https://github.com/folke/lazydev.nvim)
- VSCode/VSCodium support by cloning this into `~/.config/wezterm`, and editing your config in that directory

---

## Installation

### Neovim

For [Neovim](https://github.com/neovim/neovim) users, we recommend using
[`lazy.nvim`](https://github.com/folke/lazy.nvim) as a package manager, to be used with
[`lazydev`](https://github.com/folke/lazydev.nvim):

```lua
require('lazy').setup({
  spec = {
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
    },
  },
})
```

> [!TIP]
> If you download this repo under a diferent name, you can use the following instead:
>
> ```lua
> {
>   {
>     'folke/lazydev.nvim',
>     ft = 'lua',
>     dependencies = {
>       {
>         'DrKJeff16/wezterm-types',
>         lazy = true,
>         name = '<my_custom_name>', -- CUSTOM DIRECTORY NAME
>         version = false, -- Get the latest version
>       },
>     },
>     opts = {
>       library = {
>         -- Other library configs...
>         { path = '<my_custom_name>', mods = { 'wezterm' } }, -- MAKE SURE TO MATCH THE PLUGIN DIRECTORY'S NAME
>       },
>     },
>   },
> }
> ```

---

## Usage

After installing the types, add the type annotations to `wezterm` and `config` respectively
when requiring wezterm in your configuration:

```lua
---@type Wezterm
local wezterm = require("wezterm")

---@type Config
local config = wezterm.config_builder()

-- Your configuration here with full type support
config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW"

return config
```

These annotations enable the **Lua Language Server** to provide
proper type checking and autocompletion for WezTerm configuration options.

---

## Credits

### Maintainers

- [@DrKJeff16](https://github.com/DrKJeff16) **Current owner**
- [@justinsgithub](https://github.com/justinsgithub) - **Author**
- [@gonstoll](https://github.com/gonstoll)

### Contributors

- [@TheLeoP](https://github.com/TheLeoP)
- [@reegnz](https://github.com/reegnz)
- [@Zuyoutoki](https://github.com/Zuyoutoki)
- [@AtifChy](https://github.com/AtifChy)

---

## Structure

The project is structured the following way:

```
/lua/wezterm/types/
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

## License

[MIT](./LICENSE)
