---@meta
---@diagnostic disable:unused-local

---@class WorkspacePickerColors
---@field workspace_prefix? string
---@field zoxide_prefix? string
---@field current_indicator? string
---@field text? string
---@field path? string

---@class WorkspacePickerKeybind: SendKeyParams
---@field mods string

---@class WorkspacePickerKeybinds
---@field show_picker? WorkspacePickerKeybind
---@field create_workspace? WorkspacePickerKeybind
---@field rename_workspace? WorkspacePickerKeybind

---@class WorkspacePickerLabels
---@field workspace? string
---@field zoxide? string
---@field current? string

---@class WorkspacePickerConfig
---@field zoxide_path? string
---@field colors? WorkspacePickerColors
---@field labels? WorkspacePickerLabels
---@field keybinds? WorkspacePickerKeybinds

---@class WorkspacePicker
local M = {}

---Initialize configuration.
---
---@param opts? WorkspacePickerConfig
---@return WorkspacePicker module
function M.setup(opts) end

---Display workspace selector.
---
---@param window Window The `Window` object.
---@param pane Pane The `Pane` object.
function M.show_workspace_selector(window, pane) end

---Rename workspace.
---
---@return { PromptInputLine: PromptInputLineParams } action
function M.rename_workspace() end

---Create new workspace manually.
---
---@return { PromptInputLine: PromptInputLineParams } action
function M.create_workspace_manually() end

---Add keybindings to your WezTerm config.
---
---@param config Config
---@param opts? WorkspacePickerConfig
---@return Config config
function M.apply_to_config(config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
