# wezterm-types

<p><a href="https://github.com/michaelbrusegard/awesome-wezterm"><img alt="Mentioned in Awesome WezTerm" src="https://awesome.re/mentioned-badge.svg" /></a><br /><a href="https://github.com/rockerBOO/awesome-neovim"><img alt="Mentioned in Awesome Neovim" src="https://awesome.re/mentioned-badge.svg" /></a></p>

<img alt="Showcase" src="https://github.com/DrKJeff16/wezterm-types/blob/main/assets/showcase.png" />

This project aims to provide LuaCATS-like
[LuaLS type annotations](https://luals.github.io/wiki/annotations/) for your
[WezTerm](https://github.com/wezterm/wezterm) config.

Example videos can be found in
[EXAMPLES.md](https://github.com/DrKJeff16/wezterm-types/blob/main/EXAMPLES.md).

NOTE: For any missing or unclear types you should always double-check the
[WezTerm Lua Reference](https://wezterm.org/config/lua/general.html). If using an annotated plugin
featured in this repository please refer to its author for any unclear types.

## Features

- LuaCATS-like type annotations
- Built-in colorschemes included (`config.color_scheme`)
- Up-to-date descriptions
- Community plugin annotations
- Neovim support
  - Through lazydev.nvim
  - Through the built-in LSP API
- VSCode/VSCodium support by cloning this into `~/.config/wezterm`, then editing your config
  in that directory

---

## Table of Contents

- [Installation](#installation)
- [Featured Plugins](#featured-plugins)
- [Usage](#usage)

---

## Installation

### LuaRocks

You can install `wezterm-types` using LuaRocks:

```bash
luarocks install wezterm-types # Global install
luarocks install --local wezterm-types # Local install
```

To get it running in Neovim please refer to
[this discussion](https://github.com/DrKJeff16/wezterm-types/discussions/93).

### Neovim

We recommend using [folke/lazy.nvim](https://github.com/folke/lazy.nvim) as a package manager:

```lua
{
  'DrKJeff16/wezterm-types',
  version = false, -- Get the latest version
},
```

---

## Featured Plugins

This project also features type annotations for various WezTerm plugins.

**_If you want to have your plugin featured please request it through an issue._**

| Plugin                                                                                                | Documentation                                                            | Neovim Help                                                                                         |
|-------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| [ai-commander.wezterm](https://github.com/dimao/ai-commander.wezterm)                               | [docs/ai-commander.md](./docs/ai-commander.md)                         | [:h wezterm-types-ai-commander.txt](./doc/wezterm-types-ai-commander.txt)                         |
| [ai-helper.wezterm](https://github.com/Michal1993r/ai-helper.wezterm)                               | [docs/ai-helper.md](./docs/ai-helper.md)                               | [:h wezterm-types-ai-helper.txt](./doc/wezterm-types-ai-helper.txt)                               |
| [bar.wezterm](https://github.com/adriankarlen/bar.wezterm)                                          | [docs/bar_wezterm.md](./docs/bar_wezterm.md)                           | [:h wezterm-types-bar_wezterm.txt](./doc/wezterm-types-bar_wezterm.txt)                           |
| [battery.wez](https://github.com/rootiest/battery.wez)                                              | [docs/battery_wez.md](./docs/battery_wez.md)                           | [:h wezterm-types-battery_wez.txt](./doc/wezterm-types-battery_wez.txt)                           |
| [dev.wezterm](https://github.com/ChrisGVE/dev.wezterm)                                              | [docs/dev-wezterm.md](./docs/dev-wezterm.md)                           | [:h wezterm-types-dev-wezterm.txt](./doc/wezterm-types-dev-wezterm.txt)                           |
| [lib.wezterm](https://github.com/ChrisGVE/lib.wezterm)                                              | [docs/lib-wezterm.md](./docs/lib-wezterm.md)                           | [:h wezterm-types-lib-wezterm.txt](./doc/wezterm-types-lib-wezterm.txt)                           |
| [listeners.wezterm](https://github.com/ChrisGVE/listeners.wezterm)                                  | [docs/listeners-wezterm.md](./docs/listeners-wezterm.md)               | [:h wezterm-types-listeners-wezterm.txt](./doc/wezterm-types-listeners-wezterm.txt)               |
| [modal.wezterm](https://github.com/MLFlexer/modal.wezterm)                                          | [docs/modal_wezterm.md](./docs/modal_wezterm.md)                       | [:h wezterm-types-modal_wezterm.txt](./doc/wezterm-types-modal_wezterm.txt)                       |
| [pinned-tabs.wezterm](https://github.com/selectnull/pinned-tabs.wezterm)                            | [docs/pinned-tabs.md](./docs/pinned-tabs.md)                           | [:h wezterm-types-pinned-tabs.txt](./doc/wezterm-types-pinned-tabs.txt)                           |
| [pivot_panes.wezterm](https://github.com/ChrisGVE/pivot_panes.wezterm)                              | [docs/pivot_panes.md](./docs/pivot_panes.md)                           | [:h wezterm-types-pivot_panes.txt](./doc/wezterm-types-pivot_panes.txt)                           |
| [presentation.wez](https://github.com/xarvex/presentation.wez)                                      | [docs/presentation_wez.md](./docs/presentation_wez.md)                 | [:h wezterm-types-presentation_wez.txt](./doc/wezterm-types-presentation_wez.txt)                 |
| [quick_domains.wezterm](https://github.com/DavidRR-F/quick_domains.wezterm)                         | [docs/quick_domains.md](./docs/quick_domains.md)                       | [:h wezterm-types-quick_domains.txt](./doc/wezterm-types-quick_domains.txt)                       |
| [resurrect.wezterm](https://github.com/DavidRR-F/resurrect.wezterm)                                 | [docs/resurrect.md](./docs/resurrect.md)                               | [:h wezterm-types-resurrect.txt](./doc/wezterm-types-resurrect.txt)                               |
| [rosepine](https://github.com/neapsix/wezterm)                                                      | [docs/rosepine.md](./docs/rosepine.md)                                 | [:h wezterm-types-rosepine.txt](./doc/wezterm-types-rosepine.txt)                                 |
| [sessionizer.wezterm](https://github.com/mrjones2014/sessionizer.wezterm)                           | [docs/sessionizer.md](./docs/sessionizer.md)                           | [:h wezterm-types-sessionizer.txt](./doc/wezterm-types-sessionizer.txt)                           |
| [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim)                               | [docs/smart-splits.md](./docs/smart-splits.md)                         | [:h wezterm-types-smart-splits.txt](./doc/wezterm-types-smart-splits.txt)                         |
| [smart_workspace_switcher.wezterm](https://github.com/MLFlexer/smart_workspace_switcher.wezterm) | [docs/smart_workspace_switcher.md](./docs/smart_workspace_switcher.md) | [:h wezterm-types-smart_workspace_switcher.txt](./doc/wezterm-types-smart_workspace_switcher.txt) |
| [stack.wez](https://github.com/bad-noodles/stack.wez)                                               | [docs/stack-wez.md](./docs/stack-wez.md)                               | [:h wezterm-types-stack-wez.txt](./doc/wezterm-types-stack-wez.txt)                               |
| [tabline.wez](https://github.com/michaelbrusegard/tabline.wez)                                      | [docs/tabline_wez.md](./docs/tabline_wez.md)                           | [:h wezterm-types-tabline_wez.txt](./doc/wezterm-types-tabline_wez.txt)                           |
| [tabsets.wezterm](https://github.com/srackham/tabsets.wezterm)                                      | [docs/tabsets.md](./docs/tabsets.md)                                   | [:h wezterm-types-tabsets.txt](./doc/wezterm-types-tabsets.txt)                                   |
| [toggle_terminal.wez](https://github.com/zsh-sage/toggle_terminal.wez)                              | [docs/toggle_terminal.md](./docs/toggle_terminal.md)                   | [:h wezterm-types-toggle_terminal.txt](./doc/wezterm-types-toggle_terminal.txt)                   |
| [wez-pain-control](https://github.com/sei40kr/wez-pain-control)                                     | [docs/wez-pain-control.md](./docs/wez-pain-control.md)                 | [:h wezterm-types-wez-pain-control.txt](./doc/wezterm-types-wez-pain-control.txt)                 |
| [wez-tmux](https://github.com/sei40kr/wez-tmux)                                                     | [docs/wez-tmux.md](./docs/wez-tmux.md)                                 | [:h wezterm-types-wez-tmux.txt](./doc/wezterm-types-wez-tmux.txt)                                 |
| [wezterm-cmd-sender](https://github.com/aureolebigben/wezterm-cmd-sender)                           | [docs/cmd-sender.md](./docs/cmd-sender.md)                             | [:h wezterm-types-cmd-sender.txt](./doc/wezterm-types-cmd-sender.txt)                             |
| [wezterm-config.nvim](https://github.com/winter-again/wezterm-config.nvim)                          | [docs/wezterm-config.md](./docs/wezterm-config.md)                     | [:h wezterm-types-wezterm-config.txt](./doc/wezterm-types-wezterm-config.txt)                     |
| [wezterm-status](https://github.com/yriveiro/wezterm-status)                                        | [docs/wezterm-status.md](./docs/wezterm-status.md)                     | [:h wezterm-types-wezterm-status.txt](./doc/wezterm-types-wezterm-status.txt)                     |
| [wezterm-tabs](https://github.com/yriveiro/wezterm-tabs)                                            | [docs/wezterm-tabs.md](./docs/wezterm-tabs.md)                         | [:h wezterm-types-wezterm-tabs.txt](./doc/wezterm-types-wezterm-tabs.txt)                         |
| [wezterm-theme-rotator](https://github.com/koh-sh/wezterm-theme-rotator)                            | [docs/wezterm-theme-rotator.md](./docs/wezterm-theme-rotator.md)       | [:h wezterm-types-wezterm-theme-rotator.txt](./doc/wezterm-types-wezterm-theme-rotator.txt)       |
| [workspace-picker.wezterm](https://github.com/isseii10/workspace-picker.wezterm)                    | [docs/workspace-picker.md](./docs/workspace-picker.md)                 | [:h wezterm-types-workspace-picker.txt](./doc/wezterm-types-workspace-picker.txt)                 |
| [workspacesionizer.wezterm](https://github.com/vieitesss/workspacesionizer.wezterm)                 | [docs/workspacesionizer.md](./docs/workspacesionizer.md)               | [:h wezterm-types-workspacesionizer.txt](./doc/wezterm-types-workspacesionizer.txt)               |
| [wsinit.wezterm](https://github.com/JuanraCM/wsinit.wezterm)                                        | [docs/wsinit.md](./docs/wsinit.md)                                     | [:h wezterm-types-wsinit.txt](./doc/wezterm-types-wsinit.txt)                                     |

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

### Using lazydev.nvim

Install [lazydev.nvim](https://github.com/folke/lazydev.nvim) as suggested:

```lua
{
  'folke/lazydev.nvim',
  ft = 'lua',
  dependencies = { 'DrKJeff16/wezterm-types' },
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
      name = '<my_custom_name>', -- CUSTOM DIRECTORY NAME
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

### Using The Built-in Neovim LSP

Add the install path of `wezterm-types` in your `lua_ls` config.

```lua
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      workspace = {
        library = {
          -- Other library paths...
          '</path/to/wezterm-types>',
        },
      },
    },
  },
}
```

---

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

<!-- vim: set ts=2 sts=2 sw=2 et ai si sta: -->
