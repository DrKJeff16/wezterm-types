---@meta
---@diagnostic disable:unused-local

---@enum (key) TablineWezWinComponent
local win_components = {
  battery = 1,
  cpu = 1,
  datetime = 1,
  domain = 1,
  hostname = 1,
  mode = 1,
  parent = 1,
  ram = 1,
  window = 1,
  workspace = 1,
}

---@enum (key) TablineWezTabComponent
local tab_components = {
  cwd = 1,
  index = 1,
  output = 1,
  parent = 1,
  process = 1,
  tab = 1,
  zoomed = 1,
}

---@alias TablineWezComponent TablineWezWinComponent|TablineWezTabComponent|string
---@alias TablineWezSectionPadding integer|{ left?: integer, right?: integer }

---@alias TablineWezSection { [1]: TablineWezComponent, padding?: TablineWezSectionPadding }

---@alias TablineWezSeparators { left?: string, right?: string }

---@class TablineWezOpts.Options
---@field theme? string|Colorschemes
---@field theme_overrides? TablineWezThemeOverrides
---@field tabs_enabled? boolean
---@field section_separators? TablineWezSeparators|''
---@field component_separators? TablineWezSeparators|''
---@field tab_separators? TablineWezSeparators|''

---@class TablineWezOpts.Sections
---@field tabline_a? (TablineWezComponent|TablineWezSection|fun(): string)[]
---@field tabline_b? (TablineWezComponent|TablineWezSection|fun(): string)[]
---@field tabline_c? (TablineWezComponent|TablineWezSection|fun(): string)[]
---@field tabline_x? (TablineWezComponent|TablineWezSection|fun(): string)[]
---@field tabline_y? (TablineWezComponent|TablineWezSection|fun(): string)[]
---@field tabline_z? (TablineWezComponent|TablineWezSection|fun(): string)[]
---@field tab_active? (TablineWezComponent|TablineWezSection|fun(): string)[]
---@field tab_inactive? (TablineWezComponent|TablineWezSection|fun(): string)[]

---@alias TablineWezSectionOverrides { fg?: string, bg?: string }

---@class TablineWezThemeSections
---@field a? TablineWezSectionOverrides
---@field b? TablineWezSectionOverrides
---@field c? TablineWezSectionOverrides
---@field x? TablineWezSectionOverrides
---@field y? TablineWezSectionOverrides
---@field z? TablineWezSectionOverrides

---@class TablineWezTabOverrides
---@field active? TablineWezSectionOverrides
---@field inactive? TablineWezSectionOverrides
---@field inactive_hover? TablineWezSectionOverrides

---@class TablineWezThemeOverrides
---@field normal_mode? TablineWezThemeSections
---@field copy_mode? TablineWezThemeSections
---@field search_mode? TablineWezThemeSections
---@field window_mode? TablineWezThemeSections
---@field tab? TablineWezTabOverrides
---@field colors? Palette

---@class TablineWezOpts
---@field options? TablineWezOpts.Options
---@field sections? TablineWezOpts.Sections
---TODO: Annotate extensions:
---
---https://github.com/michaelbrusegard/tabline.wez#extensions
---@field extensions? table

---@class TablineWez
local M = {}

function M.setup() end

---@param theme Colorschemes
function M.set_theme(theme) end

---@param theme Colorschemes
---@param overrides TablineWezThemeOverrides
function M.set_theme(theme, overrides) end

---@param opts TablineWezOpts
function M.setup(opts) end

---@return TablineWezOpts config
function M.get_config() end

---@return TablineWezThemeOverrides theme
function M.get_theme() end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
