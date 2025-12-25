---@meta

---The `wezterm.time` module exposes functions that
---allow working with time.
---
---@class Wezterm.Time
local Time = {}

---Arranges to call your callback function after the specified
---number of seconds have elapsed.
---
---You can use fractional seconds to delay by more precise intervals.
---
---@param interval number
---@param callback function
function Time.call_after(interval, callback) end

---Returns a `Time` object representing the time
---at which this function is called.
---
---See [`Time`](lua://Time).
---
---@return Time current
function Time.now() end

---Parses a string that is formatted according to the supplied format string:
---
---```lua
---wezterm.time.parse("1983 Apr 13 12:09:14.274 +0000", "%Y %b %d %H:%M:%S%.3f %z")
------ "Time(utc: 1983-04-13T12:09:14.274+00:00)"
---```
---
---The format string supports the set of formatting placeholders
---described [here](https://docs.rs/chrono/latest/chrono/format/strftime/index.html).
---
---@param str string
---@param format string
---@return Time parsed
function Time.parse(str, format) end

---Parses a string that is formatted according to `RFC 3339`
---and returns a `Time` object representing said time.
---
---Will raise an error if the input string cannot be parsed
---according to `RFC 3339`.
---
---@param str string
---@return Time parsed
function Time.parse_rfc3339(str) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
