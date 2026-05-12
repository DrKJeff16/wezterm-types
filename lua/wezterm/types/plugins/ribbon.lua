---@meta
---@diagnostic disable:unused-local

---@alias Ribbon.Attribute string|string[]
---@alias Ribbon.FormatItem string|table

---@class Ribbon.LogConfig
---@field enabled boolean
---@field threshold "DEBUG"|"INFO"|"WARN"|"ERROR"|integer
---@field sinks? table Accepted for compatibility with older layout options.

---@class Ribbon.Defaults
---@field foreground? string Default foreground color.
---@field background? string Default background color.
---@field attributes table<string, table|string> Named text attributes.
---@field colors table<string, boolean> ANSI color-name lookup table.

---@class Ribbon.TextConfig
---@field strip boolean Trim text before inserting it.
---@field max_length? integer Maximum text length before truncation.
---@field transform? fun(text: string): string Text transform callback.

---@class Ribbon.Config
---@field log Ribbon.LogConfig
---@field defaults Ribbon.Defaults
---@field attribute_aliases table<string, string|string[]> Attribute aliases.
---@field validate_attributes boolean Warn or error on unknown attributes.
---@field strict_mode boolean Error on unknown attributes when validation is enabled.
---@field text Ribbon.TextConfig
---@field atomic boolean Reset attributes after every text segment.

---@class Ribbon.ConfigModule
local Config = {}

---Configure Ribbon.
---@param opts? table Partial Ribbon configuration.
---@return Ribbon.Config config
function Config.setup(opts) end

---Return the active Ribbon configuration.
---@return Ribbon.Config config
function Config.get() end

---Return a copy of Ribbon defaults.
---@return Ribbon.Config defaults
function Config.defaults() end

---@class Ribbon
---@field atomic? boolean Whether attributes reset after each segment.
---@field log table Logger instance.
local R = {}

---Add an element to the ribbon.
---@param action "append"|"prepend"
---@param background? string Background color name or value.
---@param foreground? string Foreground color name or value.
---@param text? string Text to insert.
---@param attributes? Ribbon.Attribute Text attributes or aliases.
---@return Ribbon|nil self
function R:add(action, background, foreground, text, attributes) end

---Append a formatted text segment.
---@param background? string Background color name or value.
---@param foreground? string Foreground color name or value.
---@param text? string Text to insert.
---@param attributes? Ribbon.Attribute Text attributes or aliases.
---@return Ribbon|nil self
function R:append(background, foreground, text, attributes) end

---Prepend a formatted text segment.
---@param background? string Background color name or value.
---@param foreground? string Foreground color name or value.
---@param text? string Text to insert.
---@param attributes? Ribbon.Attribute Text attributes or aliases.
---@return Ribbon|nil self
function R:prepend(background, foreground, text, attributes) end

---Append raw `wezterm.format` items.
---@param items Ribbon.FormatItem|Ribbon.FormatItem[]|nil Format item or list of items.
---@return Ribbon self
function R:append_items(items) end

---Prepend raw `wezterm.format` items.
---@param items Ribbon.FormatItem|Ribbon.FormatItem[]|nil Format item or list of items.
---@return Ribbon self
function R:prepend_items(items) end

---Clear all ribbon items.
---@return Ribbon self
function R:clear() end

---Append a reset-attributes marker.
function R:reset_attributes() end

---Render with `wezterm.format`.
---@return string formatted
function R:format() end

---Log the ribbon contents.
---@param formatted boolean Log rendered text when true, raw items when false.
function R:debug(formatted) end

---Return the raw format items.
---@return Ribbon.FormatItem[] items
function R:items() end

---@class Ribbon.Api
---@field config Ribbon.ConfigModule Configuration helpers.
local M = {}

---Create a Ribbon instance.
---@param self_or_name? Ribbon.Api|string Ribbon API table when called with `:`, or a name when called with `.`.
---@param name_or_atomic? string|boolean Ribbon name when called with `:`, or atomic flag when called with `.`.
---@param atomic? boolean Atomic flag when called with `:`.
---@return Ribbon ribbon
function M.new(self_or_name, name_or_atomic, atomic) end

---Configure Ribbon.
---@param opts? table Partial Ribbon configuration.
---@return Ribbon.Config config
function M.setup(opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
