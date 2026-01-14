---@meta

---@class Time.SunTimes
---@field progression number
---@field rise? Time
---@field set? Time
---@field up boolean

---Represents a date and time that is tracked internally
---as UTC.
---
---Using `tostring()` on a Time object will show
---the internally tracked UTC time information.
---
---@class Time
local M = {}

---Formats the time object as a string,
---using the local date/time representation of the time.
---
---The format string supports the
---[set of formatting placeholders described here](https://docs.rs/chrono/latest/chrono/format/strftime/index.html).
---
---@param format string
---@return string date
function M:format(format) end

---Formats the time object as a string,
---using UTC date/time representation of the time.
---
---The format string supports the
---[set of formatting placeholders described here](https://docs.rs/chrono/latest/chrono/format/strftime/index.html).
---
---@param format string
---@return string date
function M:format_utc(format) end

---For the date component of the time object,
---compute the times of the sun rise
---and sun set for the given latitude and longitude.
---
---For the time component of the time object,
---compute whether the sun is currently up,
---and the progression of the sun through
---either the day or night.
---
---Returns that information as a
---[`Time.SunTimes`](lua://Time.SunTimes) table.
---
---This information is potentially useful
---if you want to vary color scheme
---or other configuration based on the time of day.
---
---If the provided `latitude` and `longitude` specify
---a location at one of the poles, then the day or night
---may be longer than 24 hours.
---In that case the `rise` and `set` values will be `nil`,
---`progression` will be `0` and `up` will indicate either
---if it is polar daytime (`true`) or polar night time (`false`).
---
---@param lat number
---@param lon number
---@return Time.SunTimes sun_times
function M:sun_times(lat, lon) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
