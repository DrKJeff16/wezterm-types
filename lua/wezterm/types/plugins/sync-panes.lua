---@meta
---@diagnostic disable:unused-local

---@class SyncPanesOpts
---@field backspace? string
---@field border? boolean
---@field border_color? string
---@field indicator? boolean
---@field indicator_color? string
---@field key_table_name? string
---@field status_text? string
---@field toggle_key? string
---@field toggle_mods? string

---@class SyncPanes
---@field toggle { EmitEvent: string }
local M = {}

---@param config Config
---@param opts? SyncPanesOpts
---@return Config config
function M.apply_to_config(config, opts) end

---@param window Window
---@return boolean synced
function M.is_synced(window) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
