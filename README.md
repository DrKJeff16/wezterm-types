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

<!-- plugin-table:start -->
| Plugin | Documentation | Maintenance |
| --- | --- | --- |
| [ai-commander.wezterm](https://github.com/dimao/ai-commander.wezterm) | [docs/ai-commander.md](./docs/ai-commander.md)<br>[:h wezterm-types-plugin.ai-commander.txt](./doc/wezterm-types-plugin.ai-commander.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/ai-commander-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#ai-commander)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/ai-commander-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/ai-commander-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/ai-commander-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/ai-commander-upstream.html) |
| [ai-helper.wezterm](https://github.com/Michal1993r/ai-helper.wezterm) | [docs/ai-helper.md](./docs/ai-helper.md)<br>[:h wezterm-types-plugin.ai-helper.txt](./doc/wezterm-types-plugin.ai-helper.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/ai-helper-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#ai-helper)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/ai-helper-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/ai-helper-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/ai-helper-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/ai-helper-upstream.html) |
| [bar.wezterm](https://github.com/adriankarlen/bar.wezterm) | [docs/bar.md](./docs/bar.md)<br>[:h wezterm-types-plugin.bar.txt](./doc/wezterm-types-plugin.bar.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/bar-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#bar)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/bar-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/bar-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/bar-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/bar-upstream.html) |
| [battery.wez](https://github.com/rootiest/battery.wez) | [docs/battery.md](./docs/battery.md)<br>[:h wezterm-types-plugin.battery.txt](./doc/wezterm-types-plugin.battery.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/battery-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#battery)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/battery-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/battery-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/battery-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/battery-upstream.html) |
| [chord.wz](https://github.com/sravioli/chord.wz) | [docs/chord.md](./docs/chord.md)<br>[:h wezterm-types-plugin.chord.txt](./doc/wezterm-types-plugin.chord.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/chord-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#chord)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/chord-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/chord-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/chord-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/chord-upstream.html) |
| [dev.wezterm](https://github.com/ChrisGVE/dev.wezterm) | [docs/dev.md](./docs/dev.md)<br>[:h wezterm-types-plugin.dev.txt](./doc/wezterm-types-plugin.dev.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/dev-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#dev)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/dev-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/dev-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/dev-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/dev-upstream.html) |
| [kanagawa.wz](https://github.com/sravioli/kanagawa.wz) | [docs/kanagawa.md](./docs/kanagawa.md)<br>[:h wezterm-types-plugin.kanagawa.txt](./doc/wezterm-types-plugin.kanagawa.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/kanagawa-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#kanagawa)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/kanagawa-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/kanagawa-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/kanagawa-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/kanagawa-upstream.html) |
| [lantern.wz](https://github.com/sravioli/lantern.wz) | [docs/lantern.md](./docs/lantern.md)<br>[:h wezterm-types-plugin.lantern.txt](./doc/wezterm-types-plugin.lantern.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/lantern-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#lantern)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/lantern-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/lantern-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/lantern-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/lantern-upstream.html) |
| [lib.wezterm](https://github.com/ChrisGVE/lib.wezterm) | [docs/lib.md](./docs/lib.md)<br>[:h wezterm-types-plugin.lib.txt](./doc/wezterm-types-plugin.lib.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/lib-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#lib)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/lib-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/lib-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/lib-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/lib-upstream.html) |
| [listeners.wezterm](https://github.com/ChrisGVE/listeners.wezterm) | [docs/listeners.md](./docs/listeners.md)<br>[:h wezterm-types-plugin.listeners.txt](./doc/wezterm-types-plugin.listeners.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/listeners-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#listeners)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/listeners-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/listeners-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/listeners-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/listeners-upstream.html) |
| [log.wz](https://github.com/sravioli/log.wz) | [docs/log.md](./docs/log.md)<br>[:h wezterm-types-plugin.log.txt](./doc/wezterm-types-plugin.log.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/log-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#log)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/log-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/log-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/log-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/log-upstream.html) |
| [memo.wz](https://github.com/sravioli/memo.wz) | [docs/memo.md](./docs/memo.md)<br>[:h wezterm-types-plugin.memo.txt](./doc/wezterm-types-plugin.memo.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/memo-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#memo)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/memo-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/memo-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/memo-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/memo-upstream.html) |
| [modal.wezterm](https://github.com/MLFlexer/modal.wezterm) | [docs/modal.md](./docs/modal.md)<br>[:h wezterm-types-plugin.modal.txt](./doc/wezterm-types-plugin.modal.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/modal-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#modal)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/modal-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/modal-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/modal-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/modal-upstream.html) |
| [passrelay.wezterm](https://github.com/dfaerch/passrelay.wezterm) | [docs/passrelay.md](./docs/passrelay.md)<br>[:h wezterm-types-plugin.passrelay.txt](./doc/wezterm-types-plugin.passrelay.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/passrelay-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#passrelay)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/passrelay-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/passrelay-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/passrelay-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/passrelay-upstream.html) |
| [pinned-tabs.wezterm](https://github.com/selectnull/pinned-tabs.wezterm) | [docs/pinned-tabs.md](./docs/pinned-tabs.md)<br>[:h wezterm-types-plugin.pinned-tabs.txt](./doc/wezterm-types-plugin.pinned-tabs.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/pinned-tabs-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#pinned-tabs)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/pinned-tabs-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/pinned-tabs-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/pinned-tabs-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/pinned-tabs-upstream.html) |
| [pivot_panes.wezterm](https://github.com/ChrisGVE/pivot_panes.wezterm) | [docs/pivot-panes.md](./docs/pivot-panes.md)<br>[:h wezterm-types-plugin.pivot-panes.txt](./doc/wezterm-types-plugin.pivot-panes.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/pivot-panes-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#pivot-panes)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/pivot-panes-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/pivot-panes-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/pivot-panes-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/pivot-panes-upstream.html) |
| [presentation.wez](https://github.com/xarvex/presentation.wez) | [docs/presentation.md](./docs/presentation.md)<br>[:h wezterm-types-plugin.presentation.txt](./doc/wezterm-types-plugin.presentation.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/presentation-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#presentation)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/presentation-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/presentation-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/presentation-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/presentation-upstream.html) |
| [quick_domains.wezterm](https://github.com/DavidRR-F/quick_domains.wezterm) | [docs/quick-domains.md](./docs/quick-domains.md)<br>[:h wezterm-types-plugin.quick-domains.txt](./doc/wezterm-types-plugin.quick-domains.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/quick-domains-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#quick-domains)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/quick-domains-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/quick-domains-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/quick-domains-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/quick-domains-upstream.html) |
| [quickselect.wezterm](https://github.com/quantonganh/quickselect.wezterm) | [docs/quickselect.md](./docs/quickselect.md)<br>[:h wezterm-types-plugin.quickselect.txt](./doc/wezterm-types-plugin.quickselect.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/quickselect-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#quickselect)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/quickselect-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/quickselect-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/quickselect-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/quickselect-upstream.html) |
| [resurrect.wezterm](https://github.com/MLFlexer/resurrect.wezterm) | [docs/resurrect.md](./docs/resurrect.md)<br>[:h wezterm-types-plugin.resurrect.txt](./doc/wezterm-types-plugin.resurrect.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/resurrect-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#resurrect)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/resurrect-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/resurrect-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/resurrect-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/resurrect-upstream.html) |
| [ribbon.wz](https://github.com/sravioli/ribbon.wz) | [docs/ribbon.md](./docs/ribbon.md)<br>[:h wezterm-types-plugin.ribbon.txt](./doc/wezterm-types-plugin.ribbon.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/ribbon-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#ribbon)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/ribbon-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/ribbon-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/ribbon-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/ribbon-upstream.html) |
| [rosepine](https://github.com/neapsix/wezterm) | [docs/rosepine.md](./docs/rosepine.md)<br>[:h wezterm-types-plugin.rosepine.txt](./doc/wezterm-types-plugin.rosepine.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/rosepine-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#rosepine)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/rosepine-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/rosepine-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/rosepine-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/rosepine-upstream.html) |
| [sessionizer.wezterm](https://github.com/mikkasendke/sessionizer.wezterm) | [docs/sessionizer.md](./docs/sessionizer.md)<br>[:h wezterm-types-plugin.sessionizer.txt](./doc/wezterm-types-plugin.sessionizer.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/sessionizer-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#sessionizer)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/sessionizer-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/sessionizer-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/sessionizer-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/sessionizer-upstream.html) |
| [sigil.wz](https://github.com/sravioli/sigil.wz) | [docs/sigil.md](./docs/sigil.md)<br>[:h wezterm-types-plugin.sigil.txt](./doc/wezterm-types-plugin.sigil.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/sigil-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#sigil)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/sigil-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/sigil-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/sigil-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/sigil-upstream.html) |
| [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim) | [docs/smart-splits.md](./docs/smart-splits.md)<br>[:h wezterm-types-plugin.smart-splits.txt](./doc/wezterm-types-plugin.smart-splits.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/smart-splits-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#smart-splits)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/smart-splits-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/smart-splits-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/smart-splits-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/smart-splits-upstream.html) |
| [smart_workspace_switcher.wezterm](https://github.com/MLFlexer/smart_workspace_switcher.wezterm) | [docs/smart-workspace-switcher.md](./docs/smart-workspace-switcher.md)<br>[:h wezterm-types-plugin.smart-workspace-switcher.txt](./doc/wezterm-types-plugin.smart-workspace-switcher.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/smart-workspace-switcher-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#smart-workspace-switcher)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/smart-workspace-switcher-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/smart-workspace-switcher-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/smart-workspace-switcher-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/smart-workspace-switcher-upstream.html) |
| [stack.wez](https://github.com/bad-noodles/stack.wez) | [docs/stack.md](./docs/stack.md)<br>[:h wezterm-types-plugin.stack.txt](./doc/wezterm-types-plugin.stack.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/stack-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#stack)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/stack-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/stack-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/stack-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/stack-upstream.html) |
| [sync-panes.wez](https://github.com/annie444/sync-panes.wez) | [docs/sync-panes.md](./docs/sync-panes.md)<br>[:h wezterm-types-plugin.sync-panes.txt](./doc/wezterm-types-plugin.sync-panes.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/sync-panes-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#sync-panes)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/sync-panes-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/sync-panes-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/sync-panes-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/sync-panes-upstream.html) |
| [tabline.wez](https://github.com/michaelbrusegard/tabline.wez) | [docs/tabline.md](./docs/tabline.md)<br>[:h wezterm-types-plugin.tabline.txt](./doc/wezterm-types-plugin.tabline.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/tabline-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#tabline)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/tabline-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/tabline-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/tabline-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/tabline-upstream.html) |
| [tabsets.wezterm](https://github.com/srackham/tabsets.wezterm) | [docs/tabsets.md](./docs/tabsets.md)<br>[:h wezterm-types-plugin.tabsets.txt](./doc/wezterm-types-plugin.tabsets.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/tabsets-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#tabsets)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/tabsets-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/tabsets-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/tabsets-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/tabsets-upstream.html) |
| [toggle_terminal.wez](https://github.com/zsh-sage/toggle_terminal.wez) | [docs/toggle-terminal.md](./docs/toggle-terminal.md)<br>[:h wezterm-types-plugin.toggle-terminal.txt](./doc/wezterm-types-plugin.toggle-terminal.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/toggle-terminal-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#toggle-terminal)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/toggle-terminal-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/toggle-terminal-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/toggle-terminal-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/toggle-terminal-upstream.html) |
| [warp.wz](https://github.com/sravioli/warp.wz) | [docs/warp.md](./docs/warp.md)<br>[:h wezterm-types-plugin.warp.txt](./doc/wezterm-types-plugin.warp.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/warp-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#warp)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/warp-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/warp-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/warp-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/warp-upstream.html) |
| [wez-pain-control](https://github.com/sei40kr/wez-pain-control) | [docs/wez-pain-control.md](./docs/wez-pain-control.md)<br>[:h wezterm-types-plugin.wez-pain-control.txt](./doc/wezterm-types-plugin.wez-pain-control.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wez-pain-control-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#wez-pain-control)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wez-pain-control-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wez-pain-control-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wez-pain-control-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wez-pain-control-upstream.html) |
| [wez-tmux](https://github.com/sei40kr/wez-tmux) | [docs/wez-tmux.md](./docs/wez-tmux.md)<br>[:h wezterm-types-plugin.wez-tmux.txt](./doc/wezterm-types-plugin.wez-tmux.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wez-tmux-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#wez-tmux)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wez-tmux-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wez-tmux-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wez-tmux-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wez-tmux-upstream.html) |
| [wezterm-agent-deck](https://github.com/Eric162/wezterm-agent-deck) | [docs/agent-deck.md](./docs/agent-deck.md)<br>[:h wezterm-types-plugin.agent-deck.txt](./doc/wezterm-types-plugin.agent-deck.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/agent-deck-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#agent-deck)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/agent-deck-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/agent-deck-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/agent-deck-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/agent-deck-upstream.html) |
| [wezterm-attention](https://github.com/pro-vi/wezterm-attention) | [docs/attention.md](./docs/attention.md)<br>[:h wezterm-types-plugin.attention.txt](./doc/wezterm-types-plugin.attention.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/attention-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#attention)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/attention-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/attention-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/attention-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/attention-upstream.html) |
| [wezterm-cmd-sender](https://github.com/aureolebigben/wezterm-cmd-sender) | [docs/cmd-sender.md](./docs/cmd-sender.md)<br>[:h wezterm-types-plugin.cmd-sender.txt](./doc/wezterm-types-plugin.cmd-sender.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/cmd-sender-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#cmd-sender)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/cmd-sender-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/cmd-sender-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/cmd-sender-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/cmd-sender-upstream.html) |
| [wezterm-cmdpicker](https://github.com/abidibo/wezterm-cmdpicker) | [docs/cmdpicker.md](./docs/cmdpicker.md)<br>[:h wezterm-types-plugin.cmdpicker.txt](./doc/wezterm-types-plugin.cmdpicker.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/cmdpicker-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#cmdpicker)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/cmdpicker-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/cmdpicker-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/cmdpicker-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/cmdpicker-upstream.html) |
| [wezterm-config.nvim](https://github.com/winter-again/wezterm-config.nvim) | [docs/wezterm-config.md](./docs/wezterm-config.md)<br>[:h wezterm-types-plugin.wezterm-config.txt](./doc/wezterm-types-plugin.wezterm-config.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-config-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#wezterm-config)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-config-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wezterm-config-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-config-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wezterm-config-upstream.html) |
| [wezterm-quota-limit](https://github.com/EdenGibson/wezterm-quota-limit) | [docs/quota-limit.md](./docs/quota-limit.md)<br>[:h wezterm-types-plugin.quota-limit.txt](./doc/wezterm-types-plugin.quota-limit.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/quota-limit-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#quota-limit)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/quota-limit-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/quota-limit-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/quota-limit-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/quota-limit-upstream.html) |
| [wezterm-replay](https://github.com/btrachey/wezterm-replay) | [docs/replay.md](./docs/replay.md)<br>[:h wezterm-types-plugin.replay.txt](./doc/wezterm-types-plugin.replay.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/replay-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#replay)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/replay-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/replay-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/replay-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/replay-upstream.html) |
| [wezterm-sessions](https://github.com/abidibo/wezterm-sessions) | [docs/wezterm-sessions.md](./docs/wezterm-sessions.md)<br>[:h wezterm-types-plugin.wezterm-sessions.txt](./doc/wezterm-types-plugin.wezterm-sessions.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-sessions-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#wezterm-sessions)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-sessions-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wezterm-sessions-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-sessions-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wezterm-sessions-upstream.html) |
| [wezterm-status](https://github.com/yriveiro/wezterm-status) | [docs/wezterm-status.md](./docs/wezterm-status.md)<br>[:h wezterm-types-plugin.wezterm-status.txt](./doc/wezterm-types-plugin.wezterm-status.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-status-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#wezterm-status)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-status-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wezterm-status-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-status-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wezterm-status-upstream.html) |
| [wezterm-sync](https://github.com/dfsramos/wezterm-sync) | [docs/sync.md](./docs/sync.md)<br>[:h wezterm-types-plugin.sync.txt](./doc/wezterm-types-plugin.sync.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/sync-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#sync)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/sync-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/sync-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/sync-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/sync-upstream.html) |
| [wezterm-tabs](https://github.com/yriveiro/wezterm-tabs) | [docs/wezterm-tabs.md](./docs/wezterm-tabs.md)<br>[:h wezterm-types-plugin.wezterm-tabs.txt](./doc/wezterm-types-plugin.wezterm-tabs.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-tabs-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#wezterm-tabs)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-tabs-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wezterm-tabs-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-tabs-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wezterm-tabs-upstream.html) |
| [wezterm-theme-rotator](https://github.com/koh-sh/wezterm-theme-rotator) | [docs/wezterm-theme-rotator.md](./docs/wezterm-theme-rotator.md)<br>[:h wezterm-types-plugin.wezterm-theme-rotator.txt](./doc/wezterm-types-plugin.wezterm-theme-rotator.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-theme-rotator-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#wezterm-theme-rotator)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-theme-rotator-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wezterm-theme-rotator-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wezterm-theme-rotator-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wezterm-theme-rotator-upstream.html) |
| [widgets.wez](https://github.com/usrivastava92/widgets.wez) | [docs/widgets.md](./docs/widgets.md)<br>[:h wezterm-types-plugin.widgets.txt](./doc/wezterm-types-plugin.widgets.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/widgets-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#widgets)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/widgets-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/widgets-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/widgets-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/widgets-upstream.html) |
| [workspace-picker.wezterm](https://github.com/isseii10/workspace-picker.wezterm) | [docs/workspace-picker.md](./docs/workspace-picker.md)<br>[:h wezterm-types-plugin.workspace-picker.txt](./doc/wezterm-types-plugin.workspace-picker.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/workspace-picker-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#workspace-picker)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/workspace-picker-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/workspace-picker-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/workspace-picker-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/workspace-picker-upstream.html) |
| [workspacesionizer.wezterm](https://github.com/vieitesss/workspacesionizer.wezterm) | [docs/workspacesionizer.md](./docs/workspacesionizer.md)<br>[:h wezterm-types-plugin.workspacesionizer.txt](./doc/wezterm-types-plugin.workspacesionizer.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/workspacesionizer-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#workspacesionizer)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/workspacesionizer-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/workspacesionizer-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/workspacesionizer-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/workspacesionizer-upstream.html) |
| [wsinit.wezterm](https://github.com/JuanraCM/wsinit.wezterm) | [docs/wsinit.md](./docs/wsinit.md)<br>[:h wezterm-types-plugin.wsinit.txt](./doc/wezterm-types-plugin.wsinit.txt) | [![Status](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wsinit-status.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/#wsinit)<br>[![Reviewed baseline](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wsinit-reviewed.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wsinit-reviewed.html)<br>[![Latest upstream](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/badges/wsinit-upstream.svg)](https://drkjeff16.github.io/wezterm-types/plugin-maintenance/refs/wsinit-upstream.html) |
<!-- plugin-table:end -->

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
