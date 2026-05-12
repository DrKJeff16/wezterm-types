---@meta
---@diagnostic disable:unused-local

---@class Chord.KeyEntry
---@field key string WezTerm key name.
---@field mods? string WezTerm modifier string, such as `CTRL|SHIFT`.
---@field action any WezTerm action assigned to the key.
---@field desc? string Optional command-palette or hint-bar description.

---@class Chord.VimMapping
---@field [1]? string Vim-style left-hand side, such as `<C-Space>`.
---@field [2]? any WezTerm action.
---@field [3]? string Optional description.
---@field lhs? string Vim-style left-hand side.
---@field rhs? any WezTerm action.
---@field action? any WezTerm action.
---@field desc? string Optional description.

---@class Chord.OverrideSpec
---@field enabled? boolean Disable a mapping group when set to `false`.
---@field disable? (string|Chord.KeyEntry|Chord.VimMapping)[] Mappings to remove.
---@field override? table<string, any> Mappings to replace by Vim-style lhs.
---@field add? Chord.VimMapping[] Mappings to append.

---@class Chord.Overrides
---@field enabled? { keys?: boolean, key_tables?: boolean }
---@field keys? Chord.OverrideSpec
---@field key_tables? table<string, Chord.OverrideSpec>

---@class Chord.KeyMeta
---@field i string Short icon or label for the key table.
---@field txt string Display text for the key table.
---@field bg string Background color for the key table.
---@field pad? integer Optional display padding.
---@field name? string Runtime key-table name.

---@class Chord.KeyTableDef
---@field meta Chord.KeyMeta Key-table metadata used by hints and mode displays.
---@field keys Chord.VimMapping[] Key definitions in Vim-style notation.

---@alias Chord.KeyTableDefFn fun(theme: table): Chord.KeyTableDef

---@class Chord.HintsConfig
---@field separator string Separator between hint entries.
---@field page_cache_prefix string Prefix for per-pane hint page cache keys.

---@class Chord.CommandConfig
---@field key string Key binding that opens the command picker.
---@field desc string Description for the injected command picker binding.
---@field title string InputSelector title.
---@field fuzzy boolean Whether InputSelector fuzzy matching is enabled.
---@field description string InputSelector description.
---@field fuzzy_description string InputSelector fuzzy description.
---@field alphabet? string InputSelector shortcut alphabet.
---@field include_registered boolean Include commands registered through `chord.command.register`.
---@field include_keys boolean Include top-level `config.keys` entries.
---@field include_key_tables boolean Include `config.key_tables` entries.
---@field include_defaults boolean Include `wezterm.gui.default_keys()` entries.
---@field include_undocumented boolean Include entries without `desc` or `label`.
---@field dedupe boolean Dedupe entries by binding identity.

---@class Chord.LogConfig
---@field enabled boolean
---@field threshold string|integer

---@class Chord.Config
---@field aliases table<string, string> Vim-style key aliases mapped to WezTerm key names.
---@field modifiers table<string, string> Vim-style modifier aliases mapped to WezTerm modifiers.
---@field leader string Leader token used in Vim-style key notation.
---@field hints Chord.HintsConfig
---@field command Chord.CommandConfig
---@field log Chord.LogConfig

---@alias Chord.CommandSource "registered"|"keys"|"key_table"|"default"

---@class Chord.Command
---@field id string Stable command identifier.
---@field label string User-facing command label.
---@field action any WezTerm action executed when the command is selected.
---@field lhs? string Vim-style key label, when the command is key-backed.
---@field source Chord.CommandSource Source collection where the command came from.
---@field table_name? string Key table name for `key_table` commands.
---@field binding_id? string Normalized binding identity used for deduplication.

---@class Chord.CommandSpec
---@field [1]? string Vim-style left-hand side.
---@field [2]? any WezTerm action.
---@field [3]? string Optional command label.
---@field id? string Stable command identifier.
---@field label? string User-facing command label.
---@field desc? string User-facing command label.
---@field lhs? string Vim-style left-hand side.
---@field key? string Native WezTerm key name.
---@field mods? string Native WezTerm modifier string.
---@field rhs? any WezTerm action.
---@field action? any WezTerm action.

---@class Chord.CommandApi
local Command = {}

---Clear commands registered through `chord.command.register`.
function Command.clear() end

---Register an action-only command or a key-backed command.
---@param spec Chord.CommandSpec
---@return Chord.Command|nil command
function Command.register(spec) end

---Register many commands.
---@param specs Chord.CommandSpec[]
function Command.register_many(specs) end

---Collect commands from registered entries, config keys, key tables, and defaults.
---@param config_table table WezTerm config table.
---@param opts? table Command options merged over `Chord.CommandConfig`.
---@return Chord.Command[] commands
function Command.collect(config_table, opts) end

---Return a WezTerm action that opens the command picker.
---@param config_table table WezTerm config table.
---@param opts? table Command options merged over `Chord.CommandConfig`.
---@return table action
function Command.action(config_table, opts) end

---Inject a trigger binding that opens the command picker.
---@param config_table table WezTerm config table.
---@param opts? table Command options merged over `Chord.CommandConfig`.
---@return table action
function Command.apply(config_table, opts) end

---@class Chord
---@field aliases table<string, string>
---@field modifiers table<string, string>
---@field command Chord.CommandApi
local M = {}

---Configure Chord.
---@param opts? table Partial Chord configuration.
---@return Chord chord Public API.
function M.setup(opts) end

---Return the active Chord configuration.
---@return Chord.Config config
function M.config() end

---Validate a Vim-style key expression.
---@param lhs string Vim-style key expression.
---@return boolean valid
---@return string|nil error_message
function M.validate(lhs) end

---Normalize a Vim-style key expression to a WezTerm key entry fragment.
---@param lhs string Vim-style key expression.
---@return table|nil entry
---@return string|nil error_message
function M.normalize(lhs) end

---Create a WezTerm key entry from either native syntax or Vim-style syntax.
---@param lhs_or_spec string|Chord.VimMapping|Chord.KeyEntry
---@param action? any WezTerm action when `lhs_or_spec` is a string.
---@param desc? string Optional description.
---@return Chord.KeyEntry|nil entry
function M.key(lhs_or_spec, action, desc) end

---Append a single key mapping to a target table.
---@param lhs_or_spec string|Chord.VimMapping|Chord.KeyEntry
---@param action any WezTerm action.
---@param target table Target list to mutate.
function M.map(lhs_or_spec, action, target) end

---Append a batch of key mappings to a target table.
---@param mappings (Chord.VimMapping|Chord.KeyEntry)[]
---@param target table Target list to mutate.
function M.map_batch(mappings, target) end

---Convert Vim-style mappings to a WezTerm key table.
---@param mappings (Chord.VimMapping|Chord.KeyEntry)[]
---@return Chord.KeyEntry[] key_table
function M.table(mappings) end

---Append mappings to `config.keys`.
---@param config_table table WezTerm config table.
---@param mappings (Chord.VimMapping|Chord.KeyEntry)[]
function M.maps(config_table, mappings) end

---Register modal key tables and write them into `config.key_tables`.
---@param config_table table WezTerm config table.
---@param defs table<string, Chord.KeyTableDef|Chord.KeyTableDefFn>
function M.tables(config_table, defs) end

---Apply user overrides to already-built keys and key tables.
---@param config_table table WezTerm config table.
---@param overrides Chord.Overrides
function M.apply_overrides(config_table, overrides) end

---Return registered key-table metadata for mode displays.
---@param theme table Theme or color table passed to key-table definition functions.
---@return table<string, Chord.KeyMeta> modes
function M.get_modes(theme) end

---Render a plain-text key-hint bar for the active key table.
---@param config_table table WezTerm config table.
---@param name? string Key-table name. `nil` uses top-level keys.
---@param width_cols integer Available terminal columns.
---@param window Window WezTerm window.
---@return string hint
function M.hint(config_table, name, width_cols, window) end

---Render a Ribbon key-hint bar for the active key table.
---@param config_table table WezTerm config table.
---@param name? string Key-table name. `nil` uses top-level keys.
---@param width_cols integer Available terminal columns.
---@param window Window WezTerm window.
---@param opts { theme: table, mode_bg: string }
---@return Ribbon layout
function M.hint_layout(config_table, name, width_cols, window, opts) end

---Return an action callback that changes the visible hint page.
---@param name? string Key-table name.
---@param direction integer Page delta.
---@return table action
function M.hint_action(name, direction) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
