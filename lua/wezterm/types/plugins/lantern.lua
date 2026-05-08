---@meta
---@diagnostic disable:unused-local

---@enum (key) Lantern.ResetBehavior
local reset_behaviors = { clear = 1, persist = 1 }

---@alias Lantern.FlameDir string|string[]

---@alias Lantern.GlowResult Lantern.Choice|Lantern.Choice[]|string|number

---@class Lantern.Choice
---@field id string
---@field label? string

---@class Lantern.BuildContext
---@field window Window
---@field pane Pane

---@class Lantern.Context
---@field window? Window
---@field pane? Pane
---@field choice Lantern.Choice
---@field wick? Lantern.Wick

---@class Lantern.Flame
---Return one choice, multiple choices, or a scalar value that Lantern can normalize.
---
---@field glow? fun(ctx?: Lantern.BuildContext): Lantern.GlowResult
---Apply a selected choice to the provided config table.
---
---@field ignite? fun(config: Config|table, ctx: Lantern.Context)
---Legacy alias for `glow`.
---
---@field get? fun(ctx?: Lantern.BuildContext): Lantern.GlowResult
---Legacy alias for `ignite`.
---
---@field pick? fun(config: Config|table, ctx: Lantern.Context)

---@class Lantern.GpuFlame: Lantern.Flame
---Choose the best detected GPU adapter.
---
---@field best fun(): GpuInfo|nil

---@class Lantern.InternalChoice
---@field flame Lantern.Flame
---@field module_path? string
---@field choice Lantern.Choice

---@alias Lantern.FormatChoices fun(choices: table<string, Lantern.InternalChoice>, ctx: Lantern.BuildContext): Lantern.Choice[]

---@alias Lantern.FormatDescription fun(desc: string, fuzzy: boolean, icons: Lantern.Icons): string

---@class Lantern.IconPair
---@field ico string
---@field punct string

---@class Lantern.Icons
---@field lantern string
---@field fuzzy Lantern.IconPair
---@field exact Lantern.IconPair

---@class Lantern.LogConfig
---@field enabled boolean

---@class Lantern.LogOpts
---@field enabled? boolean

---@class Lantern.PersistenceConfig
---@field enabled boolean
---@field path? string
---@field legacy_path? string
---@field reset_behavior Lantern.ResetBehavior

---@class Lantern.PersistenceOpts
---@field enabled? boolean
---@field path? string
---@field legacy_path? string
---@field reset_behavior? Lantern.ResetBehavior

---@class Lantern.ColorConfig
---@field opacity number

---@class Lantern.ColorOpts
---@field opacity? number

---@class Lantern.DefaultFontConfig
---@field font? TextStyle
---@field font_rules? FontRules[]
---@field font_size? number
---@field line_height? number

---@class Lantern.DefaultConfig
---@field title string
---@field sort_by string
---@field fuzzy boolean
---@field description string
---@field fuzzy_description string
---@field alphabet string
---@field icons Lantern.Icons
---@field comp fun(sort_by: string): fun(a: Lantern.Choice, b: Lantern.Choice): boolean
---@field format_choices Lantern.FormatChoices
---@field format_description Lantern.FormatDescription

---@class Lantern.DefaultOpts
---@field title? string
---@field sort_by? string
---@field fuzzy? boolean
---@field description? string
---@field fuzzy_description? string
---@field alphabet? string
---@field icons? Lantern.Icons
---@field comp? fun(sort_by: string): fun(a: Lantern.Choice, b: Lantern.Choice): boolean
---@field format_choices? Lantern.FormatChoices
---@field format_description? Lantern.FormatDescription

---@class Lantern.Config
---@field log Lantern.LogConfig
---@field persistence Lantern.PersistenceConfig
---@field defaults Lantern.DefaultConfig
---@field default_font Lantern.DefaultFontConfig
---@field color Lantern.ColorConfig

---@class Lantern.SetupOpts
---@field log? Lantern.LogOpts
---@field persistence? Lantern.PersistenceOpts
---@field defaults? Lantern.DefaultOpts
---@field default_font? Lantern.DefaultFontConfig
---@field color? Lantern.ColorOpts

---@class Lantern.WickSpec
---@field name? string
---@field title? string
---@field flames? (string|Lantern.Flame)[]
---@field flame_dirs? Lantern.FlameDir[]
---@field sort_by? string
---@field fuzzy? boolean
---@field alphabet? string
---@field description? string
---@field fuzzy_description? string
---@field persist? boolean
---@field comp? fun(a: Lantern.Choice, b: Lantern.Choice): boolean
---@field format_choices? Lantern.FormatChoices
---@field format_description? Lantern.FormatDescription

---@class Lantern.Wick
---@field title string
---@field sort_by string
---@field fuzzy boolean
---@field alphabet string
---@field description string
---@field fuzzy_description string
---@field persist boolean
local W = {}

---Register an inline flame or flame module path on this wick.
---
---@param flame_spec string|Lantern.Flame
function W:register(flame_spec) end

---Apply one selected choice to a config override table.
---
---@param config Config|table
---@param ctx Lantern.Context
function W:select(config, ctx) end

---Return a WezTerm action that opens this wick.
---
---@return Action action
function W:light() end

---@class Lantern.LightApi
---@operator call(string): Action
local L = {}

---Open any registered wick.
---
---@param name string
---@return Action action
function L:__call(name) end

---Open the built-in colorscheme wick.
---
---@return Action action
function L.colorscheme() end

---Open the built-in font wick.
---
---@return Action action
function L.font() end

---Open the built-in font-size wick.
---
---@return Action action
function L.font_size() end

---Open the built-in line-height wick.
---
---@return Action action
function L.font_leading() end

---Open the built-in GPU adapter wick.
---
---@return Action action
function L.gpu() end

---Open the built-in window-opacity wick.
---
---@return Action action
function L.window_opacity() end

---Open the built-in window-padding wick.
---
---@return Action action
function L.window_padding() end

---Open the built-in cursor-style wick.
---
---@return Action action
function L.cursor_style() end

---Open the built-in inactive-pane-opacity wick.
---
---@return Action action
function L.inactive_pane_opacity() end

---Open the built-in font-ligatures wick.
---
---@return Action action
function L.font_ligatures() end

---Open the built-in tab-bar-style wick.
---
---@return Action action
function L.tab_bar_style() end

---@class Lantern.FlamesApi
local F = {}

---Return cached flame module paths from one directory.
---
---Pass a string for an absolute/custom directory, or path segments for a
---built-in Lantern flame directory under `plugin/lantern/flames`.
---
---@param dir Lantern.FlameDir
---@return string[] modules
function F.from_dir(dir) end

---Return cached flame module paths from multiple directories.
---
---@param dirs Lantern.FlameDir[]
---@return string[] modules
function F.from_dirs(dirs) end

---@class Lantern.ColorApi
local C = {}

---Set tab button style in a config table from a Lantern colorscheme.
---
---@param config Config|table
---@param scheme Palette
function C.set_tab_button(config, scheme) end

---Apply a colorscheme to a WezTerm config override table.
---
---@param config Config|table
---@param scheme Palette
---@param name string
function C.apply_scheme(config, scheme, name) end

---Return a built-in Lantern colorscheme table by name.
---
---@param name string
---@return Palette|nil scheme
function C.scheme(name) end

---@class Lantern.StateEntry
---@field id string
---@field label? string
---@field module? string
---@field wick? string

---@class Lantern.StateApi
local S = {}

---Persist current state to disk.
function S.flush() end

---Save one wick selection.
---
---@param wick_name string
---@param entry Lantern.StateEntry
function S.save(wick_name, entry) end

---Return one saved wick selection.
---
---@param wick_name string
---@return Lantern.StateEntry|nil entry
function S.get(wick_name) end

---Clear all saved state, or one wick when `wick_name` is passed.
---
---@param wick_name? string
function S.clear(wick_name) end

---Return all saved Lantern state.
---
---@return table<string, Lantern.StateEntry> state
function S.all() end

---Return the active state file path.
---
---@return string path
function S.path() end

---Return the legacy picker state file path used for migration.
---
---@return string path
function S.legacy_path() end

---@class Lantern.ConfigApi
local Cfg = {}

---Merge user configuration into Lantern defaults.
---
---@param opts? Lantern.SetupOpts
---@return Lantern.Config config
function Cfg.setup(opts) end

---Return the active Lantern configuration.
---
---@return Lantern.Config config
function Cfg.get() end

---Return a copy of the default Lantern configuration.
---
---@return Lantern.Config config
function Cfg.defaults() end

---@class Lantern
---Built-in and custom wick action helpers.
---
---@field light Lantern.LightApi
---Helpers for discovering flame modules.
---
---@field flames Lantern.FlamesApi
---Configuration helpers.
---
---@field config Lantern.ConfigApi
---Colorscheme helpers.
---
---@field color Lantern.ColorApi
---Persistence helpers.
---
---@field state Lantern.StateApi
local M = {}

---Configure Lantern.
---
---@param opts? Lantern.SetupOpts
---@return Lantern.Config config
function M.setup(opts) end

---Register a user-defined wick.
---
---@param name string
---@param spec Lantern.WickSpec|Lantern.Wick
---@return Lantern.Wick wick
function M.add_wick(name, spec) end

---Return a registered wick by name.
---
---@param name string
---@return Lantern.Wick|nil wick
function M.wick(name) end

---Restore persisted Lantern selections into a config table.
---
---@param config? Config|table
---@return Config|table config
function M.rekindle(config) end

---Return the built-in GPU flame module.
---
---@return Lantern.GpuFlame flame
function M.gpu() end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
