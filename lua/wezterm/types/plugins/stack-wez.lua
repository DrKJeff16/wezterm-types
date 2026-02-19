---@meta
---@diagnostic disable:unused-local

---@class StackWezAction
---@field SpawnPane { EmitEvent: string }
local Action = {}

---@return { EmitEvent: string }
function Action.ActivatePaneRelative(direction) end

---@class StackWez
---@field action StackWezAction
local M = {}

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
