---@meta
---@diagnostic disable:unused-local

---@class AIHelperConfigSpec
---@field luarocks_path? string
---@field keybinding_with_pane? Key
---@field timeout? integer
---@field show_loading? boolean
---@field share_n_lines? integer

---@class AIHelperConfigLocal: AIHelperConfigSpec
---@field lms_path string
---@field type? 'local'

---@class AIHelperConfigGemini: AIHelperConfigSpec
---@field api_key string
---@field type 'google'

---@class AIHelperConfigOllama: AIHelperConfigSpec
---@field ollama_path string,
---@field type 'ollama'
---@field model? string

---@class AIHelperConfigOpenAI: AIHelperConfigSpec
---@field type 'http'
---@field api_url string
---@field api_key string
---@field model string
---@field headers? table<string, string>

---@alias AIHelperConfig
---|AIHelperConfigLocal
---|AIHelperConfigGemini
---|AIHelperConfigOllama
---|AIHelperConfigOpenAI

---@class AIHelper
local M = {}

---@param wezterm_config Config
---@param user_config AIHelperConfig
function M.apply_to_config(wezterm_config, user_config) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
