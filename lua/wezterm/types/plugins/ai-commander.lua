---@meta
---@diagnostic disable:unused-local

---@enum (key) AICommanderConfig.Provider
local provider = {
  anthropic = 1,
  openai = 1,
}

---@class AICommanderConfig.APIKey
---Your Anthropic API key.
---
---@field anthropic? string
---Your OpenAI API key.
---
---@field openai? string

---@class AICommanderConfig.Model: AICommanderConfig.APIKey

---@class AICommanderConfig
---@field api_key? AICommanderConfig.APIKey
---Number of commands to generate (default: `5`).
---
---@field command_count? integer
---History file location.
---
---@field history_file? string
---Maximum number of history items.
---
---@field max_history? integer
---Maximum response length.
---
---@field max_tokens? integer
---@field model? AICommanderConfig.Model
---`"anthropic"` or `"openai"` (default: `"anthropic"`).
---
---@field provider? AICommanderConfig.Provider
---Response creativity (`0.0` - `1.0`).
---
---@field temperature? number

---@class AICommander
local M = {}

---@param wezterm_config Config
---@param plugin_config AICommanderConfig
function M.apply_to_config(wezterm_config, plugin_config) end

---@param window Window The `Window` object.
---@param pane Pane The `Pane` object.
function M.show_history(window, pane) end

---@param window Window The `Window` object.
---@param pane Pane The `Pane` object.
function M.show_prompt(window, pane) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
