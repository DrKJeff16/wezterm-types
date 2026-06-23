# wezterm-types

<p><a href="https://github.com/michaelbrusegard/awesome-wezterm"><img alt="Mentioned in Awesome WezTerm" src="https://awesome.re/mentioned-badge.svg" /></a><br /><a href="https://github.com/rockerBOO/awesome-neovim"><img alt="Mentioned in Awesome Neovim" src="https://awesome.re/mentioned-badge.svg" /></a></p>

<a href="#"><img alt="Showcase" src="https://github.com/DrKJeff16/wezterm-types/blob/main/assets/showcase.png" /></a>

This project aims to provide LuaCATS-like [LuaLS type annotations](https://luals.github.io/wiki/annotations/)
for your [WezTerm](https://github.com/wezterm/wezterm) config.

Example videos can be found in [EXAMPLES.md](https://github.com/DrKJeff16/wezterm-types/blob/main/EXAMPLES.md).

NOTE: For any missing or unclear types you should always double-check the [WezTerm Lua Reference](https://wezterm.org/config/lua/general.html).
If using an annotated plugin featured in this repository please refer to its author
for any unclear types.

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

To get it running in Neovim please refer to [this discussion](https://github.com/DrKJeff16/wezterm-types/discussions/93).

### Neovim

We recommend using [lazy.nvim](https://github.com/folke/lazy.nvim) as a package manager:

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

| Plugin                                                                                           | Documentation                                     | Neovim Help                                                             |
|--------------------------------------------------------------------------------------------------|---------------------------------------------------|-------------------------------------------------------------------------|
| [ai-commander.wezterm](https://github.com/dimao/ai-commander.wezterm)                            | [Documentation](docs/ai-commander.md)             | [Neovim Helpdoc](doc/wezterm-types-plugin.ai-commander.txt)             |
| [ai-helper.wezterm](https://github.com/Michal1993r/ai-helper.wezterm)                            | [Documentation](docs/ai-helper.md)                | [Neovim Helpdoc](doc/wezterm-types-plugin.ai-helper.txt)                |
| [bar.wezterm](https://github.com/adriankarlen/bar.wezterm)                                       | [Documentation](docs/bar.md)                      | [Neovim Helpdoc](doc/wezterm-types-plugin.bar.txt)                      |
| [battery.wez](https://github.com/rootiest/battery.wez)                                           | [Documentation](docs/battery.md)                  | [Neovim Helpdoc](doc/wezterm-types-plugin.battery.txt)                  |
| [chord.wz](https://github.com/sravioli/chord.wz)                                                 | [Documentation](docs/chord.md)                    | [Neovim Helpdoc](doc/wezterm-types-plugin.chord.txt)                    |
| [dev.wezterm](https://github.com/ChrisGVE/dev.wezterm)                                           | [Documentation](docs/dev.md)                      | [Neovim Helpdoc](doc/wezterm-types-plugin.dev.txt)                      |
| [kanagawa.wz](https://github.com/sravioli/kanagawa.wz)                                           | [Documentation](docs/kanagawa.md)                 | [Neovim Helpdoc](doc/wezterm-types-plugin.kanagawa.txt)                 |
| [lantern.wz](https://github.com/sravioli/lantern.wz)                                             | [Documentation](docs/lantern.md)                  | [Neovim Helpdoc](doc/wezterm-types-plugin.lantern.txt)                  |
| [lib.wezterm](https://github.com/ChrisGVE/lib.wezterm)                                           | [Documentation](docs/lib.md)                      | [Neovim Helpdoc](doc/wezterm-types-plugin.lib.txt)                      |
| [listeners.wezterm](https://github.com/ChrisGVE/listeners.wezterm)                               | [Documentation](docs/listeners.md)                | [Neovim Helpdoc](doc/wezterm-types-plugin.listeners.txt)                |
| [log.wz](https://github.com/sravioli/log.wz)                                                     | [Documentation](docs/log.md)                      | [Neovim Helpdoc](doc/wezterm-types-plugin.log.txt)                      |
| [memo.wz](https://github.com/sravioli/memo.wz)                                                   | [Documentation](docs/memo.md)                     | [Neovim Helpdoc](doc/wezterm-types-plugin.memo.txt)                     |
| [modal.wezterm](https://github.com/MLFlexer/modal.wezterm)                                       | [Documentation](docs/modal.md)                    | [Neovim Helpdoc](doc/wezterm-types-plugin.modal.txt)                    |
| [passrelay.wezterm](https://github.com/dfaerch/passrelay.wezterm)                                | [Documentation](docs/passrelay.md)                | [Neovim Helpdoc](doc/wezterm-types-plugin.passrelay.txt)                |
| [pinned-tabs.wezterm](https://github.com/selectnull/pinned-tabs.wezterm)                         | [Documentation](docs/pinned-tabs.md)              | [Neovim Helpdoc](doc/wezterm-types-plugin.pinned-tabs.txt)              |
| [pivot_panes.wezterm](https://github.com/ChrisGVE/pivot_panes.wezterm)                           | [Documentation](docs/pivot-panes.md)              | [Neovim Helpdoc](doc/wezterm-types-plugin.pivot-panes.txt)              |
| [presentation.wez](https://github.com/xarvex/presentation.wez)                                   | [Documentation](docs/presentation.md)             | [Neovim Helpdoc](doc/wezterm-types-plugin.presentation.txt)             |
| [quick_domains.wezterm](https://github.com/DavidRR-F/quick_domains.wezterm)                      | [Documentation](docs/quick-domains.md)            | [Neovim Helpdoc](doc/wezterm-types-plugin.quick_domains.txt)            |
| [quickselect.wezterm](https://github.com/quantonganh/quickselect.wezterm)                        | [Documentation](docs/quickselect.md)              | [Neovim Helpdoc](doc/wezterm-types-plugin.quickselect.txt)              |
| [resurrect.wezterm](https://github.com/MLFlexer/resurrect.wezterm)                               | [Documentation](docs/resurrect.md)                | [Neovim Helpdoc](doc/wezterm-types-plugin.resurrect.txt)                |
| [ribbon.wz](https://github.com/sravioli/ribbon.wz)                                               | [Documentation](docs/ribbon.md)                   | [Neovim Helpdoc](doc/wezterm-types-plugin.ribbon.txt)                   |
| [rosepine](https://github.com/neapsix/wezterm)                                                   | [Documentation](docs/rosepine.md)                 | [Neovim Helpdoc](doc/wezterm-types-plugin.rosepine.txt)                 |
| [sessionizer.wezterm](https://github.com/mikkasendke/sessionizer.wezterm)                        | [Documentation](docs/sessionizer.md)              | [Neovim Helpdoc](doc/wezterm-types-plugin.sessionizer.txt)              |
| [sigil.wz](https://github.com/sravioli/sigil.wz)                                                 | [Documentation](docs/sigil.md)                    | [Neovim Helpdoc](doc/wezterm-types-plugin.sigil.txt)                    |
| [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim)                            | [Documentation](docs/smart-splits.md)             | [Neovim Helpdoc](doc/wezterm-types-plugin.smart-splits.txt)             |
| [smart_workspace_switcher.wezterm](https://github.com/MLFlexer/smart_workspace_switcher.wezterm) | [Documentation](docs/smart-workspace-switcher.md) | [Neovim Helpdoc](doc/wezterm-types-plugin.smart_workspace_switcher.txt) |
| [stack.wez](https://github.com/bad-noodles/stack.wez)                                            | [Documentation](docs/stack.md)                    | [Neovim Helpdoc](doc/wezterm-types-plugin.stack.txt)                    |
| [tabline.wez](https://github.com/michaelbrusegard/tabline.wez)                                   | [Documentation](docs/tabline.md)                  | [Neovim Helpdoc](doc/wezterm-types-plugin.tabline.txt)                  |
| [tabsets.wezterm](https://github.com/srackham/tabsets.wezterm)                                   | [Documentation](docs/tabsets.md)                  | [Neovim Helpdoc](doc/wezterm-types-plugin.tabsets.txt)                  |
| [toggle_terminal.wez](https://github.com/zsh-sage/toggle_terminal.wez)                           | [Documentation](docs/toggle-terminal.md)          | [Neovim Helpdoc](doc/wezterm-types-plugin.toggle-terminal.txt)          |
| [warp.wz](https://github.com/sravioli/warp.wz)                                                   | [Documentation](docs/warp.md)                     | [Neovim Helpdoc](doc/wezterm-types-plugin.warp.txt)                     |
| [wez-pain-control](https://github.com/sei40kr/wez-pain-control)                                  | [Documentation](docs/wez-pain-control.md)         | [Neovim Helpdoc](doc/wezterm-types-plugin.wez-pain-control.txt)         |
| [wez-tmux](https://github.com/sei40kr/wez-tmux)                                                  | [Documentation](docs/wez-tmux.md)                 | [Neovim Helpdoc](doc/wezterm-types-plugin.wez-tmux.txt)                 |
| [wezterm-agent-deck](https://github.com/Eric162/wezterm-agent-deck)                              | [Documentation](docs/agent-deck.md)               | [Neovim Helpdoc](doc/wezterm-types-plugin.agent-deck.txt)               |
| [wezterm-attention](https://github.com/pro-vi/wezterm-attention)                                 | [Documentation](docs/attention.md)                | [Neovim Helpdoc](doc/wezterm-types-plugin.wezterm-attention.txt)        |
| [wezterm-cmd-sender](https://github.com/aureolebigben/wezterm-cmd-sender)                        | [Documentation](docs/cmd-sender.md)               | [Neovim Helpdoc](doc/wezterm-types-plugin.cmd-sender.txt)               |
| [wezterm-cmdpicker](https://github.com/abidibo/wezterm-cmdpicker)                                | [Documentation](docs/cmdpicker.md)                | [Neovim Helpdoc](doc/wezterm-types-plugin.cmdpicker.txt)                |
| [wezterm-config.nvim](https://github.com/winter-again/wezterm-config.nvim)                       | [Documentation](docs/wezterm-config.md)           | [Neovim Helpdoc](doc/wezterm-types-plugin.wezterm-config.txt)           |
| [wezterm-quota-limit](https://github.com/btrachey/EdenGibson/wezterm-quota-limit)                | [Documentation](docs/quota-limit.md)              | [Neovim Helpdoc](doc/wezterm-types-plugin.quota-limit.txt)              |
| [wezterm-replay](https://github.com/btrachey/wezterm-replay)                                     | [Documentation](docs/replay.md)                   | [Neovim Helpdoc](doc/wezterm-types-plugin.replay.txt)                   |
| [wezterm-sessions](https://github.com/abidibo/wezterm-sessions)                                  | [Documentation](docs/wezterm-sessions.md)         | [Neovim Helpdoc](doc/wezterm-types-plugin.wezterm-sessions.txt)         |
| [wezterm-status](https://github.com/yriveiro/wezterm-status)                                     | [Documentation](docs/wezterm-status.md)           | [Neovim Helpdoc](doc/wezterm-types-plugin.wezterm-status.txt)           |
| [wezterm-sync](https://github.com/dfsramos/wezterm-sync)                                         | [Documentation](docs/sync.md)                     | [Neovim Helpdoc](doc/wezterm-types-plugin.sync.txt)                     |
| [wezterm-tabs](https://github.com/yriveiro/wezterm-tabs)                                         | [Documentation](docs/wezterm-tabs.md)             | [Neovim Helpdoc](doc/wezterm-types-plugin.wezterm-tabs.txt)             |
| [wezterm-theme-rotator](https://github.com/koh-sh/wezterm-theme-rotator)                         | [Documentation](docs/wezterm-theme-rotator.md)    | [Neovim Helpdoc](doc/wezterm-types-plugin.wezterm-theme-rotator.txt)    |
| [widgets.wez](https://github.com/usrivastava92/widgets.wez)                                      | [Documentation](docs/widgets.md)                  | [Neovim Helpdoc](doc/wezterm-types-plugin.widgets.txt)                  |
| [workspace-picker.wezterm](https://github.com/isseii10/workspace-picker.wezterm)                 | [Documentation](docs/workspace-picker.md)         | [Neovim Helpdoc](doc/wezterm-types-plugin.workspace-picker.txt)         |
| [workspacesionizer.wezterm](https://github.com/vieitesss/workspacesionizer.wezterm)              | [Documentation](docs/workspacesionizer.md)        | [Neovim Helpdoc](doc/wezterm-types-plugin.workspacesionizer.txt)        |
| [wsinit.wezterm](https://github.com/JuanraCM/wsinit.wezterm)                                     | [Documentation](docs/wsinit.md)                   | [Neovim Helpdoc](doc/wezterm-types-plugin.wsinit.txt)                   |

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
