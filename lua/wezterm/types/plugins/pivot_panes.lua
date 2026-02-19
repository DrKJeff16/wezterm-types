---@meta
---@diagnostic disable:unused-local

---@class PivotPaneState
---Command running in the pane.
---
---@field command string
---Command arguments.
---
---@field args string[]
---Current working directory.
---
---@field cwd string
---Whether the pane is running a shell.
---
---@field is_shell boolean
---Name of the process running in the pane.
---
---@field process_name string
---Process priority for restoration.
---
---@field priority integer
---Captured scrollback content if available.
---
---@field scrollback? string

---@class PivotConfig
---Maximum number of scrollback lines to preserve
---
---Set it to `0` to disable this.
---
---@field max_scrollback_lines? integer
---Table mapping application names to priority values.
---
---@field priority_apps? table<string, number>
---List of shell names to identify shell panes.
---
---@field shell_detection? string[]
---Enable debug logging.
---
---@field debug? boolean

---@class Pivot.Pivot
local Pivot = {}

---Capture state of a pane.
---
---@param pane Pane
---@return PivotPaneState pane_state
function Pivot.capture_pane_state(pane) end

---Restore pane state.
---
---@param pane Pane
---@param state PivotPaneState
function Pivot.restore_pane_state(pane, state) end

---Determine if a set of panes can be pivoted.
---
---@param panes Pane[] Array of panes to check
---@return boolean can_pivot
---@return string|nil orientation Current orientation if can pivot
function Pivot.can_pivot(panes) end

---Pivot two panes, toggling their orientation.
---
---@param panes Pane[] Array of panes to pivot
---@param current_orientation string Current orientation "horizontal" or "vertical"
---@return boolean success
function Pivot.pivot_panes(panes, current_orientation) end

---@param tab_or_pane Pane|PaneInformation|MuxTab Optional tab or pane to use (defaults to current)
---@return boolean success
function Pivot.toggle_orientation(tab_or_pane) end

---Initialize the module.
---
---@param module_config PivotConfig
---@return Pivot.Pivot module
function Pivot.setup(module_config) end

---@class Pivot
---@field config PivotConfig
---@field pivot Pivot.Pivot
local M = {}

---Configure the plugin with custom settings.
--
---@param user_config PivotConfig
---@return Pivot plugin
function M.setup(user_config) end

---Callback function for keybindings.
---
---@param window Window WezTerm window object
---@param pane Pane WezTerm pane object
---@return boolean success
function M.toggle_orientation_callback(window, pane) end

---Directly toggle pane orientation.
---
---@param tab_or_pane? Pane|MuxTab Optional tab or pane to use (defaults to current)
---@return boolean success
function M.toggle_orientation(tab_or_pane) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
