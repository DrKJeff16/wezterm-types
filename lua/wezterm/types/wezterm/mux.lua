---@meta

---@alias WezTerm.Mux Wezterm.Mux

---The `wezterm.mux` module exposes functions that operate on the multiplexer layer.
---
---The multiplexer manages the set of running programs into panes, tabs, windows and workspaces.
---
---The multiplexer may not be connected to a GUI so certain operations that require a running
---Window management system are not present in the interface exposed by this module.
---
---You will typically use something like:
---
---```lua
---local wezterm = require("wezterm")
---local mux = wezterm.mux
---```
---
---at the top of your configuration file to access it.
---
--- ---
---## Important Note
---
---You should avoid using, at the file scope in your config, mux functions that cause new splits,
---tabs or windows to be created. The configuration file can be evaluated multiple times
---in various contexts.
---
---If you want to spawn new programs when WezTerm starts up, look at the [`gui-startup`](https://wezterm.org/config/lua/gui-events/gui-startup.html)
---and [`mux-startup`](https://wezterm.org/config/lua/mux-events/mux-startup.html) events.
---
---@class Wezterm.Mux
local M = {}

---Returns an array table holding all of the known`MuxDomain` objects.
---
---See:
--- - [`MuxDomain`](lua://MuxDomain)
---
---@return MuxDomain[] domains
function M.all_domains() end

---Returns an array table holding all of the known `MuxWindow` objects.
---
---See:
--- - [`MuxWindow`](lua://MuxWindow)
---
---@return MuxWindow[] windows
function M.all_windows() end

---Returns the name of the active workspace.
---
---@return string name
function M.get_active_workspace() end

---Resolves `name_or_id` to a domain and returns a `MuxDomain` object representation of it.
---
---`name_or_id` can be:
---
--- - A domain name string to resolve the domain by name
--- - A domain id to resolve the domain by id
--- - `nil` or omitted to return the current default domain
---
---> Other lua types will generate a lua error
---
---If the name or id don't map to a valid domain, this function will return `nil`.
---
---See:
--- - [`MuxDomain`](lua://MuxDomain)
---
---@return MuxDomain|nil|? domain
function M.get_domain() end

---Resolves `name_or_id` to a domain and returns a `MuxDomain` object representation of it.
---
---`name_or_id` can be:
---
--- - A domain name string to resolve the domain by name
--- - A domain id to resolve the domain by id
--- - `nil` or omitted to return the current default domain
---
---> Other Lua types will generate a Lua error
---
---If the name or id don't map to a valid domain, this function will return `nil`.
---
---See:
--- - [`MuxDomain`](lua://MuxDomain)
---
---@param name_or_id? string|integer
---@return MuxDomain|nil|? domain
function M.get_domain(name_or_id) end

---Given a pane ID, verifies that it is a valid pane known to the mux and returns a `Pane` object
---that can be used to operate on the pane.
---
---This is useful for situations where you have obtained a pane id from some other source and
---want to use the various `Pane` methods with it.
---
---See:
--- - [`Pane`](lua://Pane)
---
---@param pane_id integer
---@return Pane pane
function M.get_pane(pane_id) end

---Given a tab ID, verifies that it is a valid tab known to the mux and returns a `MuxTab` object
---that can be used to operate on the tab.
---
---This is useful for situations where you have obtained a tab ID from some other source and want to
---use the various `MuxTab` methods with it.
---
---See:
--- - [`MuxTab`](lua://MuxTab)
---
---@param tab_id integer
---@return MuxTab tab
function M.get_tab(tab_id) end

---Given a window ID, verifies that it is a valid window known to the mux and returns a
---`MuxWindow` object that can be used to operate on the window.
---
---This is useful for situations where you have obtained a window ID from some other source and
---want to use the various `MuxWindow` methods with it.
---
---See:
--- - [`MuxWindow`](lua://MuxWindow)
---
---@param id integer
---@return MuxWindow window
function M.get_window(id) end

---Returns a table containing the names of the workspaces known to the mux.
---
---@return string[] names
function M.get_workspace_names() end

---Renames the workspace `old` to `new`.
---
---```lua
---local wezterm = require("wezterm")
---local active = wezterm.mux.get_active_workspace()
---
---wezterm.mux.rename_workspace(active,'something different')
---```
---
---@param old string
---@param new string
function M.rename_workspace(old, new) end

---Sets the active workspace name.
---
---If the requested name doesn't correspond to an existing workspace, then an error is raised.
---
---@param workspace string
function M.set_active_workspace(workspace) end

---Assign a new default domain in the mux.
---
---The domain that you assign here will override any configured value of `config.default_domain` or
---the implicit assignment of the default domain that may have happened as a result of
---starting WezTerm via `wezterm connect` or `wezterm serial`.
---
---See:
--- - [`config.default_domain`](lua://Config.default_domain)
---
---@param domain MuxDomain
function M.set_default_domain(domain) end

---Spawns a program into a new window, returning the associated objects:
---
---1. [`MuxTab`](lua://MuxTab)
---2. [`Pane`](lua://Pane)
---3. [`MuxWindow`](lua://MuxWindow)
---
---```lua
---local tab, pane, window = wezterm.mux.spawn_window {}
---```
---
---When no arguments are passed, the default program is spawned.
---
---For the parameter fields, see:
--- - [`SpawnCommand`](lua://SpawnCommand)
---
---@return MuxTab tab
---@return Pane pane
---@return MuxWindow window
function M.spawn_window() end

---Spawns a program into a new window, returning the associated objects:
---
---1. [`MuxTab`](lua://MuxTab)
---2. [`Pane`](lua://Pane)
---3. [`MuxWindow`](lua://MuxWindow)
---
---```lua
---local tab, pane, window = wezterm.mux.spawn_window {}
---```
---
---When no arguments are passed, the default program is spawned.
---
---For the parameter fields, see:
--- - [`SpawnCommand`](lua://SpawnCommand)
---
---@param T? SpawnCommand
---@return MuxTab tab
---@return Pane pane
---@return MuxWindow window
function M.spawn_window(T) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
