---@meta
---@diagnostic disable:unused-local

---@class WorkspacePickerColors
---@field current_indicator? string
---@field path? string
---@field text? string
---@field workspace_prefix? string
---@field zoxide_prefix? string

---@class WorkspacePickerKeybind: SendKeyParams
---@field mods string

---@class WorkspacePickerKeybinds
---@field create_workspace? WorkspacePickerKeybind
---@field rename_workspace? WorkspacePickerKeybind
---@field show_picker? WorkspacePickerKeybind

---@class WorkspacePickerLabels
---@field current? string
---@field workspace? string
---@field zoxide? string

---@class WorkspacePickerConfig
---@field colors? WorkspacePickerColors
---@field keybinds? WorkspacePickerKeybinds
---@field labels? WorkspacePickerLabels
---@field zoxide_path? string

---@class WorkspacePicker
local M = {}

---Add keybindings to your WezTerm config.
---
---@param config Config
---@param opts? WorkspacePickerConfig
---@return Config config
function M.apply_to_config(config, opts) end

---Create new workspace manually.
---
---@return { PromptInputLine: PromptInputLineParams } action
function M.create_workspace_manually() end

---Rename workspace.
---
---@return { PromptInputLine: PromptInputLineParams } action
function M.rename_workspace() end

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

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
