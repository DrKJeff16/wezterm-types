---@meta
---@diagnostic disable:unused-local

---@class Quick_SelectOpts.Action
---@field filter string
local A = {}

---@param window Window
---@param pane Pane
---@param selection string
---@param opts Quick_SelectOpts
function A.action(window, pane, selection, opts) end

---@class Quick_SelectOpts
---@field key? string
---@field mods? string
---@field text_extensions? table<string, boolean>
---@field patterns? string[]
---@field actions? Quick_SelectOpts.Action[]
---@field direction? PaneDirection

---@class Quick_Select.Filters
local F = {}

---@param str string
---@return fun(selection: string): startswith: boolean
function F.startswith(str) end

---@param str string
---@return fun(selection: string): ...: any
function F.match(str) end

---@class Quick_Select
---@field filters Quick_Select.Filters
local M = {}

---@param config Config
---@param opts? Quick_SelectOpts
function M.apply_to_config(config, opts) end

---@param window Window
---@param pane Pane
---@param url string
---@param opts Quick_SelectOpts
function M.open_with_hx(window, pane, url, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
