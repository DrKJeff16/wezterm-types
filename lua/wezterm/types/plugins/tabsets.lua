---@meta
---@diagnostic disable:unused-local

---@class TabsetsData
---@field window_width integer
---@field window_height integer
---@field colors table
---@field tabs Tabsets.TabData[]

---@class Tabsets.TabData
---@field title string
---@field panes TabsetPaneData[]

---@class TabsetPaneData
---@field left integer
---@field cwd string
---@field exe string

---@class TabsetsOpts
---Path to the directory containing tabset JSON files.
---
---@field tabsets_dir? string
---Restore custom colors when loading empty window.
---
---@field restore_colors? boolean
---Restore window dimensions when loading empty window.
---
---@field restore_dimensions? boolean
---Fuzzy match tabset name selection.
---
---@field fuzzy_selector? boolean

---@class Tabsets
---@field options TabsetsOpts
local M = {}

---Load and restore a tabset by its logical name.
---
---If loading or recreation fails, a notification is shown to the user.
---
---@param window Window Active WezTerm window.
---@param tabset_name string Tabset name (without extension), defaults to `"default"`.
function M.load_tabset_by_name(window, tabset_name) end

---Interactively load a saved tabset.
---
---Shows a selector of available tabsets, then calls @{load_tabset_by_name} on the chosen entry.
---
---@param window Window Active WezTerm window.
function M.load_tabset(window) end

---Interactively delete a saved tabset.
---
---Prompts for a tabset, deletes the corresponding JSON file and notifies the user.
---
---@param window Window Active WezTerm window.
function M.delete_tabset(window) end

---Interactively save the current window layout as a tabset.
---
---Prompts for a tabset name, validates it and writes a JSON description to disk.
---
---@param window Window Active WezTerm window.
function M.save_tabset(window) end

---Rename a tabset.
---
---@param window Window Active WezTerm window
function M.rename_tabset(window) end

---Initialize plugin and set configuration options.
---
---@param opts? TabsetsOpts Options table.
function M.setup(opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
