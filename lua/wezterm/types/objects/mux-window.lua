---@meta

---@class MuxWindow.TabInfo
---The 0-based tab index.
---
---@field index integer
---A `boolean` indicating whether this is
---the active tab within the window.
---
---@field is_active boolean
---A `MuxTab` object.
---
---@field tab MuxTab

---@class SpawnTab
---Specifies the argument array for the command that should be spawned.
---
---If omitted the default program for the domain will be spawned.
---
---@field args? string[]
---Specifies the current working directory that should be
---used for the program.
---
---If unspecified, it'll follow the spec from
---[`config.default_cwd`](lua://Config.default_cwd).
---
---@field cwd? string
---Specifies the multiplexer domain into which the program
---should be spawned.
---
---The default value is assumed to be `"CurrentPaneDomain"`,
---which causes the domain from the currently active pane to be used.
---
---@field domain? "DefaultDomain"|"CurrentPaneDomain"|{ DomainName: string }
---Sets additional environment variables in the environment
---for this command invocation.
---
---@field set_environment_variables? table<string, any>

---`MuxWindow` represents a window that is managed by the multiplexer.
---
---@class MuxWindow
local M = {}

---A convenience accessor for returning
---the active pane in the active tab of the window.
---
---@param self MuxWindow
---@return Pane pane
function M:active_pane() end

---A convenience accessor for returning
---the active tab within the window.
---
---@param self MuxWindow
---@return MuxTab tab
function M:active_tab() end

---Returns the window title as set by `OSC 0`, `OSC 2`
---in a contained pane, or through
---[`MuxWindow:set_title()`](lua://MuxWindow.set_title).
---
---@param self MuxWindow
---@return string title
function M:get_title() end

---Returns the name of the workspace to which the window belongs.
---
---@param self MuxWindow
function M:get_workspace() end

---Attempts to resolve this mux window to its corresponding `GUI Window`.
---
---This may not succeed for a couple of reasons:
---
--- - If called by the multiplexer daemon, there is no GUI, so this will never succeed
--- - If the mux window is part of a workspace that is not the active one
---
---This method is the inverse of `Window:mux_window()`.
---
---@param self MuxWindow
---@return Window window
function M:gui_window() end

---Sets the window title to the provided string.
---
---Note that applications may subsequently change the title
---via escape sequences.
---
---@param self MuxWindow
---@param title string
function M:set_title(title) end

---Changes the name of the workspace to which
---the window belongs to.
---
---@param self MuxWindow
---@param name string
function M:set_workspace(name) end

---Spawns a program into a new tab within this window,
---returning the `MuxTab`, `Pane` and `MuxWindow` objects
---associated with it.
---
---When no arguments are passed, the default program is spawned.
---
---@param self MuxWindow
---@param args? SpawnTab
---@return MuxTab tab
---@return Pane pane
---@return MuxWindow window
function M:spawn_tab(args) end

---Returns an array table holding each of the `MuxTab` objects
---contained within this window.
---
---@param self MuxWindow
---@return MuxTab[] tabs
function M:tabs() end

---Returns an array table holding an extended info entry
---for each of the tabs contained within this window.
---
---@param self MuxWindow
---@return MuxWindow.TabInfo[] tabs
function M:tabs_with_info() end

---Returns the window multiplexer ID.
---
---@param self MuxWindow
---@return integer id
function M:window_id() end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
