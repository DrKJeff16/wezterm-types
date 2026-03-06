---@meta
---@diagnostic disable:unused-local

---@enum (key) WorkspacesionizerOpts.Show
local show = {
  base = 1,
  full = 1,
}

---@class WorkspacesionizerOpts.Binding: SendKeyParams
---The key to press.
---
---@field key? string
---The key to press.
---
---@field mods? string

---@class WorkspacesionizerOpts
---@field binding? WorkspacesionizerOpts
---Set to `false` if you don't want to include the git repositories from your `HOME` directory
---in the directories to switch into.
---
---@field git_repos? boolean
---The paths that contains the directories you want to switch into.
---
---@field paths? string[]
---Wether to show directories base or full name.
---
---@field show? WorkspacesionizerOpts.Show

---@class Workspacesionizer
local M = {}

---@param config Config
---@param options? WorkspacesionizerOpts
---@return Config config
function M.apply_to_config(config, options) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
