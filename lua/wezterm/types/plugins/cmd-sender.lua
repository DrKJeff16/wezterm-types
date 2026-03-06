---@meta
---@diagnostic disable:unused-local

---@class CmdSenderOpts
---@field description? string
---@field key? string
---@field mods? string

---@class CmdSender
local M = {}

---@param config Config
---@param opts? CmdSenderOpts
function M.apply_to_config(config, opts) end

---Send command to panes.
---
---@param cmd string
---@param panes Pane[]
function M.send_cmd_to_panes(cmd, panes) end

---Send command to tab's panes.
---
---@param cmd string
---@param tab MuxTab
function M.send_cmd_to_tab_panes(cmd, tab) end

---@return { EmitEvent: string } action
function M.send_cmd_to_tab_panes_action() end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
