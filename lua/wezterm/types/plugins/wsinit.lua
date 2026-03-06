---@meta
---@diagnostic disable:unused-local

---@class WsInitKey: SendKeyParams
---@field key? string
---@field mods? string

---@class WsInitOpts
---@field init_workspace_keys? WsInitKey
---@field workspaces_dir? string

---@class WsInit
local M = {}

---@param config Config
function M.apply_to_config(config) end

---@param opts WsInitOpts
function M.setup(opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
