<div align="center">

# wezterm-types

[Wezterm](https://github.com/wezterm/wezterm) config types for [Lua Language Server](https://luals.github.io/)

</div>

Example in [Neovim](https://github.com/neovim/neovim):

![Neovim Demonstration](https://github.com/user-attachments/assets/c9082e54-39ad-4c7d-8d81-ddf0b1fb1fc7)

---

## Table of Contents

1. [Roadmap](#roadmap)
2. [Installation](#installation)
    1. [Neovim](#neovim)
3. [Usage](#usage)
4. [Credits](#credits)
    1. [Maintainers](#maintainers)
    2. [Maintainers](#maintainers)
5. [Structure](#structure)

---

## Roadmap

<div align="center">

<b><ins>You can find the current roadmap</ins> <i><a href="https://github.com/DrKJeff16/wezterm-types/discussions/48" target="_self" rel="noreferrer">here</a></i></b>

</div>

---

## Installation

### Neovim

For [Neovim](https://github.com/neovim/neovim) users, we recommend the following install method.

Using [`lazy.nvim`](https://github.com/folke/lazy.nvim) as a package manager, install this together with
[`lazydev`](https://github.com/folke/lazydev.nvim):

```lua
require('lazy').setup({
  spec = {
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      dependencies = {
        { 'DrKJeff16/wezterm-types', lazy = true },
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

<details>
<summary><b><ins>NOTE: If you assign a custom `name` field for the plugin</ins></b></summary>

```lua
{
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    dependencies = {
      {
        'DrKJeff16/wezterm-types',
        name = '<my_custom_name>', -- CUSTOM DIRECTORY NAME
        lazy = true,
      },
    },
    opts = {
      library = {
        -- Other library configs...

        -- MAKE SURE TO MATCH THE PLUGIN DIRECTORY'S NAME
        { path = '<my_custom_name>', mods = { 'wezterm' } },
      },
    },
  },
}
```

</details>

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

- [@DrKJeff16](https://github.com/DrKJeff16) - **Maintainer, _(current owner)_**
- [@justinsgithub](https://github.com/justinsgithub) - **The Author _(not active currently)_**
- [@gonstoll](https://github.com/gonstoll) - **Maintainer**

### Contributors

- [@TheLeoP](https://github.com/TheLeoP) - **Contributor**

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
