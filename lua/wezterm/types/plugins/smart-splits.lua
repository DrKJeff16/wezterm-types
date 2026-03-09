---@meta
---@diagnostic disable:unused-local

---@enum (key) SmartSplits.LogLevel
local log_level = {
  error = 1,
  info = 1,
  warn = 1,
}

---@class SmartSplitsWeztermModifierMap
---@field neovim string
---@field wezterm string

---@class DirectionKeys
---Keys to use for moving windows.
---
---@field move string[]
---Keys to use for resizing windows.
---
---@field resize string[]

---@class SmartSplitsWeztermModifiers: DirectionKeys
---@field move string|SmartSplitsWeztermModifierMap
---@field resize string|SmartSplitsWeztermModifierMap

---@class SmartSplitsWeztermConfig
---The number of cells to resize by.
---
---@field default_amount? integer
---Keys to use for movements, not including the modifier key (such as `ALT` or `CTRL`),
---in order of left, down, up, right.
---
---@field direction_keys? string[]|DirectionKeys
---@field log_level? SmartSplits.LogLevel
---Modifier keys to use for movement and resize actions.
---
---These should be WezTerm's modifier key strings such as 'META', 'CTRL', etc.
---
---@field modifiers? SmartSplitsWeztermModifiers

---@class SmartSplitsWezterm
local M = {}

---@param config_builder Config
---@param plugin_config? SmartSplitsWeztermConfig
---@return Config config
function M.apply_to_config(config_builder, plugin_config) end

---@param pane Pane|PaneInformation
---@return boolean is_vim
function M.is_vim(pane) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
