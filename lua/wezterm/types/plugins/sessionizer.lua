---@meta
---@diagnostic disable:unused-local

---@alias Schema SchemaScope|(string|Entry)[]

---@class SchemaScope
---@field options SchemaOptions
---@field processing (fun(schema: Entry[]): entries: Entry[])[]
---@field [integer] Schema

---@class SchemaOptions
---@field title? string
---@field prompt? string
---@field always_fuzzy? boolean
---@field callback? fun(window: Window, pane: Pane, id: string, label: string)

---@class Entry
---@field id string
---@field label string

---@class Sessionizer.DefaultWorkspaceOpts
---@field id_overwrite? string
---@field label_overwrite? string

---@class Sessionizer.AllActiveWorkspacesOpts
---@field filter_default? boolean
---@field filter_current? boolean

---@class Sessionizer.FdSearchOpts
---@field [1] string
---@field fd_path? string
---@field include_submodules? boolean
---@field max_depth? integer
---@field format? string
---@field exclude? string[]
---@field extra_args? string[]

---@class Sessionizer
local M = {}

---@param config Config
function M.apply_to_config(config) end

---@param schema Schema
function M.show(schema) end

---@param f fun(entry: Entry)
---@return fun(entries: Entry[]) func
function M.for_each_entry(f) end

---@param window Window The `Window` object.
---@param pane Pane The `Pane` object.
---@param id string
---@param label string
function M.DefaultCallback(window, pane, id, label) end

---@param opts Sessionizer.AllActiveWorkspacesOpts
---@return fun(): entries: Entry[] callback
function M.AllActiveWorkspaces(opts) end

---@param opts Sessionizer.DefaultWorkspaceOpts
---@return fun(): entries: Entry[] callback
function M.DefaultWorkspace(opts) end

---@param opts string|Sessionizer.FdSearchOpts
---@return fun(): entries: Entry[]
function M.FdSearch(opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
