### `wez-pain-control`

You can import type annotations for
[`sei40kr/wez-pain-control`](https://github.com/sei40kr/wez-pain-control) as shown below:

```lua
---@type WezPainControl
local wez_pain_control = wezterm.plugin.require("https://github.com/sei40kr/wez-pain-control")
```

Or, if you've installed it locally:

```lua
---@type WezPainControl
local wez_pain_control = require("wez-pain-control.plugin")
```

---

If you're using `lazydev.nvim` and you have installed the plugin locally
you can put this in your setup:

```lua
{
  'folke/lazydev.nvim',
  ft = 'lua',
  dependencies = { 'DrKJeff16/wezterm-types' },
  opts = {
    library = {
      -- Other library configs...
      { path = 'wezterm-types', mods = { 'wezterm' } },
      { path = 'wez-pain-control', mods = { 'wez-pain-control' } },
    },
  },
}
```

<!-- vim: set ts=2 sts=2 sw=2 et ai si sta: -->
