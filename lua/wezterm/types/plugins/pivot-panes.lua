---@meta
---@diagnostic disable:unused-local

---@class PivotPaneState
---Command arguments.
---
---@field args string[]
---Command running in the pane.
---
---@field command string
---Current working directory.
---
---@field cwd string
---Whether the pane is running a shell.
---
---@field is_shell boolean
---Process priority for restoration.
---
---@field priority integer
---Name of the process running in the pane.
---
---@field process_name string
---Captured scrollback content if available.
---
---@field scrollback? string

---@class PivotConfig
---Enable debug logging.
---
---@field debug? boolean
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

---@class Pivot.Pivot
local Pivot = {}

---Determine if a set of panes can be pivoted.
---
---@param panes Pane[] Array of panes to check
---@return boolean can_pivot
---@return string|nil orientation Current orientation if can pivot
function Pivot.can_pivot(panes) end

---Capture state of a pane.
---
---@param pane Pane The `Pane` object.
---@return PivotPaneState pane_state
function Pivot.capture_pane_state(pane) end

---Pivot two panes, toggling their orientation.
---
---@param panes Pane[] Array of panes to pivot
---@param current_orientation "horizontal"|"vertical" Current orientation.
---@return boolean success
function Pivot.pivot_panes(panes, current_orientation) end

---Restore pane state.
---
---@param pane Pane The `Pane` object.
---@param state PivotPaneState
function Pivot.restore_pane_state(pane, state) end

---Initialize the module.
---
---@param module_config PivotConfig
---@return Pivot.Pivot module
function Pivot.setup(module_config) end

---@param tab_or_pane Pane|PaneInformation|MuxTab
---@return boolean success
function Pivot.toggle_orientation(tab_or_pane) end

---@class Pivot
---@field config PivotConfig
---@field pivot Pivot.Pivot
local M = {}

---Configure the plugin with custom settings.
--
---@param user_config PivotConfig
---@return Pivot plugin
function M.setup(user_config) end

---Directly toggle pane orientation.
---
---@param tab_or_pane? Pane|MuxTab Optional `MuxTab` or `Pane` to use (defaults to current).
---@return boolean success
function M.toggle_orientation(tab_or_pane) end

---Callback function for keybindings.
---
---@param window Window `Window` object.
---@param pane Pane `Pane` object.
---@return boolean success
function M.toggle_orientation_callback(window, pane) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
