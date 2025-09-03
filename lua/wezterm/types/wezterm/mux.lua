---@meta

---The `wezterm.mux` module exposes functions that operate
---on the multiplexer layer.
---
---The multiplexer manages the set of running programs into
---panes, tabs, windows and workspaces.
---
---The multiplexer may not be connected to a GUI so
---certain operations that require a running
---Window management system are not present in the interface
---exposed by this module.
---
---You will typically use something like:
---
---```lua
---local wezterm = require 'wezterm'
---local mux = wezterm.mux
---```
---
---at the top of your configuration file to access it.
---
--- ---
---## Important Note
---
---You should avoid using, at the file scope in your config,
---mux functions that cause new splits, tabs or windows to be created.
---The configuration file can be evaluated multiple times in various contexts.
---If you want to spawn new programs when wezterm starts up,
---look at the [`gui-startup`](https://wezterm.org/config/lua/gui-events/gui-startup.html) and
---[`mux-startup`](https://wezterm.org/config/lua/mux-events/mux-startup.html) events.
---
---@class Wezterm.Mux
local Mux = {}

---Returns an array table holding all of the known
---[`MuxDomain`](lua://MuxDomain) objects.
---
---@return MuxDomain[] domains
function Mux.all_domains() end

---Returns an array table holding all of the known
---[`MuxWindow`](lua://MuxWindow) objects.
---
---@return MuxWindow[] windows
function Mux.all_windows() end

---Returns the name of the active workspace.
---
---@return string name
function Mux.get_active_workspace() end

---Resolves `name_or_id` to a domain and returns a
---[`MuxDomain`](lua://MuxDomain) object
---representation of it.
---
---`name_or_id` can be:
---
--- - A domain name string to resolve the domain by name
--- - A domain id to resolve the domain by id
--- - `nil` or omitted to return the current default domain
---
---> Other lua types will generate a lua error
---
---If the name or id don't map to a valid domain,
---this function will return `nil`.
---
---@param name_or_id? string|integer|nil
---@return MuxDomain|nil domain
function Mux.get_domain(name_or_id) end

---Given a pane ID, verifies that it is a valid pane
---known to the mux and returns a
---[`Pane`](lua://Pane) object that can be
---used to operate on the pane.
---
---This is useful for situations where you have
---obtained a pane id from some other source and
---want to use the various
---[`Pane`](lua://Pane) methods with it.
---
---@param PANE_ID integer
---@return Pane pane
function Mux.get_pane(PANE_ID) end

---Given a tab ID, verifies that it is a valid tab
---known to the mux and returns a
---[`MuxTab`](lua://MuxTab) object that can
---be used to operate on the tab.
---
---This is useful for situations where you have obtained
---a tab id from some other source and want to use the various
---[`MuxTab`](lua://MuxTab) methods with it.
---
---@param TAB_ID integer
---@return MuxTab tab
function Mux.get_tab(TAB_ID) end

---Given a window ID, verifies that it is a valid window
---known to the mux and returns a
---[`MuxWindow`](lua://MuxWindow) object
---that can be used to operate on the window.
---
---This is useful for situations where you have obtained
---a window id from some other source and want to use the various
---[`MuxWindow`](lua://MuxWindow) methods
---with it.
---
---@param id integer
---@return MuxWindow
function Mux.get_window(id) end

---Returns a table containing the names of the workspaces
---known to the mux.
---
---@return string[] names
function Mux.get_workspace_names() end

---Renames the workspace `old` to `new`.
---
---```lua
---local wezterm = require 'wezterm'
---local active = wezterm.mux.get_active_workspace()
---
---wezterm.mux.rename_workspace(active,'something different')
---```
---
---@param old string
---@param new string
function Mux.rename_workspace(old, new) end

---Sets the active workspace name.
---
---If the requested name doesn't correspond to an existing workspace,
---then an error is raised.
---
---@param WORKSPACE string
function Mux.set_active_workspace(WORKSPACE) end

---Assign a new default domain in the mux.
---
---The domain that you assign here will override any configured
---[`config.default_domain`](lua://Config.default_domain) or
---the implicit assignment of the default domain that may
---have happened as a result of starting wezterm
---via `wezterm connect` or `wezterm serial`.
---
---@param domain MuxDomain
function Mux.set_default_domain(domain) end

---Spawns a program into a new window, returning the
---associated objects:
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
function Mux.spawn_window(T) end
