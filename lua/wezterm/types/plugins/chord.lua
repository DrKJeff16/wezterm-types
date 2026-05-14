---@meta
---@diagnostic disable:unused-local

---@enum (key) Chord.CommandSource
local source = {
  default = 1,
  key_table = 1,
  keys = 1,
  registered = 1,
}

---@class Chord.KeyEntry: Key
---WezTerm action assigned to the key.
---
---@field action Action
---Optional command-palette or hint-bar description.
---
---@field desc? string

---@class Chord.VimMapping
---Vim-style left-hand side, such as `<C-Space>`.
---
---@field [1]? string
---WezTerm action.
---
---@field [2]? Action
---Optional description.
---
---@field [3]? string
---WezTerm action.
---
---@field action? Action
---Optional description.
---
---@field desc? string
---Vim-style left-hand side.
---
---@field lhs? string
---WezTerm action.
---
---@field rhs? Action

---@class Chord.OverrideSpec
---Mappings to append.
---
---@field add? Chord.VimMapping[]
---Mappings to remove.
---
---@field disable? (string|Chord.KeyEntry|Chord.VimMapping)[]
---Disable a mapping group when set to `false`.
---
---@field enabled? boolean
---Mappings to replace by Vim-style lhs.
---
---@field override? table<string, any>

---@class Chord.Overrides
---@field enabled? { key_tables?: boolean, keys?: boolean }
---@field key_tables? table<string, Chord.OverrideSpec>
---@field keys? Chord.OverrideSpec

---@class Chord.KeyMeta
---Background color for the key table.
---
---@field bg string
---Short icon or label for the key table.
---
---@field i string
---Runtime key-table name.
---
---@field name? string
---Optional display padding.
---
---@field pad? integer
---Display text for the key table.
---
---@field txt string

---@class Chord.KeyTableDef
---Key definitions in Vim-style notation.
---
---@field keys? Chord.VimMapping[]
---Key-table metadata used by hints and mode displays.
---
---@field meta? Chord.KeyMeta

---@class Chord.HintsConfig
---Prefix for per-pane hint page cache keys.
---
---@field page_cache_prefix? string
---Separator between hint entries.
---
---@field separator? string

---@class Chord.CommandConfig
---InputSelector shortcut alphabet.
---
---@field alphabet? string
---Dedupe entries by binding identity.
---
---@field dedupe? boolean
---Description for the injected command picker binding.
---
---@field desc? string
---`InputSelector` description.
---
---@field description? string
---Whether InputSelector fuzzy matching is enabled.
---
---@field fuzzy? boolean
---InputSelector fuzzy description.
---
---@field fuzzy_description? string
---Include `wezterm.gui.default_keys()` entries.
---
---@field include_defaults? boolean
---Include `config.key_tables` entries.
---
---@field include_key_tables? boolean
---Include top-level `config.keys` entries.
---
---@field include_keys? boolean
---Include commands registered through `chord.command.register()`.
---
---See:
--- - [`chord.command.register()`](lua://Chord.CommandApi.register)
---
---@field include_registered? boolean
---Include entries without `desc` or `label`.
---
---@field include_undocumented? boolean
---Key binding that opens the command picker.
---
---@field key? string
---`InputSelector` title.
---
---@field title? string

---@class Chord.LogConfig
---@field enabled? boolean
---@field threshold? string|integer

---@class Chord.Config
---Vim-style key aliases mapped to WezTerm key names.
---
---@field aliases? table<string, string>
---@field command? Chord.CommandConfig
---@field hints? Chord.HintsConfig
---Leader token used in Vim-style key notation.
---
---@field leader string
---@field log? Chord.LogConfig
---Vim-style modifier aliases mapped to WezTerm modifiers.
---
---@field modifiers? table<string, string>

---@class Chord.Command
---WezTerm action executed when the command is selected.
---
---@field action Action
---Normalized binding identity used for deduplication.
---
---@field binding_id? string
---Stable command identifier.
---
---@field id string
---User-facing command label.
---
---@field label string
---Vim-style key label, when the command is key-backed.
---
---@field lhs? string
---Source collection where the command came from.
---
---@field source Chord.CommandSource
---Key table name for `key_table` commands.
---
---@field table_name? string

---@class Chord.CommandSpec
---Vim-style left-hand side.
---
---@field [1]? string
---WezTerm action.
---
---@field [2]? Action
---Optional command label.
---
---@field [3]? string
---WezTerm action.
---
---@field action? Action
---User-facing command label.
---
---@field desc? string
---Stable command identifier.
---
---@field id? string
---Native WezTerm key name.
---
---@field key? string
---User-facing command label.
---
---@field label? string
---Vim-style left-hand side.
---
---@field lhs? string
---Native WezTerm modifier string.
---
---@field mods? string
---WezTerm action.
---
---@field rhs? Action

---@class Chord.CommandApi
local C = {}

---Return a WezTerm action that opens the command picker.
---
---@param config_table Config WezTerm config table.
---@param opts? Chord.CommandConfig Command options merged over `Chord.CommandConfig`.
---@return Action action
function C.action(config_table, opts) end

---Inject a trigger binding that opens the command picker.
---
---@param config_table Config WezTerm config table.
---@param opts? Chord.CommandConfig Command options merged over `Chord.CommandConfig`.
---@return Action action
function C.apply(config_table, opts) end

---Clear commands registered through `chord.command.register()`.
---
---See:
--- - [`chord.command.register()`](lua://Chord.CommandApi.register)
---
function C.clear() end

---Collect commands from registered entries, config keys, key tables, and defaults.
---
---@param config_table Config WezTerm config table.
---@param opts? Chord.CommandConfig Command options merged over `Chord.CommandConfig`.
---@return Chord.Command[] commands
function C.collect(config_table, opts) end

---Register an action-only command or a key-backed command.
---
---@param spec Chord.CommandSpec
---@return Chord.Command|nil command
function C.register(spec) end

---Register many commands.
---
---@param specs Chord.CommandSpec[]
function C.register_many(specs) end

---@class Chord
---@field aliases table<string, string>
---@field command Chord.CommandApi
---@field modifiers table<string, string>
local M = {}

---Apply user overrides to already-built keys and key tables.
---
---@param config_table Config WezTerm config table.
---@param overrides Chord.Overrides
function M.apply_overrides(config_table, overrides) end

---Return the active Chord configuration.
---
---@return Chord.Config config
function M.config() end

---Return registered key-table metadata for mode displays.
---
---@param theme table Theme or color table passed to key-table definition functions.
---@return table<string, Chord.KeyMeta> modes
function M.get_modes(theme) end

---Render a plain-text key-hint bar for the active key table.
---
---@param config_table Config WezTerm config table.
---@param name? string Key-table name. `nil` uses top-level keys.
---@param width_cols integer Available terminal columns.
---@param window Window WezTerm window.
---@return string hint
function M.hint(config_table, name, width_cols, window) end

---Return an action callback that changes the visible hint page.
---
---@param name? string Key-table name.
---@param direction integer Page delta.
---@return Action action
function M.hint_action(name, direction) end

---Render a Ribbon key-hint bar for the active key table.
---
---@param config_table Config WezTerm config table.
---@param name? string Key-table name. `nil` uses top-level keys.
---@param width_cols integer Available terminal columns.
---@param window Window WezTerm window.
---@param opts { theme: table, mode_bg: string }
---@return Ribbon layout
function M.hint_layout(config_table, name, width_cols, window, opts) end

---Create a WezTerm key entry from either native syntax or Vim-style syntax.
---
---@param lhs_or_spec string|Chord.VimMapping|Chord.KeyEntry
---@param action? Action WezTerm action when `lhs_or_spec` is a string.
---@param desc? string Optional description.
---@return Chord.KeyEntry|nil entry
function M.key(lhs_or_spec, action, desc) end

---Append a single key mapping to a target table.
---
---@param lhs_or_spec string|Chord.VimMapping|Chord.KeyEntry
---@param action Action WezTerm action.
---@param target table Target list to mutate.
function M.map(lhs_or_spec, action, target) end

---Append mappings to `config.keys`.
---
---@param config_table Config WezTerm config table.
---@param mappings (Chord.VimMapping|Chord.KeyEntry)[]
function M.maps(config_table, mappings) end

---Append a batch of key mappings to a target table.
---
---@param mappings (Chord.VimMapping|Chord.KeyEntry)[]
---@param target table Target list to mutate.
function M.map_batch(mappings, target) end

---Normalize a Vim-style key expression to a WezTerm key entry fragment.
---
---@param lhs string Vim-style key expression.
---@return table|nil entry
---@return string|nil error_message
function M.normalize(lhs) end

---Configure Chord.
---
---@param opts? Chord.Config Partial Chord configuration.
---@return Chord chord Public API.
function M.setup(opts) end

---Convert Vim-style mappings to a WezTerm key table.
---
---@param mappings (Chord.VimMapping|Chord.KeyEntry)[]
---@return Chord.KeyEntry[] key_table
function M.table(mappings) end

---Register modal key tables and write them into `config.key_tables`.
---
---@param config_table Config WezTerm config table.
---@param defs table<string, Chord.KeyTableDef|fun(theme: table): Chord.KeyTableDef>
function M.tables(config_table, defs) end

---Validate a Vim-style key expression.
---
---@param lhs string Vim-style key expression.
---@return boolean valid
---@return string|nil error_message
function M.validate(lhs) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
