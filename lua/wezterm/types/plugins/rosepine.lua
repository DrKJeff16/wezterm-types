---@meta
---@diagnostic disable:unused-local

---@class RosePineWindowFrame
---@field active_titlebar_bg string
---@field inactive_titlebar_bg string

---@class RosePinePalette
---@field ansi table<integer, PaletteAnsi>
---@field background string
---@field brights table<string, PaletteBrights>
---@field cursor_bg string
---@field cursor_border string
---@field cursor_fg string
---@field foreground string
---@field selection_bg string
---@field selection_fg string
---@field tab_bar TabBar

---@class RosePine.Variant
local V = {}

---@return Palette palette
function V.colors() end

---@return RosePineWindowFrame window_frame
function V.window_frame() end

---@class RosePine
---@field dawn RosePine.Variant
---@field main RosePine.Variant
---@field moon RosePine.Variant

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
