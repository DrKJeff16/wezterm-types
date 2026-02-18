---@meta
---@diagnostic disable:unused-local

---@class PinnedTabsOpts
---@field name? string
---@field program? string
---@field cwd? string
---@field args? string[]

---@class PinnedTabs
local M = {}

---@param config Config
---@param opts? PinnedTabsOpts
function M.apply_to_config(config, opts) end

---Creates a pinned tab.
---
---Use this to configure the keybindings in your `wezterm.lua`.
---
---@param opts PinnedTabsOpts
function M.create(opts) end

---Clean up stale state files.
---
function M.cleanup() end
-- vim: set ts=2 sts=2 sw=2 et ai si sta:
