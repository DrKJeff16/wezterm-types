---@meta
---@diagnostic disable:unused-local

---@class WezTmuxAction
---@field ClearPattern "ClearPattern"|fun(params: any): { ClearPattern: any }
---@field ClearSelectionOrClearPatternOrClose "ClearSelectionOrClearPatternOrClose"|fun(params: any): { ClearSelectionOrClearPatternOrClose: any }
---@field MovePaneToNewTab "MovePaneToNewTab"|fun(params: any): { MovePaneToNewTab: any }
---@field NextMatch "NextMatch"|fun(params: any): { NextMatch: any }
---@field PriorMatch "PriorMatch"|fun(params: any): { PriorMatch: any }
---@field RenameCurrentTab "RenameCurrent"|fun(params: any): { RenameCurrent: any }
---@field RenameWorkspace "RenameWorkspace"|fun(params: any): { RenameWorkspace: any }
---@field SearchBackward "SearchBackward"|fun(params: any): { SearchBackward: any }
---@field SearchForward "SearchForward"|fun(params: any): { SearchForward: any }
---@field WorkspaceSelect "WorkspaceSelect"|fun(params: any): { WorkspaceSelect: any }

---@class WezTmuxOpts
---@field tab_and_split_indices_are_zero_based? boolean

---@class WezTmux
---@field action WezTmuxAction
local M = {}

---@param config Config
---@param opts? WezTmuxOpts
function M.apply_to_config(config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
