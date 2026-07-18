---@meta
---@diagnostic disable:unused-local

---@alias GuiEvent "gui-attached"|"gui-startup"
---@alias TabsetsEvent "delete_tabset"|"load_tabset"|"rename_tabset"|"save_tabset"
---@alias MultiplexerEvent "mux-is-process-stateful"|"mux-startup"

---@alias WindowEvent
---|"augment-command-palette"
---|"bell"
---|"format-tab-title"
---|"format-window-title"
---|"new-tab-button-click"
---|"open-uri"
---|"update-status"
---|"user-var-changed"
---|"window-config-reloaded"
---|"window-focus-changed"
---|"window-resized"

---@alias DevWeztermEvent
---|"dev.wezterm-plugin-not-found"
---|"dev.wezterm.invalid_hashkey"
---|"dev.wezterm.invalid_opts"
---|"dev.wezterm.no_keywords"
---|"dev.wezterm.require_path_not_set"

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
