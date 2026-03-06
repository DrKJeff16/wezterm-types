---@meta
---@diagnostic disable:unused-local

---@class AIHelperConfigSpec
---@field keybinding_with_pane? Key
---@field luarocks_path? string
---@field share_n_lines? integer
---@field show_loading? boolean
---@field timeout? integer

---@class AIHelperConfigLocal: AIHelperConfigSpec
---@field lms_path string
---@field type? 'local'

---@class AIHelperConfigGemini: AIHelperConfigSpec
---@field api_key string
---@field type 'google'

---@class AIHelperConfigOllama: AIHelperConfigSpec
---@field model? string
---@field ollama_path string,
---@field type 'ollama'

---@class AIHelperConfigOpenAI: AIHelperConfigSpec
---@field api_key string
---@field api_url string
---@field headers? table<string, string>
---@field model string
---@field type 'http'

---@alias AIHelperConfig
---|AIHelperConfigGemini
---|AIHelperConfigLocal
---|AIHelperConfigOllama
---|AIHelperConfigOpenAI

---@class AIHelper
local M = {}

---@param wezterm_config Config
---@param user_config AIHelperConfig
function M.apply_to_config(wezterm_config, user_config) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
