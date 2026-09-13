---@meta

---@class NuUtf8HackOpts
---@field char_table? string
---@field key_tables? table<string, SendKeyParams>

---@class NuUtf8Hack
local M = {}

---@param config Config
---@param plugin_config? NuUtf8HackOpts
function M.apply_to_config(config, plugin_config) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
