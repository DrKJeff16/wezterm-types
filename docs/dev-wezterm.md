### `dev.wezterm`

You can import type annotations for
[`ChrisGVE/dev.wezterm`](https://github.com/ChrisGVE/dev.wezterm) as shown below:

```lua
---@type Dev
local dev = wezterm.plugin.require("https://github.com/ChrisGVE/dev.wezterm")
```

This integration also adds the following events to `wezterm.on()`:

- `dev.wezterm-plugin-not-found`
- `dev.wezterm.invalid_hashkey`
- `dev.wezterm.invalid_opts`
- `dev.wezterm.no_keywords`
- `dev.wezterm.require_path_not_set`

```lua
---Either no `hashkey` or an invalid one provided.
---
---@param event "dev.wezterm.invalid_hashkey" This is for `dev.wezterm` only!
---@param callback function
function Wezterm.on(event, callback) end

---Invalid options provided to plugin setup.
---
---@param event "dev.wezterm.invalid_opts" This is for `dev.wezterm` only!
---@param callback function
function Wezterm.on(event, callback) end

---No keywords were provided for searching the plugin.
---
---@param event "dev.wezterm.no_keywords" This is for `dev.wezterm` only!
---@param callback function
function Wezterm.on(event, callback) end

---The plugin was not found and thus `package.path` could not be set.
---
---@param event "dev.wezterm.require_path_not_set" This is for `dev.wezterm` only!
---@param callback function
function Wezterm.on(event, callback) end

---The provided keywords did not allow for the plugin to be found.
---
---@param event "dev.wezterm-plugin-not-found" This is for `dev.wezterm` only!
---@param callback function
function Wezterm.on(event, callback) end
```

<!-- vim: set ts=2 sts=2 sw=2 et ai si sta: -->
