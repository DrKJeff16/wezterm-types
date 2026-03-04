---@meta
---@diagnostic disable:unused-local

---@enum (key) ToggleTerminalOpts.Direction
local direction = {
  Down = 1,
  Left = 1,
  Right = 1,
  Up = 1,
}

---@class ToggleTerminalOpts.Zoom
---Automatically zoom invoker pane.
---
---@field auto_zoom_invoker_pane? boolean
---Automatically zoom toggle terminal pane.
---
---@field auto_zoom_toggle_terminal? boolean
---Automatically re-zoom the toggle pane if it was zoomed before switching away.
---
---@field remember_zoomed? boolean

---User overrides for the toggle terminal options.
---
---@class ToggleTerminalOpts
---Change invoker pane on every toggle.
---
---@field change_invoker_id_everytime? boolean
---Direction to split the pane.
---
---@field direction? ToggleTerminalOpts.Direction
---Key for the toggle action.
---
---@field key? string
---Modifier keys for the toggle action.
---
---@field mods? string
---Size of the split pane.
---
---@field size? { Percent: integer }
---@field zoom? ToggleTerminalOpts.Zoom

---@class ToggleTerminal
local M = {}

---@param config Config
---@param user_opts? ToggleTerminalOpts
function M.apply_to_config(config, user_opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
