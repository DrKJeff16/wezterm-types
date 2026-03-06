---@meta
---@diagnostic disable:unused-local

---@class QuickDomainsOpts.Icons
---@field bash? string
---@field docker? string
---@field exec? string
---@field fish? string
---@field hosts? string
---@field kubernetes? string
---@field powershell? string
---@field pwsh? string
---@field ssh? string
---@field tls? string
---@field unix? string
---@field windows? string
---@field wsl? string
---@field zsh? string

---@class QuickDomainsKey
---@field key string
---@field mods string
---@field tbl string

---@class QuickDomainsOpts.Keys
---Open domain in new tab.
---
---@field attach? QuickDomainsKey
---Open domain in horizontally split pane.
---
---@field hsplit? QuickDomainsKey
---Open domain in vertically split pane.
---
---@field vsplit? QuickDomainsKey

---@class QuickDomainsOpts.Auto
---Disable exec domain auto configs.
---
---@field exec_ignore? { ssh?: boolean, docker?: boolean, kubernetes?: boolean }
---Disable SSH multiplex auto config.
---
---@field ssh_ignore? boolean

---@class QuickDomainsOpts
---Auto-configuration.
---
---@field auto? QuickDomainsOpts.Auto
---@field docker_shell? string
---Swap in and out icons for specific domains.
---
---@field icons? QuickDomainsOpts.Icons
---@field keys? QuickDomainsOpts.Keys
---@field kubernetes_shell? string

---@class QuickDomains
local M = {}

---@param config Config
---@param user_settings? QuickDomainsOpts
function M.apply_to_config(config, user_settings) end

---@param icon string
---@param name string
---@return string str
function M.formatter(icon, name) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
