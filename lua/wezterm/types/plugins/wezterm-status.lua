---@meta
---@diagnostic disable:unused-local

---@class WeztermStatus.UiConfig
---Visual separators used in the status bar.
---
---@field separators? WeztermStatus.SeparatorConfig
---Theme for the status bar.
---
---@field theme? TabBarColor

---@class WeztermStatus.SeparatorConfig
---Unicode character for solid left arrow.
---
---@field arrow_solid_left? string
---Unicode character for solid right arrow.
---
---@field arrow_solid_right? string
---Unicode character for thin left arrow.
---
---@field arrow_thin_left? string
---Unicode character for thin right arrow.
---
---@field arrow_thin_right? string

---@class WeztermStatus.CellsConfig
---Battery indicator configuration.
---
---@field battery? WeztermStatus.BatteryConfig
---Current working directory configuration.
---
---@field cwd? WeztermStatus.CwdConfig
---Date and time display configuration.
---
---@field date? WeztermStatus.DateConfig
---Hostname display configuration.
---
---@field hostname? WeztermStatus.HostnameConfig
---Kubernetes context configuration.
---
---@field k8s_context? WeztermStatus.K8SContextConfig
---Mode indicator configuration.
---
---@field mode? WeztermStatus.ModeConfig
---WezTerm workspace configuration.
---
---@field workspace? WeztermStatus.WorkspaceConfig

---@class WeztermStatus.ModeConfig
---Whether to show mode indicator.
---
---@field enabled? boolean
---Mapping of mode names to their icons.
---
---@field modes? table<string, string>

---@class WeztermStatus.BatteryConfig
---Custom callback that will allow to format the battery.
---
---@field custom? fun(): string
---Whether to show battery status.
---
---@field enabled? boolean

---@class WeztermStatus.HostnameConfig
---Whether to show hostname.
---
---@field enabled? boolean

---@class WeztermStatus.CwdConfig
---Whether to show current directory.
---
---@field enabled? boolean
---Array of path alias configurations.
---
---@field path_aliases? WeztermStatus.PathAliasConfig[]
---Whether to replace home directory with tilde.
---
---@field tilde_prefix? boolean

---@class WeztermStatus.DateConfig
---Whether to show date/time.
---
---@field enabled? boolean
---The `strftime` format string.
---
---@field format? string
---Icon to show before time.
---
---@field icon? string

---@class WeztermStatus.PathAliasConfig
---Pattern to match in the path.
---
---@field pattern string
---Text to replace the matched pattern with.
---
---@field replacement string

---@class WeztermStatus.WorkspaceConfig
---Whether to show workspace or not.
---
---@field enabled? boolean
---Icon to show before time.
---
---@field icon? string

---@class WeztermStatus.K8SContextConfig
---Whether to show context or not.
---
---@field enabled? boolean
---The `kubectl` path.
---
---@field kubectl_path? string

---@class WeztermStatusConfig
---Status cells configuration.
---
---@field cells? WeztermStatus.CellsConfig
---UI-related configuration.
---
---@field ui? WeztermStatus.UiConfig

---@class WeztermStatus
---All cells of the status bar.
---
---@field cells table
---Internal plugin configuration.
---
---@field protected config WeztermStatusConfig
local M = {}

---Applies configuration to Wezterm's status bar.
---
---@param wezterm_config Config The Wezterm configuration table.
---@param opts? WeztermStatusConfig Optional configuration overrides.
function M.apply_to_config(wezterm_config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
