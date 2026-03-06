---@meta
---@diagnostic disable:unused-local

---@class StackWezAction
---@field SpawnPane { EmitEvent: string }
local Action = {}

---@param direction integer
---@return { EmitEvent: string } action_callback
function Action.ActivatePaneRelative(direction) end

---@enum (key) SpawnDirection
local spawn_direction = {
  Bottom = 1,
  Left = 1,
  Right = 1,
  Top = 1,
}

---@class StackWezTabInfo
---@field count integer
---@field index integer

---@class StackWezOpts
---@field enrich_tab_title? boolean
---@field spawn_direction SpawnDirection
---@field spawn_domain? "CurrentPaneDomain"

---@class StackWez
---@field action StackWezAction
local M = {}

---@param user_config StackWezOpts
function M.apply_to_config(_, user_config) end

---@param tab_id integer
---@return StackWezTabInfo|nil info
function M.tab_info(tab_id) end

---@param tab_info TabInformation
---@return string title
function M.tab_title(tab_info) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
