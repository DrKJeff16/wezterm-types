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

---@class TablineWezSection
---@field [1] string
---@field padding? TablineWezSectionPadding

---@alias TablineWezSeparators { left?: string, right?: string }

---@enum (key) TablineWezExtension
local extensions = {
  presentation = 1,
  quick_domains = 1,
  resurrect = 1,
  smart_workspace_switcher = 1,
}

---@class BatteryToIcon
---@field empty? string
---@field quarter? string
---@field half? string
---@field three_quarters? string
---@field full? string

---@class DomainToIcon
---@field default? string
---@field ssh? string
---@field wsl? string
---@field docker? string
---@field unix? string

---@class TablineWezCPUComponent: TablineWezSection
---@field [1] 'cpu'
---How often in seconds the component updates, set to 0 to disable throttling
---
---@field throttle? integer
---If you want use `powershell`, set to `true`.
---
---Default is `false`.
---@field use_pwsh? boolean

---@class TablineWezRAMComponent: TablineWezCPUComponent
---@field [1] 'ram'

---@class TablineWezBatteryComponent: TablineWezSection
---@field [1] 'battery'
---@field battery_to_icon? BatteryToIcon

---@class TablineWezDomainComponent: TablineWezSection
---@field [1] 'domain'
---@field domain_to_icon? DomainToIcon

---@class TablineWezProcessComponent: TablineWezSection
---@field [1] 'process'
---@field process_to_icon? string|table<string, { [1]: string, color?: { fg?: string } }>

---@class TablineWezExtensionSpec.Events
---@field show? string[]|string
---@field hide? string[]|string
---@field delay? integer
---@field callback? fun(window: Window)

---@class TablineWezExtensionSpec
---@field [1] string
---@field events TablineWezExtensionSpec.Events
---@field sections? TablineWezOpts.Sections
---@field colors? TablineWezThemeColors

---@class TablineWezOpts.Options
---@field theme? string|Colorschemes
---@field theme_overrides? TablineWezThemeOverrides
---@field tabs_enabled? boolean
---@field section_separators? TablineWezSeparators|''
---@field component_separators? TablineWezSeparators|''
---@field tab_separators? TablineWezSeparators|''

---@alias TablineWezComponents
---|TablineWezSection
---|TablineWezBatteryComponent
---|TablineWezCPUComponent
---|TablineWezDomainComponent
---|TablineWezProcessComponent
---|TablineWezRAMComponent

---@class TablineWezOpts.Sections
---@field tabline_a? (TablineWezComponent|TablineWezComponents|fun(): string)[]
---@field tabline_b? (TablineWezComponent|TablineWezComponents|fun(): string)[]
---@field tabline_c? (TablineWezComponent|TablineWezComponents|fun(): string)[]
---@field tabline_x? (TablineWezComponent|TablineWezComponents|fun(): string)[]
---@field tabline_y? (TablineWezComponent|TablineWezComponents|fun(): string)[]
---@field tabline_z? (TablineWezComponent|TablineWezComponents|fun(): string)[]
---@field tab_active? (TablineWezComponent|TablineWezComponents|TablineWezSection|fun(): string)[]
---@field tab_inactive? (TablineWezComponent|TablineWezComponents|TablineWezSection|fun(): string)[]

---@alias TablineWezSectionOverrides { fg?: string, bg?: string }

---@class TablineWezThemeColors
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
---@field normal_mode? TablineWezThemeColors
---@field copy_mode? TablineWezThemeColors
---@field search_mode? TablineWezThemeColors
---@field window_mode? TablineWezThemeColors
---@field tab? TablineWezTabOverrides
---@field colors? Palette

---@class TablineWezOpts
---@field options? TablineWezOpts.Options
---@field sections? TablineWezOpts.Sections
---@field extensions? (TablineWezExtension|TablineWezExtensionSpec)[]

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
