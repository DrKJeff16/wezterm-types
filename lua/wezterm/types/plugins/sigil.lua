---@meta
---@diagnostic disable:unused-local

---@alias Sigil.Padding boolean|"left"|"right"|"both"
---@alias Sigil.FormatItem string|table

---@class Sigil.Entry
---@field key? string Normalized registry key.
---@field name? string Human-readable display name.
---@field icon string Icon glyph.
---@field color? string Icon color.
---@field aliases? string[] Alternative lookup names.

---@class Sigil.FallbackConfig
---@field enabled boolean Return a fallback entry when no key matches.
---@field icon string Fallback icon.
---@field color string Fallback color.
---@field name string Fallback display name.

---@class Sigil.FormattingConfig
---@field reset boolean Append `ResetAttributes` after formatted icons.
---@field padding Sigil.Padding Default icon padding.

---@class Sigil.Config
---@field fallback Sigil.FallbackConfig
---@field formatting Sigil.FormattingConfig
---@field overrides table<string, Sigil.Entry> Entry overrides merged into defaults.
---@field symbols table<string, any> Symbol overrides merged into defaults.

---@class Sigil.LookupOptions
---@field fallback? boolean Return fallback entry when no key matches.

---@class Sigil.ItemsOptions: Sigil.LookupOptions
---@field padding? Sigil.Padding Padding to apply around the icon.
---@field reset? boolean Append `ResetAttributes` after the icon.

---@class Sigil
---@field config Sigil.Config
local M = {}

---Configure Sigil.
---@param opts? table Partial Sigil configuration.
---@return Sigil.Config config
function M.setup(opts) end

---Register or replace a Sigil entry.
---@param key string Lookup key.
---@param entry Sigil.Entry Entry to register.
---@return Sigil.Entry entry Registered entry.
function M.add(key, entry) end

---Return a Sigil entry by key or alias.
---@param key any Lookup key.
---@param opts? Sigil.LookupOptions Lookup options.
---@return Sigil.Entry|nil entry
function M.get(key, opts) end

---Return only the icon for a key or alias.
---@param key any Lookup key.
---@param opts? Sigil.LookupOptions Lookup options.
---@return string|nil icon
function M.icon(key, opts) end

---Return only the color for a key or alias.
---@param key any Lookup key.
---@param opts? Sigil.LookupOptions Lookup options.
---@return string|nil color
function M.color(key, opts) end

---Return raw `wezterm.format` items for a key or alias.
---@param key any Lookup key.
---@param opts? Sigil.ItemsOptions Formatting options.
---@return Sigil.FormatItem[] items
function M.items(key, opts) end

---Render a key or alias with `wezterm.format`.
---@param key any Lookup key.
---@param opts? Sigil.ItemsOptions Formatting options.
---@return string formatted
function M.format(key, opts) end

---Return a symbol by dotted path, such as `Sep.tb.left`.
---@param path string Dotted symbol path.
---@return any symbol
function M.symbol(path) end

---Return all configured symbols.
---@return table symbols
function M.symbols() end

---Return all registered entries.
---@return table<string, Sigil.Entry> entries
function M.all() end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
