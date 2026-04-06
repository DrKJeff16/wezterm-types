---@meta
---@diagnostic disable:unused-local

---@enum (key) UserListFormat
local format = {
  json = 1,
  text = 1,
}

---@class PassRelay.UserListSpec
---@field format? UserListFormat
---@field command? string
---@field id_path? string
---@field label_path? string

---@class PassRelayOpts.Hotkey: SendKeyParams
---@field key string
---@field mods string

---@class PassRelayOpts
---@field debug? 1|nil
---@field get_password string|fun(user: string): password: string
---@field get_userlist? string|fun(): user_list: string[]
---@field hotkey? PassRelayOpts.Hotkey
---@field toast_time? integer

---@class PassRelay
local M = {}

---@param window Window
---@param pane Pane
---@param module_settings PassRelayOpts
function M.exec_password_manager(window, pane, module_settings) end

---@param config Config
---@param module_settings PassRelayOpts
function M.apply_to_config(config, module_settings) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
