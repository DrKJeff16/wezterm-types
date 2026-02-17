---@meta
---@diagnostic disable:unused-local

---@class WezTmuxAction
---@field ClearPattern ActionClass|KeyAssignFunction
---@field ClearSelectionOrClearPatternOrClose ActionClass|KeyAssignFunction
---@field MovePaneToNewTab ActionClass|KeyAssignFunction
---@field NextMatch ActionClass|KeyAssignFunction
---@field PriorMatch ActionClass|KeyAssignFunction
---@field RenameCurrentTab ActionClass|KeyAssignFunction
---@field RenameWorkspace ActionClass|KeyAssignFunction
---@field SearchBackward ActionClass|KeyAssignFunction
---@field SearchForward ActionClass|KeyAssignFunction
---@field WorkspaceSelect ActionClass|KeyAssignFunction

---@alias WezTmuxOpts { tab_and_split_indices_are_zero_based?: boolean }

---@class WezTmux
---@field action WezTmuxAction
local M = {}

---@param config Config
---@param opts? WezTmuxOpts
function M.apply_to_config(config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
