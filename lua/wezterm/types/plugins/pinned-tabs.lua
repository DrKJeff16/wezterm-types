---@meta
---@diagnostic disable:unused-local

---@class PinnedTabsCreateOpts
---@field args? string[]
---@field cwd? string
---@field name? string
---@field program? string

---@class PinnedTabsKey: Key
---@field tab? PinnedTabsCreateOpts

---@class PinnedTabsOpts
---Instead of WezTerm startup, you can do the cleanup on config reload.
---
---@field create? boolean
---You don't want any debug logs (errors will still be logged).
---
---@field debug? boolean
---@field keys? PinnedTabsKey[]

---@class PinnedTabs
local M = {}

---@param config Config
---@param opts? PinnedTabsOpts
function M.apply_to_config(config, opts) end

---Clean up stale state files.
---
function M.cleanup() end

---Creates a pinned tab.
---
---Use this to configure the keybindings in your `wezterm.lua`.
---
---@param opts PinnedTabsCreateOpts
function M.create(opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
