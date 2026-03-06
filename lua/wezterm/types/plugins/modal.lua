---@meta
---@diagnostic disable:unused-local

---@class ModalWeztermSeparator
---@field text string
---@field bg string
---@field fg string

---@class ModalWeztermMode
---@field key_table_name string
---@field name string
---@field status_text string

---@class ModalWezterm
---@field key_tables Key[]
---@field modes table<string, ModalWeztermMode>
local M = {}

---Activates mode.
---
---@param name string
---@param activate_key_table_params? ActivateKeyTableParams
---@return Action key_assignment
function M.activate_mode(name, activate_key_table_params) end

---@param name string
---@param key_table Key[]
---@param key_table_name? string
---@param status_text? string
function M.add_mode(name, key_table, status_text, key_table_name) end

---@param config Config
function M.apply_to_config(config) end

---Wrapper for creating a simple status text.
---
---@param left_seperator ModalWeztermSeparator
---@param key_hints ModalWeztermSeparator
---@param mode ModalWeztermSeparator
---@return string status_text
function M.create_status_text(left_seperator, key_hints, mode) end

---@param url string
function M.enable_defaults(url) end

---Exits all active modes.
---
---@param name string
---@return Action key_assignment
function M.exit_all_modes(name) end

---Exits active mode.
---
---@param name string
---@return Action key_assignment
function M.exit_mode(name) end

---@param window Window The `Window` object.
function M.get_mode(window) end

---Resets the window title to the foreground process by emitting a OSC 2 escape sequence.
---
---@param pane Pane The `Pane` object.
function M.reset_window_title(pane) end

---@param config Config
function M.set_default_keys(config) end

---Sets the current modal status to the right status.
---
---@param window Window The `Window` object.
function M.set_right_status(window) end

---Sets the window title by emitting a OSC 2 escape sequence.
---
---@param pane Pane The `Pane` object.
---@param name? string
function M.set_window_title(pane, name) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
