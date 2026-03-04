---@meta
---@diagnostic disable:unused-local

---@class Replay.Extractors.Spec
---@field label string
---@field prefix? string
---@field postfix? string
local E = {}

---@param s string
---@return string[] matches
function E.extractor(s) end

---@class ReplayOpts
---@field replay_key? string
---@field recall_key? string
---@field skip_keybinds? boolean
---@field extractors? Replay.Extractors.Spec[]

---@class Replay
local M = {}

---@param config Config
---@param opts? ReplayOpts
function M.apply_to_config(config, opts) end

---@return { EmitEvent: string } action_callback
function M.recall() end

---@return { EmitEvent: string } action_callback
function M.replay() end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
