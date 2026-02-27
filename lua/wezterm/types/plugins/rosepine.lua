---@meta
---@diagnostic disable:unused-local

---@class RosePineWindowFrame
---@field active_titlebar_bg string
---@field inactive_titlebar_bg string

---@class RosePinePalette
---@field foreground string
---@field background string
---@field cursor_bg string
---@field cursor_border string
---@field cursor_fg string
---@field selection_bg string
---@field selection_fg string
---@field ansi table<integer, PaletteAnsi>
---@field brights table<string, PaletteBrights>
---@field tab_bar TabBar

---@class RosePine.Main
local M = {}

---@return Palette palette
function M.colors() end

---@return RosePineWindowFrame window_frame
function M.window_frame() end

---@class RosePine.Moon
local L = {}

---@return Palette palette
function L.colors() end

---@return RosePineWindowFrame window_frame
function L.window_frame() end

---@class RosePine.Dawn
local D = {}

---@return Palette palette
function D.colors() end

---@return RosePineWindowFrame window_frame
function D.window_frame() end

---@class RosePine
---@field main RosePine.Main
---@field moon RosePine.Moon
---@field dawn RosePine.Dawn

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
