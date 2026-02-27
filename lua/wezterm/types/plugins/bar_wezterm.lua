---@meta
---@diagnostic disable:unused-local

---@enum (key) BarWeztermOpts.Position
local positions = {
  bottom = 1,
  top = 1,
}

---@class BarWeztermOpts.Separator
---@field space? integer
---@field left_icon? string
---@field right_icon? string
---@field field_icon? string

---@class BarWeztermOpts.Tabs
---@field active_tab_fg? integer
---@field inactive_tab_fg? integer

---@class BarWeztermOpts.Module
---@field enabled? boolean
---@field icon? string
---@field color? integer

---@class BarWeztermOpts.Spotify: BarWeztermOpts.Module
---@field max_width? integer
---@field throttle? integer

---@class BarWeztermOpts.Clock: BarWeztermOpts.Module
---@field format? string

---@class BarWeztermOpts.Modules
---@field tabs? BarWeztermOpts.Tabs
---@field workspace? BarWeztermOpts.Module
---@field leader? BarWeztermOpts.Module
---@field pane? BarWeztermOpts.Module
---@field username? BarWeztermOpts.Module
---@field hostname? BarWeztermOpts.Module
---@field clock? BarWeztermOpts.Clock
---@field cwd? BarWeztermOpts.Module
---@field spotify? BarWeztermOpts.Spotify

---@class BarWeztermOpts.Padding.Tabs
---@field left? integer
---@field right? integer

---@class BarWeztermOpts.Padding: BarWeztermOpts.Padding.Tabs
---@field tabs? BarWeztermOpts.Padding.Tabs

---@class BarWeztermOpts
---@field position? BarWeztermOpts.Position
---@field max_width? integer
---@field separator? BarWeztermOpts.Separator
---@field modules? BarWeztermOpts.Modules
---@field padding? BarWeztermOpts.Padding

---@class BarWezterm
local M = {}

---@param c Config
---@param opts? BarWeztermOpts
function M.apply_to_config(c, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
