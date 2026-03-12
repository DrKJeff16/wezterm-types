---@meta
---@diagnostic disable:unused-local

---@class CmdPickerBinding: Key
---@field key string
---@field mods string
---@field action Action
---@field desc? string

---@class CmdPickerOpts
---@field key? string
---@field mods? string
---@field title? string
---@field include_defaults? boolean
---@field include_key_tables? boolean
---@field fuzzy? boolean
---@field fuzzy_description? string

---@class CmdPicker
local M = {}

---Inject the trigger keybinding into config.keys.
---
---Call this AFTER all keybindings are defined.
---
---@param config Config
---@param opts? CmdPickerOpts
function M.apply_to_config(config, opts) end

---Registers bindings for the picker and optionally adds them to `config.keys`.
---
---Add bindings to `config.keys`:
---```lua
---add_keys(config, bindings)
---```
---
---Register existing bindings for the picker without modifying config.keys.
---Useful when you define keybindings in a separate file that returns a keys list:
---```lua
---add_keys(bindings)
---```
---
---Bindings can include an optional `desc` field for human-readable descriptions.
---
---@param bindings CmdPickerBinding[]
function M.add_keys(bindings) end

---Registers bindings for the picker and optionally adds them to `config.keys`.
---
---Add bindings to `config.keys`:
---```lua
---add_keys(config, bindings)
---```
---
---Register existing bindings for the picker without modifying config.keys.
---Useful when you define keybindings in a separate file that returns a keys list:
---```lua
---add_keys(bindings)
---```
---
---Bindings can include an optional `desc` field for human-readable descriptions.
---
---@param config Config
---@param bindings CmdPickerBinding[]
function M.add_keys(config, bindings) end

---@param bindings CmdPickerBinding[]
function M.register(bindings) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
