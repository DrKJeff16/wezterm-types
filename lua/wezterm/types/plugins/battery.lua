---@meta
---@diagnostic disable:unused-local

---@enum (key) BatteryCondition
local condition = {
  Charging = 1,
  Discharging = 1,
  Empty = 1,
  Full = 1,
  Unknown = 1,
}

--- BatteryComponent class representing battery information.
---@class BatteryComponent
---The battery icon and percentage (e.g. `"󰂉  100%"`).
---
---@field battery string
---The battery condition ("Full", "Empty", "Charging", "Discharging", "Unknown").
---
---@field condition BatteryCondition
---The icon representing the battery status (e.g. `"󰢜 "`).
---
---@field icon string
---The battery percentage (from `0.0` to `1.0`).
---
---@field percent number
---The remaining time in minutes.
---
---@field time integer
local B = {}

---The remaining time as a string (e.g. `"10:00"`).
---
---@return string remaining_time
function B.remaining() end

---The `battery.wez` module.
---
---@class BatteryWez
---@field invert boolean Whether to invert colors
local M = {}

---Apply plugin configuration.
---
---@param config Config WezTerm configuration table
function M.apply_to_config(config) end

---Returns battery components for each battery.
---
---If no batteries are detected, an empty table is returned.
---
---@return BatteryComponent[] batteries A list of battery components.
function M.get_batteries() end

---Returns battery icons for all batteries.
---
---If no batteries are detected, an empty string is returned.
---
---@return string battery_icons A formatted string containing the battery icons.
function M.get_battery_icons() end

---Returns battery statistics for all batteries.
---
---If no batteries are detected, an empty string is returned.
---
---@return string battery_stats A formatted string containing the battery stats.
function M.get_battery_stats() end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
