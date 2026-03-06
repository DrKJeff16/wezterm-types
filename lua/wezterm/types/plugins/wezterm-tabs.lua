---@meta
---@diagnostic disable:unused-local

---@enum (key) ZoomIndicatorType
local zoom_indicators = {
  icon = 1,
  number = 1,
}

---@class WeztermTabs.TabConfig
---Whether to hide the tab bar when only one tab exists.
---
---@field hide_tab_bar_if_only_one_tab? boolean
---Whether to place the tab bar at the bottom of the window.
---
---@field tab_bar_at_bottom? boolean
---Maximum width of a tab in characters.
---
---@field tab_max_width? integer
---Whether to unzoom when switching between panes.
---
---@field unzoom_on_switch_pane? boolean

---@class WeztermTabs.ZoomIndicatorConfig
---Whether to show zoom indicators.
---
---@field enabled? boolean
---Type of zoom indicator to display.
---
---@field type? ZoomIndicatorType

---@class WeztermTabs.TabUIConfig
---Configuration for the zoom indicator.
---
---@field zoom_indicator? WeztermTabs.ZoomIndicatorConfig

---@class WeztermTabs.SeparatorConfig
---Unicode character for solid left arrow.
---
---@field arrow_solid_left? string
---Unicode character for solid right arrow.
---
---@field arrow_solid_right? string
---Unicode character for thin left arrow.
---
---@field arrow_thin_left? string
---Unicode character for thin right arrow.
---
---@field arrow_thin_right? string

---@class WeztermTabs.UIConfig
---Process-specific icons for tabs.
---
---@field icons? table<string, string>
---Visual separators used in the tab bar.
---
---@field separators? WeztermTabs.SeparatorConfig
---Tab-specific UI configuration.
---
---@field tab? WeztermTabs.TabUIConfig

---@class WeztermTabsOpts
---Configuration for tab bar behavior.
---
---@field tabs? WeztermTabs.TabConfig
---Configuration for visual elements.
---
---@field ui? WeztermTabs.UIConfig

---@class WeztermTabs
local M = {}

---Applies configuration to WezTerm.
---
---@param wezterm_config Config The WezTerm configuration table to modify.
---@param opts? WeztermTabsOpts Optional configuration overrides.
function M.apply_to_config(wezterm_config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
