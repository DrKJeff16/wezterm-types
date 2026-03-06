---@meta
---@diagnostic disable:unused-local

---@class Quick_SelectOpts.Action
---@field filter string
local A = {}

---@param window Window The `Window` object.
---@param pane Pane The `Pane` object.
---@param selection string
---@param opts Quick_SelectOpts
function A.action(window, pane, selection, opts) end

---@class Quick_SelectOpts
---@field actions? Quick_SelectOpts.Action[]
---@field direction? PaneDirection
---@field key? string
---@field mods? string
---@field patterns? string[]
---@field text_extensions? table<string, boolean>

---@class Quick_Select.Filters
local F = {}

---@param str string
---@return fun(selection: string): ...: any
function F.match(str) end

---@param str string
---@return fun(selection: string): startswith: boolean
function F.startswith(str) end

---@class Quick_Select
---@field filters Quick_Select.Filters
local M = {}

---@param config Config
---@param opts? Quick_SelectOpts
function M.apply_to_config(config, opts) end

---@param window Window The `Window` object.
---@param pane Pane The `Pane` object.
---@param url string
---@param opts Quick_SelectOpts
function M.open_with_hx(window, pane, url, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
