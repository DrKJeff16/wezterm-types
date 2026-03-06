---@meta
---@diagnostic disable:unused-local

---@class SWSChoiceOpts
---@field extra_args? string
---@field workspace_ids? table<string, boolean>

---@class SWSInputSelectorChoice
---@field id string
---@field label string

---@class SWSChoices
local C = {}

---@param choices SWSInputSelectorChoice[]
---@return SWSInputSelectorChoice[] choice_table
---@return table<string, boolean> workspace_ids
function C.get_workspace_elements(choices) end

---@param choices SWSInputSelectorChoice[]
---@param opts? SWSChoiceOpts
---@return SWSInputSelectorChoice[] choice_table
function C.get_zoxide_elements(choices, opts) end

---@class SWS
---@field choices SWSChoices
---@field zoxide_path string
local M = {}

---Sets default keybind to ALT-s.
---
---@param config Config
function M.apply_to_config(config) end

---Returns choices for the InputSelector.
---
---@param opts? SWSChoiceOpts
---@return SWSInputSelectorChoice[] choices
function M.get_choices(opts) end

---@return { EmitEvent: string } action_callback
function M.switch_to_prev_workspace() end

---@param opts? SWSChoiceOpts
---@return { EmitEvent: string } action_callback
function M.switch_workspace(opts) end

---@param label string
---@return string str
function M.workspace_formatter(label) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
