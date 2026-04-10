---@meta
---@diagnostic disable:unused-local

---@enum Log.Levels.Level
local levels = { DEBUG = 0, INFO = 1, WARN = 2, ERROR = 3 }

---@class Log.Levels
---@field levels Log.Levels.Level Level constants.
---@field names  table<integer, string> Map from numeric level to its name.
local Levels = {}

---Normalize a log level from string or integer.
---
---If a string is provided (e.g., `"info"`), it is uppercased and mapped to its
---integer value. Returns `nil` for unrecognised level strings.
---
---@param level Log.Levels.Level|string|integer Level representation to normalize.
---@return integer|nil level Normalized numeric level, or nil if unrecognised.
function Levels.normalize(level) end

---@alias Log.Sink fun(entry: Log.Event): any|nil
---@alias Log.Level Log.Levels.Level|string|integer

---@class Log.Event
---@field timestamp   integer Unix timestamp in seconds.
---@field datetime    string  Local timestamp formatted as `%Y-%m-%d %H:%M:%S%.3f`.
---@field level       integer Log severity level.
---@field level_name  string  Human-readable name of the log level.
---@field tag         string  Identifier of the logger instance.
---@field message     string  Final formatted log message.
---@field raw_message string  Original message string before formatting.

---@class Log.Config.Sinks
---@field default_enabled boolean Prepend the default WezTerm sink to every logger.

---@class Log.Config
---@field enabled   boolean          Whether logging is globally enabled.
---@field threshold string|integer   Minimum log level.
---@field sinks     Log.Config.Sinks Sink-related settings.

---@class Log.ConfigModule
local ConfigModule = {}

---Return the current configuration (read-only reference).
---
---@return Log.Config
function ConfigModule.get() end

---Override configuration values.
---
---Only keys present in the defaults are accepted; unknown keys are silently
---ignored. The `sinks` sub-table is merged one level deep.
---
---@param overrides? table Partial config to merge.
function ConfigModule.setup(overrides) end

---@alias Log.Sinks.FileFormat "json"|"text"
---@alias Log.Sinks.FileFormatter fun(event: Log.Event): string

---@class Log.Sinks.FileOpts
---@field path?      string                  Destination file path. Auto-resolved when omitted.
---@field format?    Log.Sinks.FileFormat    Output format. Defaults to `"json"`.
---@field formatter? Log.Sinks.FileFormatter Custom formatter. When provided, it overrides `format`.

---@class Log.Sinks.FileSink
---@field path      string                       Resolved destination file path.
---@field format    Log.Sinks.FileFormat          Output format for written entries.
---@field formatter Log.Sinks.FileFormatter|nil   Custom formatter used for serialization.
local FileSink = {}

---Serialize an event to the configured file format.
---
---@param event Log.Event
---@return boolean ok
---@return string payload_or_err
function FileSink:serialize(event) end

---Append raw text to the sink file.
---
---@param payload string
---@return boolean ok
---@return string|nil err
function FileSink:append(payload) end

---Encode and append an event as a formatted line.
---
---@param event Log.Event
function FileSink:write(event) end

---@class Log.Sinks.Json
local Json = {}

---Encode a Lua value to a JSON string.
---
---@param value any
---@return string
function Json.encode(value) end

---Decode a JSON string back to a Lua value.
---
---@param payload string
---@return any
function Json.decode(payload) end

---Emit an event as a single JSON line through WezTerm's logger.
---
---@param event Log.Event
---@return nil
function Json.write(event) end

---@class Log.Sinks.MemoryOpts
---@field max_entries? integer Maximum stored entries. Oldest are evicted when full. 0 = unlimited. Defaults to 10 000.

---@class Log.Sinks.MemorySink
---@field entries     Log.Event[] Stored log events.
---@field max_entries integer     Maximum stored entries (0 = unlimited).
local MemorySink = {}

---Store event in memory.
---
---When `max_entries` is reached the oldest entry is discarded.
---
---@param event Log.Event Log event to store.
function MemorySink:write(event) end

---Remove all stored log entries.
function MemorySink:clear() end

---Return shallow copy of stored entries.
---
---@return Log.Event[] entries Copy of stored log events.
function MemorySink:get_entries() end

---Get number of entries in memory.
---
---@return integer count Number of stored entries.
function MemorySink:count() end

---Stringify all entries into human-readable lines.
---
---Formats entries as `[LEVEL] Message`, separated by newlines.
---
---@return string formatted_log Concatenated string of all log entries.
function MemorySink:to_string() end

---@class Log.Sinks
---@field wz     Log.Sink                                               WezTerm native logging sink.
---@field json   Log.Sinks.Json                                         JSON encode/decode helpers and JSON sink.
---@field memory fun(opts?: Log.Sinks.MemoryOpts): Log.Sinks.MemorySink Memory sink constructor.
---@field file   fun(opts?: Log.Sinks.FileOpts): Log.Sinks.FileSink     File sink constructor.

---A lightweight wrapper around WezTerm logging facilities.
---
---Logging is globally gated by `Log.Config.enabled`. When set to `false`, all
---logger instances are silenced.
---@class Log
---@field tag       string     Printable name prefix included in each log line.
---@field enabled   boolean    Whether this logger instance is currently enabled.
---@field threshold integer    Minimum level required for logs to be emitted.
---@field sinks     Log.Sink[] List of active sinks.
local Log = {}

---Create new logger instance.
---
---If `config.sinks.default_enabled` is true, the default sink is prepended
---to the list. The provided `sinks` array is shallow-copied and never mutated.
---
---@param tag?     string     Identifier printed in brackets before message. Defaults to `"Log"`.
---@param enabled? boolean    Enable logging status. Defaults to `true`.
---@param sinks?   Log.Sink[] List of sinks to output to.
---@return Log
function Log.new(tag, enabled, sinks) end

---Add sink to the sinks table.
---
---@param sink Log.Sink Function to handle log entry.
function Log:add_sink(sink) end

---Log message with specified log level.
---
---Accepts simple string or format string. Non-string arguments are stringified
---(userdata via `tostring`, others via pretty-printing when available).
---
---@param level   Log.Level Severity level.
---@param message string    Log message or format string.
---@param ...     any       Additional arguments to format into message.
function Log:log(level, message, ...) end

---Log debug level message.
---
---Prepends `"DEBUG: "` to the message string.
---
---@param message string Log message or format string.
---@param ...     any    Additional arguments to format into message.
function Log:debug(message, ...) end

---Log information level message.
---
---@param message string Log message or format string.
---@param ...     any    Additional arguments to format into message.
function Log:info(message, ...) end

---Log warning level message.
---
---@param message string Log message or format string.
---@param ...     any    Additional arguments to format into message.
function Log:warn(message, ...) end

---Log error level message.
---
---@param message string Log message or format string.
---@param ...     any    Additional arguments to format into message.
function Log:error(message, ...) end

---@class Log.API : Log
---@field setup   fun(overrides?: table) Override default config values.
---@field sinks   Log.Sinks              Lazy-loaded sink registry.
---@field levels  Log.Levels             Level constants and normalisation.
---@field config  Log.ConfigModule       Configuration module.

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
