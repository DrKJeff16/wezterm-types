---@meta
---@diagnostic disable:unused-local

---@enum (key) HourStrings
local hours = {
  ["00"] = 1,
  ["01"] = 1,
  ["02"] = 1,
  ["03"] = 1,
  ["04"] = 1,
  ["05"] = 1,
  ["06"] = 1,
  ["07"] = 1,
  ["08"] = 1,
  ["09"] = 1,
  ["10"] = 1,
  ["11"] = 1,
  ["12"] = 1,
  ["13"] = 1,
  ["14"] = 1,
  ["15"] = 1,
  ["16"] = 1,
  ["17"] = 1,
  ["18"] = 1,
  ["19"] = 1,
  ["20"] = 1,
  ["21"] = 1,
  ["22"] = 1,
  ["23"] = 1,
}

---@enum (key) TablineWezWinComponent
local win_components = {
  battery = 1,
  cpu = 1,
  datetime = 1,
  domain = 1,
  hostname = 1,
  mode = 1,
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

---@alias TablineWezSectionPadding integer|{ left?: integer, right?: integer }

---@class TablineWezComponentSpec
---@field [1] string
---@field padding? TablineWezSectionPadding
---@field icons_enabled? boolean
---@field icons_only? boolean
---@field icon? nil|string|{ [1]: string, align?: 'left'|'right', color?: { fg?: string } }
---@field cond? nil|fun(): boolean
---@field fmt? (fun(str: string, win: Window|TabInformation): string)|nil

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

---@class TablineWezBatteryComponent: TablineWezComponentSpec
---@field [1] 'battery'
---@field battery_to_icon? BatteryToIcon

---@class TablineWezCPUComponent: TablineWezComponentSpec
---@field [1] 'cpu'
---How often in seconds the component updates, set to 0 to disable throttling
---
---@field throttle? integer
---If you want use `powershell`, set to `true`.
---
---Default is `false`.
---@field use_pwsh? boolean

---@class TablineWezCWDComponent: TablineWezComponentSpec
---@field [1] 'cwd'
---@field max_length? integer

---@class TablineWezDatetimeComponent: TablineWezComponentSpec
---@field [1] 'datetime'
---@field style? string
---@field hour_to_icon? nil|table<HourStrings, string>

---@class TablineWezDomainComponent: TablineWezComponentSpec
---@field [1] 'domain'
---@field domain_to_icon? DomainToIcon

---@class TablineWezHostnameComponent: TablineWezComponentSpec
---@field [1] 'hostname'

---@class TablineWezIndexComponent: TablineWezComponentSpec
---@field [1] 'index'
---@field zero_indexed? boolean

---@class TablineWezModeComponent: TablineWezComponentSpec
---@field [1] 'mode'

---@class TablineWezOutputComponent: TablineWezComponentSpec
---@field [1] 'output'
---@field icon_no_output? string

---@class TablineWezParentComponent: TablineWezCWDComponent
---@field [1] 'parent'

---@class TablineWezProcessComponent: TablineWezComponentSpec
---@field [1] 'process'
---@field process_to_icon? string|table<string, { [1]: string, color?: { fg?: string } }>

---@class TablineWezRAMComponent: TablineWezCPUComponent
---@field [1] 'ram'

---@class TablineWezWindowComponent: TablineWezComponentSpec
---@field [1] 'window'

---@class TablineWezWorkspaceComponent: TablineWezComponentSpec
---@field [1] 'workspace'

---@class TablineWezZoomedComponent: TablineWezComponentSpec
---@field [1] 'zoomed'

---@alias TablineWezWinComponents
---|TablineWezBatteryComponent
---|TablineWezCPUComponent
---|TablineWezDatetimeComponent
---|TablineWezDomainComponent
---|TablineWezHostnameComponent
---|TablineWezModeComponent
---|TablineWezRAMComponent
---|TablineWezWindowComponent
---|TablineWezWorkspaceComponent

---@alias TablineWezTabComponents
---|TablineWezCWDComponent
---|TablineWezIndexComponent
---|TablineWezOutputComponent
---|TablineWezParentComponent
---|TablineWezProcessComponent
---|TablineWezZoomedComponent

---@alias TablineWezWin (string|TablineWezWinComponent|TablineWezWinComponents)
---@alias TablineWezTab (string|TablineWezTabComponent|TablineWezTabComponents)

---@class TablineWezOpts.Sections
---@field tabline_a?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_b?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_c?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_x?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_y?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_z?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tab_active?   (TablineWezTab|FormatItemSpec|fun(): string)[]
---@field tab_inactive? (TablineWezTab|FormatItemSpec|fun(): string)[]

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
---@field fmt? (fun(str: string, win: Window|TabInformation): string)|nil
---@field theme? string|Colorschemes|Palette
---@field theme_overrides? TablineWezThemeOverrides
---@field tabs_enabled? boolean
---@field icons_enabled? boolean
---@field section_separators? TablineWezSeparators|''
---@field component_separators? TablineWezSeparators|''
---@field tab_separators? TablineWezSeparators|''

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

---@param theme string|Colorschemes|Palette
function M.set_theme(theme) end

---@param theme string|Colorschemes|Palette
---@param overrides TablineWezThemeOverrides
function M.set_theme(theme, overrides) end

---@param opts TablineWezOpts
function M.setup(opts) end

---@return TablineWezOpts config
function M.get_config() end

---@return TablineWezThemeOverrides theme
function M.get_theme() end

---@param config Config
function M.apply_to_config(config) end

---@param window Window
---@param tab TabInformation
function M.window(window, tab) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
