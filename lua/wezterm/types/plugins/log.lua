---@meta
---@diagnostic disable:unused-local

---@enum Log.Levels.Level
local levels = { DEBUG = 0, INFO = 1, WARN = 2, ERROR = 3 }

---@enum (key) Log.Sinks.FileFormat
local ff = { json = 1, text = 1 }

---@class Log.Levels
---Level constants.
---
---@field levels Log.Levels.Level
---Map from numeric level to its name.
---
---@field names table<integer, string>
local Levels = {}

---Normalize a log level from string or integer.
---
---If a string is provided (e.g., `"info"`), it is uppercased and mapped to its
---integer value. Returns `nil` for unrecognised level strings.
---
---@param level Log.Levels.Level|string|integer Level representation to normalize.
---@return integer|nil level Normalized numeric level, or `nil` if unrecognised.
function Levels.normalize(level) end

---@class Log.Event
---Local timestamp formatted as `%Y-%m-%d %H:%M:%S%.3f`.
---
---@field datetime string
---Log severity level.
---
---@field level integer
---Human-readable name of the log level.
---
---@field level_name string
---Final formatted log message.
---
---@field message string
---Original message string before formatting.
---
---@field raw_message string
---Identifier of the logger instance.
---
---@field tag string
---UNIX timestamp in seconds.
---
---@field timestamp integer

---@class Log.Config.Sinks
---Prepend the default WezTerm sink to every logger.
---
---@field default_enabled? boolean

---@class Log.Config
---Whether logging is globally enabled.
---
---@field enabled? boolean
---Sink-related settings.
---
---@field sinks? Log.Config.Sinks
---Minimum log level.
---
---@field threshold? string|integer

---@class Log.ConfigModule
local ConfigModule = {}

---Return the current configuration (read-only reference).
---
---@return Log.Config reference
function ConfigModule.get() end

---Override configuration values.
---
---Only keys present in the defaults are accepted; unknown keys are silently
---ignored. The `sinks` sub-table is merged one level deep.
---
---@param overrides? table Partial config to merge.
function ConfigModule.setup(overrides) end

---@class Log.Sinks.FileOpts
---Output format.
---
---Defaults to `"json"`.
---
---@field format? Log.Sinks.FileFormat
---Custom formatter. When provided, it overrides `format`.
---
---@field formatter? fun(event: Log.Event): string
---Destination file path. Auto-resolved when omitted.
---
---@field path? string

---@class Log.Sinks.FileSink
---Output format for written entries.
---
---@field format Log.Sinks.FileFormat
---Custom formatter used for serialization.
---
---@field formatter nil|fun(event: Log.Event): string
---Resolved destination file path.
---
---@field path string
---@overload fun(event: Log.Event)
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
---@overload fun(event: Log.Event)
local Json = {}

---Encode a Lua value to a JSON string.
---
---@param value any
---@return string encoded_str
function Json.encode(value) end

---Decode a JSON string back to a Lua value.
---
---@param payload string
---@return any data
function Json.decode(payload) end

---Emit an event as a single JSON line through WezTerm's logger.
---
---@param event Log.Event
function Json.write(event) end

---@class Log.Sinks.MemoryOpts
---Maximum stored entries.
---Oldest are evicted when full. `0` == unlimited.
---
---Defaults to `10000`.
---
---@field max_entries? integer

---@class Log.Sinks.MemorySink
---Stored log events.
---
---@field entries Log.Event[]
---Maximum stored entries (`0` == unlimited).
---
---@field max_entries integer
---@overload fun(event: Log.Event)
local MemorySink = {}

---Store event in memory.
---
---When `max_entries` is reached the oldest entry is discarded.
---
---@param event Log.Event Log event to store.
function MemorySink:write(event) end

---Remove all stored log entries.
---
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
---JSON encode/decode helpers and JSON sink.
---
---@field json Log.Sinks.Json
local Sinks = {}

---File sink constructor.
---
---@param opts? Log.Sinks.FileOpts
---@return Log.Sinks.FileSink file_sink
function Sinks.file(opts) end

---Memory sink constructor.
---
---@param opts? Log.Sinks.MemoryOpts
---@return Log.Sinks.MemorySink memory_sink
function Sinks.memory(opts) end

---WezTerm native logging sink.
---
---@param entry Log.Event
---@return any sink
function Sinks.wz(entry) end

---A lightweight wrapper around WezTerm logging facilities.
---
---Logging is globally gated by `Log.Config.enabled`.
---When set to `false`, all logger instances are silenced.
---
---@class Log
---Whether this logger instance is currently enabled.
---
---@field enabled boolean
---List of active sinks.
---
---@field sinks (fun(entry: Log.Event): any)[]
---Printable name prefix included in each log line.
---
---@field tag string
---Minimum level required for logs to be emitted.
---
---@field threshold integer
local Log = {}

---Create new logger instance.
---
---If `config.sinks.default_enabled` is true, the default sink is prepended
---to the list. The provided `sinks` array is shallow-copied and never mutated.
---
---@param tag? string Identifier printed in brackets before message. Defaults to `"Log"`.
---@param enabled? boolean Enable logging status. Defaults to `true`.
---@param sinks? (fun(entry: Log.Event): any)[] List of sinks to output to.
---@return Log instance
function Log.new(tag, enabled, sinks) end

---Add sink to the sinks table.
---
---@param sink fun(entry: Log.Event): any Function to handle log entry.
function Log:add_sink(sink) end

---Log message with specified log level.
---
---Accepts simple string or format string. Non-string arguments are stringified
---(userdata via `tostring()`, others via pretty-printing when available).
---
---@param level Log.Levels.Level|string|integer Severity level.
---@param message string Log message or format string.
---@param ... any Additional arguments to format into message.
function Log:log(level, message, ...) end

---Log debug level message.
---
---Prepends `"DEBUG: "` to the message string.
---
---@param message string Log message or format string.
---@param ... any Additional arguments to format into message.
function Log:debug(message, ...) end

---Log information level message.
---
---@param message string Log message or format string.
---@param ... any Additional arguments to format into message.
function Log:info(message, ...) end

---Log warning level message.
---
---@param message string Log message or format string.
---@param ... any Additional arguments to format into message.
function Log:warn(message, ...) end

---Log error level message.
---
---@param message string Log message or format string.
---@param ... any Additional arguments to format into message.
function Log:error(message, ...) end

---@class Log.API: Log
---Configuration module.
---
---@field config Log.ConfigModule
---Level constants and normalisation.
---
---@field levels Log.Levels
---Lazy-loaded sink registry.
---
---@field sinks Log.Sinks
local Api = {}

---Override default config values.
---
---@param overrides? table
function Api.setup(overrides) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
