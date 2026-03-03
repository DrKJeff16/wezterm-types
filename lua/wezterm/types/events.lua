---@meta
---@diagnostic disable:unused-local

---@enum (key) GuiEvent
local gui_event = {
  ["gui-attached"] = 1,
  ["gui-startup"] = 1,
}

---@enum (key) WindowEvent
local window_event = {
  ["augment-command-palette"] = 1,
  ["bell"] = 1,
  ["format-tab-title"] = 1,
  ["format-window-title"] = 1,
  ["new-tab-button-click"] = 1,
  ["open-uri"] = 1,
  ["update-status"] = 1,
  ["user-var-changed"] = 1,
  ["window-config-reloaded"] = 1,
  ["window-focus-changed"] = 1,
  ["window-resized"] = 1,
}

---@enum (key) DevWeztermEvent
local dev_event = {
  ["dev.wezterm-plugin-not-found"] = 1,
  ["dev.wezterm.invalid_hashkey"] = 1,
  ["dev.wezterm.invalid_opts"] = 1,
  ["dev.wezterm.no_keywords"] = 1,
  ["dev.wezterm.require_path_not_set"] = 1,
}

---@enum (key) TabsetsEvent
local tabsets_event = {
  delete_tabset = 1,
  load_tabset = 1,
  rename_tabset = 1,
  save_tabset = 1,
}

---@enum (key) MultiplexerEvent
local mux_event = {
  ["mux-is-process-stateful"] = 1,
  ["mux-startup"] = 1,
}

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
