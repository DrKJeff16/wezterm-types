---@meta
---@diagnostic disable:unused-local

---@alias Schema SchemaScope|(string|Entry)[]

---@class SchemaScope
---@field [integer] Schema
---@field options SchemaOptions
---@field processing (fun(schema: Entry[]): entries: Entry[])[]

---@class SchemaOptions
---@field always_fuzzy? boolean
---@field callback? fun(window: Window, pane: Pane, id: string, label: string)
---@field prompt? string
---@field title? string

---@class Entry
---@field id string
---@field label string

---@class Sessionizer.DefaultWorkspaceOpts
---@field id_overwrite? string
---@field label_overwrite? string

---@class Sessionizer.AllActiveWorkspacesOpts
---@field filter_current? boolean
---@field filter_default? boolean

---@class Sessionizer.FdSearchOpts
---@field [1] string
---@field exclude? string[]
---@field extra_args? string[]
---@field fd_path? string
---@field format? string
---@field include_submodules? boolean
---@field max_depth? integer

---@class Sessionizer
local M = {}

---@param opts Sessionizer.AllActiveWorkspacesOpts
---@return (fun(): entries: Entry[]) callback
function M.AllActiveWorkspaces(opts) end

---@param window Window The `Window` object.
---@param pane Pane The `Pane` object.
---@param id string
---@param label string
function M.DefaultCallback(window, pane, id, label) end

---@param opts Sessionizer.DefaultWorkspaceOpts
---@return (fun(): entries: Entry[]) callback
function M.DefaultWorkspace(opts) end

---@param opts string|Sessionizer.FdSearchOpts
---@return (fun(): entries: Entry[]) callback
function M.FdSearch(opts) end

---@param config Config
function M.apply_to_config(config) end

---@param f fun(entry: Entry)
---@return fun(entries: Entry[]) func
function M.for_each_entry(f) end

---@param schema Schema
function M.show(schema) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
