---@meta
---@diagnostic disable:unused-local

---@enum (key) BarWeztermOpts.Position
local positions = {
  bottom = 1,
  top = 1,
}

---@class BarWeztermOpts.Separator
---@field field_icon? string
---@field left_icon? string
---@field right_icon? string
---@field space? integer

---@class BarWeztermOpts.Tabs
---@field active_tab_bg? number|string
---@field active_tab_fg? number|string
---@field inactive_tab_bg? number|string
---@field inactive_tab_fg? number|string
---@field new_tab_bg? number|string
---@field new_tab_fg? number|string

---@class BarWeztermOpts.Module
---@field color? integer
---@field enabled? boolean
---@field icon? string

---@class BarWeztermOpts.Spotify: BarWeztermOpts.Module
---@field max_width? integer
---@field throttle? integer

---@class BarWeztermOpts.Clock: BarWeztermOpts.Module
---@field format? string

---@class BarWeztermOpts.Modules
---@field clock? BarWeztermOpts.Clock
---@field cwd? BarWeztermOpts.Module
---@field hostname? BarWeztermOpts.Module
---@field leader? BarWeztermOpts.Module
---@field pane? BarWeztermOpts.Module
---@field ssh? BarWeztermOpts.Module
---@field spotify? BarWeztermOpts.Spotify
---@field tabs? BarWeztermOpts.Tabs
---@field username? BarWeztermOpts.Module
---@field workspace? BarWeztermOpts.Module
---@field zoom? BarWeztermOpts.Module

---@class BarWeztermOpts.Padding.Tabs
---@field left? integer
---@field right? integer

---@class BarWeztermOpts.Padding: BarWeztermOpts.Padding.Tabs
---@field tabs? BarWeztermOpts.Padding.Tabs

---@class BarWeztermOpts
---@field max_width? integer
---@field modules? BarWeztermOpts.Modules
---@field padding? BarWeztermOpts.Padding
---@field position? BarWeztermOpts.Position
---@field separator? BarWeztermOpts.Separator

---@class BarWezterm
local M = {}

---@param c Config
---@param opts? BarWeztermOpts
function M.apply_to_config(c, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
