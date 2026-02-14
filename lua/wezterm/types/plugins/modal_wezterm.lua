---@meta
---@diagnostic disable:unused-local

---@alias ModalWeztermSeparator { text: string, bg: string, fg: string }

---@class ModalWezterm
---@field modes table<string, { name: string, key_table_name: string, status_text: string }>
---@field key_tables Key[]
local M = {}

---@param window Window
function M.get_mode(window) end

---@param name string
---@param key_table Key[]
---@param key_table_name? string
---@param status_text? string
function M.add_mode(name, key_table, status_text, key_table_name) end

---Wrapper for creating a simple status text.
---
---@param left_seperator ModalWeztermSeparator
---@param key_hints ModalWeztermSeparator
---@param mode ModalWeztermSeparator
---@return string status_text
function M.create_status_text(left_seperator, key_hints, mode) end

---@param url string
function M.enable_defaults(url) end

---Sets the current modal status to the right status.
---
---@param window Window
function M.set_right_status(window) end

---Sets the window title by emitting a OSC 2 escape sequence.
---@param pane Pane
---@param name? string
function M.set_window_title(pane, name) end

---Resets the window title to the foreground process by emitting a OSC 2 escape sequence.
---
---@param pane Pane
function M.reset_window_title(pane) end

---Activates mode.
---
---@param name string
---@param activate_key_table_params? ActivateKeyTableParams
---@return KeyAssignment|KeyAssignFunction|ActivateKeyTable
function M.activate_mode(name, activate_key_table_params) end

---Exits active mode.
---
---@param name string
---@return KeyAssignment|KeyAssignFunction
function M.exit_mode(name) end

---Exits all active modes
---@param name string
---@return KeyAssignment|KeyAssignFunction
function M.exit_all_modes(name) end

---@param config Config
function M.apply_to_config(config) end

---@param config Config
function M.set_default_keys(config) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
