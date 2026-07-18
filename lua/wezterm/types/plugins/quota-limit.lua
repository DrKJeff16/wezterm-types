---@meta
---@diagnostic disable:unused-local

---@alias QuotaLimitOpts.Position "left"|"right"

---@class QuotaLimitOpts.Icons
---@field bolt? string
---@field week? string

---@class QuotaLimitOpts
---@field poll_interval_secs? integer
---@field position? QuotaLimitOpts.Position
---@field icons? QuotaLimitOpts.Icons

---@class QuotaLimit
local M = {}

---@param config Config
---@param opts? QuotaLimitOpts
function M.apply_to_config(config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
