---@meta
---@diagnostic disable:unused-local

---@enum (key) WeztermAttentionOpts.Attention
local priority = { notify = 1, review = 1, stop = 1, thinking = 1 }

---@enum (key) WeztermAttentionOpts.Renderer
local renderers = { manual = 1, tab = 1 }

---@class WeztermAttention.WrapTitleFormatterCtx
---@field attention string[]|string
---@field config Config
---@field default_title string
---@field hover boolean
---@field max_width integer
---@field panes PaneInformation[]
---@field tabs TabInformation[]

---@alias WeztermAttention.TitleFormatter fun(tab: TabInformation, ctx: WeztermAttention.WrapTitleFormatterCtx): string

---@class WeztermAttentionOpts.ReviewKey: SendKeyParams
---@field key? string

---@class WeztermAttentionOpts.Colors
---@field notify? string
---@field review? string
---@field stop? string
---@field thinking? string

---@class WeztermAttentionOpts.Indicators
---@field notify? string
---@field review? string
---@field stop? string
---@field thinking_frames? string[]

---@class WeztermAttentionOpts
---@field auto_clear? WeztermAttentionOpts.Attention[]
---@field colors? WeztermAttentionOpts.Colors
---@field dir? string
---@field indicators? WeztermAttentionOpts.Indicators
---@field priority? WeztermAttentionOpts.Attention[]
---@field renderer? WeztermAttentionOpts.Renderer
---@field review_key? WeztermAttentionOpts.ReviewKey
---@field title_formatter? WeztermAttention.TitleFormatter

---@class WeztermAttention
---@field private _active_dir string
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
---@return string|nil type
---@return integer|nil frame
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
---@param window Window
---@param opts? WeztermAttentionOpts
function M.poll(window, opts) end

---@param base_fn WeztermAttention.TitleFormatter
---@return fun(tab: TabInformation, tabs: TabInformation[], panes: PaneInformation[], config: Config, hover: boolean, max_width: integer): string|FormatItem
function M.wrap_title_formatter(base_fn) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
