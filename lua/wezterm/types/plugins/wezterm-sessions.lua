---@meta
---@diagnostic disable:unused-local

---@class WeztermSessionsOpts
---@field auto_save_interval_s? integer
---@field git_branch_warn? boolean

---@class WeztermSessions
local M = {}

---Sets default keybindings.
---
---@param config Config
---@param user_config? WeztermSessionsOpts
function M.apply_to_config(config, user_config) end

---Allows to select which workspace to delete.
---
---@param window Window
---@param pane Pane
function M.delete_state(window, pane) end

---Allows to select which workspace state to edit in favourite editor.
---
---@param window Window
---@param pane Pane
function M.edit_state(window, pane) end

---Forks the current session into a new one.
---
---@param window Window
---@param pane Pane
function M.fork_state(window, pane) end

---Allows to select which workspace to load or which tab to restore.
---
---@param window Window
---@param pane Pane
function M.load_state(window, pane) end

---Loads the saved json file matching the current workspace.
---
---@param window Window
function M.restore_state(window) end

---Orchestrator function to save the current workspace state.
---
---Collects workspace data, saves it to a JSON file, and displays a notification.
---
---@param window Window
---@param notify boolean
function M.save_state(window, notify) end

---Start autosave.
---
---@param window Window
function M.start_autosave(window) end

---Stop autosave.
---
---@param window Window
function M.stop_autosave(window) end

---Toggle autosave.
---
---@param window Window
function M.toggle_autosave(window) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
