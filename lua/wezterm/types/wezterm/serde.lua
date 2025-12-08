---@meta

---The `wezterm.serde` module provides functions for parsing the given string as
---JSON, YAML, or TOML, returning the corresponding Lua values, and vice versa.
---
---@class Wezterm.Serde
local Serde = {}

---Parses the supplied string as JSON and returns the equivalent Lua values.
---
---@param value string
---@return table data
function Serde.json_decode(value) end

---Encodes the supplied Lua value as JSON.
---
---@param value table
---@return string data
function Serde.json_encode(value) end

---Encodes the supplied Lua value as a pretty-printed string of JSON.
---
---@param value table
---@return string data
function Serde.json_encode_pretty(value) end

---Parses the supplied string as TOML and returns the equivalent Lua values.
---
---@param value string
---@return table data
function Serde.toml_decode(value) end

---Encodes the supplied Lua value as TOML.
---
---@param value table
---@return string data
function Serde.toml_encode(value) end

---Encodes the supplied Lua value as a pretty-printed string of TOML.
---
---@param value table
---@return string data
function Serde.toml_encode_pretty(value) end

---Parses the supplied string as YAML and returns the equivalent Lua values.
---
---@param value string
---@return table data
function Serde.yaml_decode(value) end

---Encodes the supplied Lua value as YAML.
---
---@param value table
---@return string data
function Serde.yaml_encode(value) end

-- vim:ts=4:sts=4:sw=4:et:ai:si:sta:
