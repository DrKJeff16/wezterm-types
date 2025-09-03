---@meta

---@class PluginList
---The URL of the plugin repo, as provided to the
---[`wezterm.plugin.require`](lua://Wezterm.Plugin.require)
---function.
---
---@field url string
---The encoded name of the plugin, derived
---from the repo URL.
---
---@field component string
---The absolute location of the plugin checkout in the
---WezTerm runtime directory.
---
---Use this to set the plugin path if needed.
---@field plugin_dir string

---The `wezterm.plugin` module provides functions
---to manage WezTerm plugins.
---
---@class Wezterm.Plugin
local Plugin = {}

---Will return a `PluginSpec` array listing all
---the plugin repos in the plugin directory.
---
---For info on the returned array, see:
--- - [`PluginList`](lua://PluginList)
---
---@return PluginList[]
function Plugin.list() end

---Will clone the plugin repo if it doesn't
---already exist and store it in the runtime dir
---under `plugins/NAME` where `NAME` is derived
---from the repo URL.
---Once cloned, the repo is **NOT** automatically updated
---when `wezterm.plugin.require()` is called again.
---
---The function takes a single string parameter:
---
--- - `url`: The Git repo URL.
---
---Only HTTP(S) or local filesystem repos are allowed
---for the Git URL.
---
---```lua
---local remote_plugin = wezterm.plugin.require 'https://github.com/owner/repo'
---local local_plugin =
---  wezterm.plugin.require 'file:///Users/developer/projects/my.Plugin'
---```
---
---@param url string
---@return any
function Plugin.require(url) end

---Attempt to fast-forward or run `git pull --rebase`
---for each of the repos in the plugin directory.
---
---Note: The configuration is not reloaded afterwards;
---the user will need to do that themselves.
---
---A useful way to reload the configuration is with:
--- - [`wezterm.reload_configuration()`](lua://Wezterm.reload_configuration)
---
function Plugin.update_all() end
