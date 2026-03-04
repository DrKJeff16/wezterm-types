### `wez-tmux`

You can import type annotations for [`sei40kr/wez-tmux`](https://github.com/sei40kr/wez-tmux)
as shown below:

```lua
---@type WezTmux
local wez_tmux = wezterm.plugin.require("https://github.com/sei40kr/wez-tmux")
```

Or, if you've installed it locally:

```lua
---@type WezTmux
local wez_tmux = require("wez-tmux.plugin")
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
      { path = 'wez-tmux', mods = { 'wez-tmux' } },
    },
  },
}
```

<!-- vim: set ts=2 sts=2 sw=2 et ai si sta: -->
