---@meta

---The `wezterm.time` module exposes functions that
---allow working with time.
---
---@class Wezterm.Time
local Time = {}

---@param interval number
---@param callback fun()
function Time.call_after(interval, callback) end

---@return Time
function Time.now() end

---@param s string
---@return Time
function Time.parse(s) end

---@param s string
---@return Time
function Time.parse_rfc3339(s) end
