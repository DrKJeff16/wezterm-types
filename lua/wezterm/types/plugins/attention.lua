---@meta
---@diagnostic disable:unused-local

---@alias WeztermAttentionOpts.Attention "notify"|"review"|"stop"|"thinking"
---@alias WeztermAttentionOpts.Renderer "manual"|"tab"
---@alias WeztermAttention.TitleFormatter fun(tab: TabInformation, ctx: WeztermAttention.WrapTitleFormatterCtx): title: string

---@class WeztermAttention.WrapTitleFormatterCtx
---@field attention string[]|string
---@field config Config
---@field default_title string
---@field hover boolean
---@field max_width integer
---@field panes PaneInformation[]
---@field tabs TabInformation[]

---@class WeztermAttentionOpts.ReviewKey: SendKeyParams
---@field key? string

---@class WeztermAttentionOpts.Colors
---@field notify? string
---@field quiet? string
---@field review? string
---@field stop? string
---@field thinking? string

---@class WeztermAttentionOpts.Indicators
---@field held? string
---@field muted? string
---@field notify? string
---@field quiet? string
---@field review? string
---@field stop? string
---@field thinking_frames? string[]

---@class WeztermAttentionOpts
---These types are acknowledged when their pane becomes active.
---
---@field acknowledge_types? ("notify"|"stop"|string)[]
---@field auto_clear? WeztermAttentionOpts.Attention[]
---Tab background tint per attention type (subtle, dark).
---
---@field colors? WeztermAttentionOpts.Colors
---@field dir? string
---Tab text indicators.
---
---@field indicators? WeztermAttentionOpts.Indicators
---Keybind to mute and unmute the active tab (set to `false` to disable).
---
---@field mute_key? WeztermAttentionOpts.ReviewKey|false
---Higher index equals higher priority when multiple panes have attention.
---
---@field priority? WeztermAttentionOpts.Attention[]
---Render mode:
---
--- - `"tab"`: Plugin owns format-tab-title (default)
--- - `"manual"`: Plugin registers no tab handler; use `wrap_title_formatter()` or API
---
---See:
--- - [`wrap_title_formatter()`](lua://WeztermAttention.wrap_title_formatter)
---
---@field renderer? WeztermAttentionOpts.Renderer
---Ask WezTerm to rebuild the tab bar when a pane's attention changes.
---
---Set to `false` when the host already repaints titles on its own tick.
---
---@field request_redraw? boolean
---Keybind to toggle the user's review flag on the active tab (set to `false` to disable).
---
---@field review_key? WeztermAttentionOpts.ReviewKey|false
---Base-title sources: the tab's own title, then directory, then a pane title that held for
---two polls, and the pane title as it is right now only when none of those has anything to say.
---
---@field show_directory? boolean
---Optional provider suffix. Off preserves the shipped title shape.
---
---@field show_provider? boolean
---@field stale_after_ms? { thinking: integer }|false
---@field settled_title_fallback? boolean
---@field title_formatter? WeztermAttention.TitleFormatter

---@class WeztermAttention.Internal
local I = {}

---@param pane_id integer
---@param opts? WeztermAttentionOpts|{ now_ms?: integer }|{ write_acknowledgement?: fun(dir: string, pane_id: string, identity: string): success: boolean }
---@return "absent"|"acknowledged"|"failed"|"kept" acknowledge_type
function I.acknowledge_focused_pane(pane_id, opts) end

---@param pane_ids string[]
---@param opts? WeztermAttentionOpts
---@return { color?: string, indicator: string, type?: string } visible_attention
function I.resolve_visible_attention(pane_ids, opts) end

---@class WeztermAttention
---@field private _active_acknowledge_set table<string, boolean>
---@field private _active_colors WeztermAttentionOpts.Colors
---@field private _active_dir string
---@field private _internal WeztermAttention.Internal
local M = {}

---@param config Config
---@param opts? WeztermAttentionOpts
function M.apply_to_config(config, opts) end

---Read the cached attention state for a pane.
---
---Returns a `type`, `frame` tuple, or `nil`.
---
---@param pane_id integer
---@param opts? WeztermAttentionOpts
---@return string|nil|? type
---@return integer|nil|? frame
function M.get_attention(pane_id, opts) end

---Remove the attention marker for a pane.
---
---@param pane_id integer
---@param opts? WeztermAttentionOpts
function M.remove_marker(pane_id, opts) end

---Poll marker files and update cache.
---
---Call from your own `update-status` handler if you set `auto_poll` to `false`,
---or if WezTerm only fires one handler.
---
---Only refreshes entries for panes in the current window. Cross-window cache entries
---are left alone — pruning them here would cause cache thrash when multiple windows fire
---`update-status` (each window would wipe the other's entries every tick, producing visible
---tab-indicator blinking). Stale entries are cleaned up by the pane-destroyed handler.
---
---@param window Window
---@param opts? WeztermAttentionOpts
function M.poll(window, opts) end

---@param pane_ids integer[]
---@return string visible_attention
function M.visible_attention(pane_ids) end

---@param base_fn WeztermAttention.TitleFormatter
---@return fun(tab: TabInformation, tabs: TabInformation[], panes: PaneInformation[], config: Config, hover: boolean, max_width: integer): string|FormatItem
function M.wrap_title_formatter(base_fn) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
