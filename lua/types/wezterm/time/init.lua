---@meta

-- The `wezterm.time` module exposes functions that allow working with time
---@class Wezterm.Time
--  Arranges to call your callback function after the specified number of seconds have elapsed
---@field call_after fun(interval: number, function: function): nil
--  Returns a WezTermTime object representing the time at which `wezterm.time.now()` was called
---@field now fun(): Time
--  Parses a string that is formatted according to the supplied format string
---@field parse fun(string): Time
--  Parses a string that is formatted according to `RFC 3339`
--  and returns a Time object representing that time
---@field parse_rfc3339 fun(string): Time
