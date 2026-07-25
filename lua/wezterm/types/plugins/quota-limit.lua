---@meta
---@diagnostic disable:unused-local

---@class QuotaLimitOpts.Icons
---@field bolt? string
---@field week? string

---@class QuotaLimitOpts.DashboardKey: SendKeyParams
---@field mods string

---@class QuotaLimitOpts.Colors
---@field yellow? string
---@field red? string
---@field green? string
---@field dim? string
---@field bright? string

---@class QuotaLimitOpts
---@field colors? "auto"|"dark"|"light"|QuotaLimitOpts.Colors
---@field dashboard_key? QuotaLimitOpts.DashboardKey
---@field icons? QuotaLimitOpts.Icons
---@field poll_interval_secs? integer
---@field position? "left"|"right"

---@class QuotaLimit
local M = {}

---@param config Config
---@param opts? QuotaLimitOpts
function M.apply_to_config(config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
