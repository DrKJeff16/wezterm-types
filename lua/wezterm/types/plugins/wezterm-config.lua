---@meta

---@class weztermConfig
local M = {}

---Interpret the WezTerm user var that is passed in and make the appropriate
---changes to the given overrides table; for use within a callback function
---in WezTerm config for the `user-var-changed` event.
---
---@param overrides Config
---@param name string
---@param value string
---@return Config overrides
function M.override_user_var(overrides, name, value) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
