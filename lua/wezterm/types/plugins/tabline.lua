---@meta
---@diagnostic disable:unused-local

---@alias HourStrings
---|"00"
---|"01"
---|"02"
---|"03"
---|"04"
---|"05"
---|"06"
---|"07"
---|"08"
---|"09"
---|"10"
---|"11"
---|"12"
---|"13"
---|"14"
---|"15"
---|"16"
---|"17"
---|"18"
---|"19"
---|"20"
---|"21"
---|"22"
---|"23"

---@alias TablineWezWinComponent
---|"battery"
---|"cpu"
---|"datetime"
---|"domain"
---|"hostname"
---|"mode"
---|"ram"
---|"window"
---|"workspace"

---@alias TablineWezTabComponent
---|"cwd"
---|"index"
---|"output"
---|"parent"
---|"process"
---|"tab"
---|"zoomed"

---@alias TablineWezSectionPadding integer|{ left?: integer, right?: integer }
---@alias TablineWezSeparators { left?: string, right?: string }
---@alias TablineWezSectionOverrides { fg?: string, bg?: string }
---@alias TablineWezExtension "presentation"|"quick_domains"|"resurrect"|"smart_workspace_switcher"

---@class TablineWezComponentSpec
---@field [1] string
---@field cond? nil|fun(): boolean
---@field fmt? (fun(str: string, win: Window|TabInformation): string)|nil
---@field icon? nil|string|{ [1]: string, align?: 'left'|'right', color?: { fg?: string } }
---@field icons_enabled? boolean
---@field icons_only? boolean
---@field padding? TablineWezSectionPadding

---@class BatteryToIcon
---@field empty? string
---@field full? string
---@field half? string
---@field quarter? string
---@field three_quarters? string

---@class DomainToIcon
---@field default? string
---@field docker? string
---@field ssh? string
---@field unix? string
---@field wsl? string

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
---@field hour_to_icon? nil|table<HourStrings, string>
---@field style? string

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
---@field tab_active?   (TablineWezTab|FormatItemSpec|fun(): string)[]
---@field tab_inactive? (TablineWezTab|FormatItemSpec|fun(): string)[]
---@field tabline_a?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_b?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_c?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_x?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_y?    (TablineWezWin|FormatItemSpec|fun(): string)[]
---@field tabline_z?    (TablineWezWin|FormatItemSpec|fun(): string)[]

---@class TablineWezExtensionSpec.Events
---@field callback? fun(window: Window)
---@field delay? integer
---@field hide? string[]|string
---@field show? string[]|string

---@class TablineWezExtensionSpec
---@field [1] string
---@field colors? TablineWezThemeColors
---@field events TablineWezExtensionSpec.Events
---@field sections? TablineWezOpts.Sections

---@class TablineWezOpts.Options
---@field component_separators? TablineWezSeparators|''
---@field fmt? (fun(str: string, win: Window|TabInformation): string)|nil
---@field icons_enabled? boolean
---@field section_separators? TablineWezSeparators|''
---@field tab_separators? TablineWezSeparators|''
---@field tabs_enabled? boolean
---@field theme? string|Colorschemes|Palette
---@field theme_overrides? TablineWezThemeOverrides

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
---@field colors? Palette
---@field copy_mode? TablineWezThemeColors
---@field normal_mode? TablineWezThemeColors
---@field search_mode? TablineWezThemeColors
---@field tab? TablineWezTabOverrides
---@field window_mode? TablineWezThemeColors

---@class TablineWezOpts
---@field extensions? (TablineWezExtension|TablineWezExtensionSpec)[]
---@field options? TablineWezOpts.Options
---@field sections? TablineWezOpts.Sections

---@class TablineWez
local M = {}

---@param config Config
function M.apply_to_config(config) end

---@return TablineWezOpts config
function M.get_config() end

---@return TablineWezThemeOverrides theme
function M.get_theme() end

---@param theme string|Colorschemes|Palette
---@param overrides? TablineWezThemeOverrides
function M.set_theme(theme, overrides) end

---@param opts? TablineWezOpts
function M.setup(opts) end

---@param window Window The `Window` object.
---@param tab TabInformation
function M.window(window, tab) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
