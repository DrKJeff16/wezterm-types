---@meta
---@diagnostic disable:unused-local

---@enum (key) Behavior
local behavior = {
  error = 1,
  keep = 1,
  force = 1,
}

---@class DevOpts
---@field auto? boolean
---@field fetch_branch? boolean
---@field ignore_branch? string[]|string
---@field keywords? string[]

---@class CacheElement
---@field auto? boolean
---@field branch? string
---@field error? boolean
---@field fetch_branch? boolean
---@field file? string
---@field ignore_branch? string[]|string
---@field keywords? string[]
---@field plugin_path? string
---@field require_path? string

---@class Dev
---@field bootstrap boolean
---@field cache table<string, CacheElement>
---@field dev_cache_element CacheElement
---@field substitutions table<string, string>|nil
---@field utils boolean
local M = {}

---@param hashkey string
---@return string|nil plugin_path
function M.get_plugin_path(hashkey) end

---@param hashkey string
---@return string|nil require_path
function M.get_require_path(hashkey) end

---@param url string
---@param opts? DevOpts
---@return any?
function M.require(url, opts) end

---@param substitute_dict table<string, string>
function M.set_substitutions(substitute_dict) end

---Set the wezterm require path for the plugin.
---
---@param hashkey string
function M.set_wezterm_require_path(hashkey) end

---@param opts? DevOpts
---@return string|nil hashkey
---@return string|nil plugin_path
function M.setup(opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
