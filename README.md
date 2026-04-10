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

**_If you want to add your plugin, please read [`CONTRIBUTING.md`](https://github.com/DrKJeff16/wezterm-types/blob/main/CONTRIBUTING.md#plugins)._**

| Plugin                                                                                           | Documentation                                                          | Neovim Help                                                                                                     |
|--------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| [ai-commander.wezterm](https://github.com/dimao/ai-commander.wezterm)                            | [docs/ai-commander.md](./docs/ai-commander.md)                         | [:h wezterm-types-plugin.ai-commander.txt](./doc/wezterm-types-plugin.ai-commander.txt)                         |
| [ai-helper.wezterm](https://github.com/Michal1993r/ai-helper.wezterm)                            | [docs/ai-helper.md](./docs/ai-helper.md)                               | [:h wezterm-types-plugin.ai-helper.txt](./doc/wezterm-types-plugin.ai-helper.txt)                               |
| [bar.wezterm](https://github.com/adriankarlen/bar.wezterm)                                       | [docs/bar.md](./docs/bar.md)                                           | [:h wezterm-types-plugin.bar.txt](./doc/wezterm-types-plugin.bar.txt)                                           |
| [battery.wez](https://github.com/rootiest/battery.wez)                                           | [docs/battery.md](./docs/battery.md)                                   | [:h wezterm-types-plugin.battery.txt](./doc/wezterm-types-plugin.battery.txt)                                   |
| [dev.wezterm](https://github.com/ChrisGVE/dev.wezterm)                                           | [docs/dev.md](./docs/dev.md)                                           | [:h wezterm-types-plugin.dev.txt](./doc/wezterm-types-plugin.dev.txt)                                           |
| [kanagawa.wz](https://github.com/sravioli/kanagawa.wz)                                           | [docs/kanagawa.md](./docs/kanagawa.md)                                 | [:h wezterm-types-plugin.kanagawa.txt](./doc/wezterm-types-plugin.kanagawa.txt)                                 |
| [lib.wezterm](https://github.com/ChrisGVE/lib.wezterm)                                           | [docs/lib.md](./docs/lib.md)                                           | [:h wezterm-types-plugin.lib.txt](./doc/wezterm-types-plugin.lib.txt)                                           |
| [listeners.wezterm](https://github.com/ChrisGVE/listeners.wezterm)                               | [docs/listeners.md](./docs/listeners.md)                               | [:h wezterm-types-plugin.listeners.txt](./doc/wezterm-types-plugin.listeners.txt)                               |
| [log.wz](https://github.com/sravioli/log.wz)                                                     | [docs/log.md](./docs/log.md)                                           | [:h wezterm-types-plugin.log.txt](./doc/wezterm-types-plugin.log.txt)                                           |
| [memo.wz](https://github.com/sravioli/memo.wz)                                                   | [docs/memo.md](./docs/memo.md)                                         | [:h wezterm-types-plugin.memo.txt](./doc/wezterm-types-plugin.memo.txt)                                         |
| [modal.wezterm](https://github.com/MLFlexer/modal.wezterm)                                       | [docs/modal.md](./docs/modal.md)                                       | [:h wezterm-types-plugin.modal.txt](./doc/wezterm-types-plugin.modal.txt)                                       |
| [passrelay.wezterm](https://github.com/dfaerch/passrelay.wezterm)                                | [docs/passrelay.md](./docs/passrelay.md)                               | [:h wezterm-types-plugin.passrelay.txt](./doc/wezterm-types-plugin.passrelay.txt)                               |
| [pinned-tabs.wezterm](https://github.com/selectnull/pinned-tabs.wezterm)                         | [docs/pinned-tabs.md](./docs/pinned-tabs.md)                           | [:h wezterm-types-plugin.pinned-tabs.txt](./doc/wezterm-types-plugin.pinned-tabs.txt)                           |
| [pivot_panes.wezterm](https://github.com/ChrisGVE/pivot_panes.wezterm)                           | [docs/pivot-panes.md](./docs/pivot-panes.md)                           | [:h wezterm-types-plugin.pivot-panes.txt](./doc/wezterm-types-plugin.pivot-panes.txt)                           |
| [presentation.wez](https://github.com/xarvex/presentation.wez)                                   | [docs/presentation.md](./docs/presentation.md)                         | [:h wezterm-types-plugin.presentation.txt](./doc/wezterm-types-plugin.presentation.txt)                         |
| [quick_domains.wezterm](https://github.com/DavidRR-F/quick_domains.wezterm)                      | [docs/quick-domains.md](./docs/quick-domains.md)                       | [:h wezterm-types-plugin.quick_domains.txt](./doc/wezterm-types-plugin.quick_domains.txt)                       |
| [quickselect.wezterm](https://github.com/quantonganh/quickselect.wezterm)                        | [docs/quickselect.md](./docs/quickselect.md)                           | [:h wezterm-types-plugin.quickselect.txt](./doc/wezterm-types-plugin.quickselect.txt)                           |
| [resurrect.wezterm](https://github.com/MLFlexer/resurrect.wezterm)                               | [docs/resurrect.md](./docs/resurrect.md)                               | [:h wezterm-types-plugin.resurrect.txt](./doc/wezterm-types-plugin.resurrect.txt)                               |
| [rosepine](https://github.com/neapsix/wezterm)                                                   | [docs/rosepine.md](./docs/rosepine.md)                                 | [:h wezterm-types-plugin.rosepine.txt](./doc/wezterm-types-plugin.rosepine.txt)                                 |
| [sessionizer.wezterm](https://github.com/mikkasendke/sessionizer.wezterm)                        | [docs/sessionizer.md](./docs/sessionizer.md)                           | [:h wezterm-types-plugin.sessionizer.txt](./doc/wezterm-types-plugin.sessionizer.txt)                           |
| [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim)                            | [docs/smart-splits.md](./docs/smart-splits.md)                         | [:h wezterm-types-plugin.smart-splits.txt](./doc/wezterm-types-plugin.smart-splits.txt)                         |
| [smart_workspace_switcher.wezterm](https://github.com/MLFlexer/smart_workspace_switcher.wezterm) | [docs/smart-workspace-switcher.md](./docs/smart-workspace-switcher.md) | [:h wezterm-types-plugin.smart_workspace_switcher.txt](./doc/wezterm-types-plugin.smart_workspace_switcher.txt) |
| [stack.wez](https://github.com/bad-noodles/stack.wez)                                            | [docs/stack.md](./docs/stack.md)                                       | [:h wezterm-types-plugin.stack.txt](./doc/wezterm-types-plugin.stack.txt)                                       |
| [tabline.wez](https://github.com/michaelbrusegard/tabline.wez)                                   | [docs/tabline.md](./docs/tabline.md)                                   | [:h wezterm-types-plugin.tabline.txt](./doc/wezterm-types-plugin.tabline.txt)                                   |
| [tabsets.wezterm](https://github.com/srackham/tabsets.wezterm)                                   | [docs/tabsets.md](./docs/tabsets.md)                                   | [:h wezterm-types-plugin.tabsets.txt](./doc/wezterm-types-plugin.tabsets.txt)                                   |
| [toggle_terminal.wez](https://github.com/zsh-sage/toggle_terminal.wez)                           | [docs/toggle-terminal.md](./docs/toggle-terminal.md)                   | [:h wezterm-types-plugin.toggle-terminal.txt](./doc/wezterm-types-plugin.toggle-terminal.txt)                   |
| [warp.wz](https://github.com/sravioli/warp.wz)                                                   | [docs/warp.md](./docs/warp.md)                                         | [:h wezterm-types-plugin.warp.txt](./doc/wezterm-types-plugin.warp.txt)                                         |
| [wez-pain-control](https://github.com/sei40kr/wez-pain-control)                                  | [docs/wez-pain-control.md](./docs/wez-pain-control.md)                 | [:h wezterm-types-plugin.wez-pain-control.txt](./doc/wezterm-types-plugin.wez-pain-control.txt)                 |
| [wez-tmux](https://github.com/sei40kr/wez-tmux)                                                  | [docs/wez-tmux.md](./docs/wez-tmux.md)                                 | [:h wezterm-types-plugin.wez-tmux.txt](./doc/wezterm-types-plugin.wez-tmux.txt)                                 |
| [wezterm-agent-deck](https://github.com/Eric162/wezterm-agent-deck)                              | [docs/agent-deck.md](./docs/agent-deck.md)                             | [:h wezterm-types-plugin.agent-deck.txt](./doc/wezterm-types-plugin.agent-deck.txt)                             |
| [wezterm-attention](https://github.com/pro-vi/wezterm-attention)                                 | [docs/attention.md](./docs/attention.md)                               | [:h wezterm-types-plugin.wezterm-attention.txt](./doc/wezterm-types-plugin.wezterm-attention.txt)               |
| [wezterm-cmd-sender](https://github.com/aureolebigben/wezterm-cmd-sender)                        | [docs/cmd-sender.md](./docs/cmd-sender.md)                             | [:h wezterm-types-plugin.cmd-sender.txt](./doc/wezterm-types-plugin.cmd-sender.txt)                             |
| [wezterm-cmdpicker](https://github.com/abidibo/wezterm-cmdpicker)                                | [docs/cmdpicker.md](./docs/cmdpicker.md)                               | [:h wezterm-types-plugin.cmdpicker.txt](./doc/wezterm-types-plugin.cmdpicker.txt)                               |
| [wezterm-config.nvim](https://github.com/winter-again/wezterm-config.nvim)                       | [docs/wezterm-config.md](./docs/wezterm-config.md)                     | [:h wezterm-types-plugin.wezterm-config.txt](./doc/wezterm-types-plugin.wezterm-config.txt)                     |
| [wezterm-quota-limit](https://github.com/btrachey/EdenGibson/wezterm-quota-limit)                | [docs/quota-limit.md](./docs/quota-limit.md)                           | [:h wezterm-types-plugin.quota-limit.txt](./doc/wezterm-types-plugin.quota-limit.txt)                           |
| [wezterm-replay](https://github.com/btrachey/wezterm-replay)                                     | [docs/replay.md](./docs/replay.md)                                     | [:h wezterm-types-plugin.replay.txt](./doc/wezterm-types-plugin.replay.txt)                                     |
| [wezterm-sessions](https://github.com/abidibo/wezterm-sessions)                                  | [docs/wezterm-sessions.md](./docs/wezterm-sessions.md)                 | [:h wezterm-types-plugin.wezterm-sessions.txt](./doc/wezterm-types-plugin.wezterm-sessions.txt)                 |
| [wezterm-status](https://github.com/yriveiro/wezterm-status)                                     | [docs/wezterm-status.md](./docs/wezterm-status.md)                     | [:h wezterm-types-plugin.wezterm-status.txt](./doc/wezterm-types-plugin.wezterm-status.txt)                     |
| [wezterm-tabs](https://github.com/yriveiro/wezterm-tabs)                                         | [docs/wezterm-tabs.md](./docs/wezterm-tabs.md)                         | [:h wezterm-types-plugin.wezterm-tabs.txt](./doc/wezterm-types-plugin.wezterm-tabs.txt)                         |
| [wezterm-theme-rotator](https://github.com/koh-sh/wezterm-theme-rotator)                         | [docs/wezterm-theme-rotator.md](./docs/wezterm-theme-rotator.md)       | [:h wezterm-types-plugin.wezterm-theme-rotator.txt](./doc/wezterm-types-plugin.wezterm-theme-rotator.txt)       |
| [workspace-picker.wezterm](https://github.com/isseii10/workspace-picker.wezterm)                 | [docs/workspace-picker.md](./docs/workspace-picker.md)                 | [:h wezterm-types-plugin.workspace-picker.txt](./doc/wezterm-types-plugin.workspace-picker.txt)                 |
| [workspacesionizer.wezterm](https://github.com/vieitesss/workspacesionizer.wezterm)              | [docs/workspacesionizer.md](./docs/workspacesionizer.md)               | [:h wezterm-types-plugin.workspacesionizer.txt](./doc/wezterm-types-plugin.workspacesionizer.txt)               |
| [wsinit.wezterm](https://github.com/JuanraCM/wsinit.wezterm)                                     | [docs/wsinit.md](./docs/wsinit.md)                                     | [:h wezterm-types-plugin.wsinit.txt](./doc/wezterm-types-plugin.wsinit.txt)                                     |

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
