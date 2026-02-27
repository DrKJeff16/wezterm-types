---@meta
---@diagnostic disable:unused-local

---@class ThemeRotatorOpts
---Customize "Default Theme" key.
---
---@field default_theme_key? string
---@field default_theme_mods? string
---Customize "Next Theme" key.
---
---@field next_theme_key? string
---@field next_theme_mods? string
---Customize "Previous Theme" key.
---
---@field prev_theme_key? string
---@field prev_theme_mods? string
---Customize "Random Theme" key.
---
---@field random_theme_key? string
---@field random_theme_mods? string

---@class ThemeRotator
local M = {}

---Apply configuration to WezTerm.
---
---@param config Config
---@param options? ThemeRotatorOpts
---@return Config config
function M.apply_to_config(config, options) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
