---@meta
---@diagnostic disable:unused-local

---@enum (key) AgentDeckStatus
local filter = {
  idle = 1,
  inactive = 1,
  waiting = 1,
  working = 1,
}

---@enum (key) AgentDeck.ComponentSpec.Type
local comp_types = {
  badge = 1,
  icon = 1,
  separator = 1,
}

---@enum (key) AgentDeckOpts.Icons.Style
local styles = {
  emoji = 1,
  nerd = 1,
  unicode = 1,
}

---@enum (key) AgentDeck.Notifications.Backend
local backends = {
  ["terminal-notifier"] = 1,
  native = 1,
}

---@class AgentDeck.AgentsSpec.StatusPatterns
---@field idle? string[]
---@field inactive? string[]
---@field waiting? string[]
---@field working? string[]

---@class AgentDeck.AgentsSpec
---@field argv_patterns? string[]
---@field executable_patterns? string[]
---@field patterns? string[]
---@field status_patterns? AgentDeck.AgentsSpec.StatusPatterns
---@field title_patterns? string[]

---@class AgentDeckOpenCodeOpts: AgentDeck.AgentsSpec

---@class AgentDeckClaudeOpts: AgentDeck.AgentsSpec

---@class AgentDeckGeminiOpts: AgentDeck.AgentsSpec

---@class AgentDeckCodexOpts: AgentDeck.AgentsSpec

---@class AgentDeckAiderOpts: AgentDeck.AgentsSpec

---@class AgentDeckOpts.Agents
---@field aider? AgentDeckAiderOpts
---@field claude? AgentDeckClaudeOpts
---@field codex? AgentDeckCodexOpts
---@field gemini? AgentDeckGeminiOpts
---@field opencode? AgentDeckOpenCodeOpts

---@class AgentDeck.ComponentSpec
---@field filter? AgentDeckStatus
---@field label? string
---@field text? string
---@field type? AgentDeck.ComponentSpec.Type

---@class AgentDeckOpts.RightStatus
---@field components? AgentDeck.ComponentSpec[]
---@field enabled? boolean

---@class AgentDeckOpts.TabTitle
---@field components? AgentDeck.ComponentSpec[]
---@field enabled? boolean
---@field position? "left"|string

---@class AgentDeckOpts.Colors
---@field idle? string
---@field inactive? string
---@field waiting? string
---@field working? string

---@class AgentDeck.IconStyleSpec: AgentDeckOpts.Colors

---@class AgentDeckOpts.Icons
---@field emoji? AgentDeck.IconStyleSpec
---@field nerd? AgentDeck.IconStyleSpec
---@field style? AgentDeckOpts.Icons.Style
---@field unicode? AgentDeck.IconStyleSpec

---@class AgentDeck.Notifications.TerminalNotifier
---@field activate? boolean
---@field group? string
---@field path? string|nil
---@field sound? string
---@field title? string

---@class AgentDeckOpts.Notifications
---@field backend? AgentDeck.Notifications.Backend
---@field enabled? boolean
---@field on_waiting? boolean
---@field terminal_notifier? AgentDeck.Notifications.TerminalNotifier
---@field timeout_ms? integer

---@class AgentDeckOpts
---@field agents? AgentDeckOpts.Agents|table<string, AgentDeck.AgentsSpec>
---@field colors? AgentDeckOpts.Colors
---@field cooldown_ms? integer
---@field enabled_agents? nil|string[]
---@field icons? AgentDeckOpts.Icons
---@field max_lines? integer
---@field right_status? AgentDeckOpts.RightStatus
---@field update_interval? integer
---@field notifications? AgentDeckOpts.Notifications

---@class AgentDeckState
---@field agent_type string
---@field cooldown_start? integer
---@field last_update integer
---@field status AgentDeckStatus

---@class AgentDeckStatusCounts
---@field idle integer
---@field inactive integer
---@field waiting integer
---@field working integer

---@class AgentDeck
local M = {}

---@param config Config
---@param opts? AgentDeckOpts
function M.apply_to_config(config, opts) end

---@return AgentDeckStatusCounts counts
function M.count_agents_by_status() end

---@param pane_id integer
---@return AgentDeckState state
function M.get_agent_state(pane_id) end

---@return table<integer, AgentDeckState> states
function M.get_all_agent_states() end

---@return AgentDeckOpts config
function M.get_config() end

---@param status_name AgentDeckStatus
---@return string color
function M.get_status_color(status_name) end

---@param status_name AgentDeckStatus
---@return string icon
function M.get_status_icon(status_name) end

---@param opts? AgentDeckOpts
function M.set_config(opts) end

---@param opts? AgentDeckOpts
function M.setup(opts) end

---@param pane Pane
---@return AgentDeckState|nil state
function M.update_pane(pane) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
