---@meta

---@class MuxSize
---@field rows integer
---@field cols integer
---@field pixel_width integer
---@field pixel_height integer
---@field dpi number

---Mirrors `MuxPaneInfo` in wezterm upstream:
---https://github.com/wezterm/wezterm/blob/main/lua-api-crates/mux/src/lib.rs
---
---@class MuxTab.PaneInfo
---The topological pane index.
---
---@field index integer
---If `true` then this is the active pane within this tab.
---
---@field is_active boolean
---Is `true` if the pane is in the zoomed state.
---
---@field is_zoomed boolean
---The offset from the top left corner of the containing tab
---to the top left corner of this pane, in cells.
---
---@field left integer
---The offset from the top left corner of the containing tab
---to the top left corner of this pane, in cells.
---
---@field top integer
---The width of the pane in cells.
---
---@field width integer
---The height of the pane in cells.
---
---@field height integer
---The width of the pane in pixels.
---
---@field pixel_width integer
---The height of the pane in pixels.
---
---@field pixel_height integer
---A `Pane` object.
---
---@field pane Pane

---`MuxTab` represents a tab that is managed
---by the multiplexer.
---
---@class MuxTab
local M = {}

---Activates (focuses) the tab.
---
function M:activate() end

---A convenience accessor for returning the active pane
---in the tab.
---
---@return Pane active_pane
function M:active_pane() end

---Returns the pane adjacent to the active pane
---of the current tab, in the `direction` direction.
---
---See [`ActivatePaneDirection`](https://wezterm.org/config/lua/keyassignment/ActivatePaneDirection.html) for more information
---about how panes are selected given direction.
---
---@param direction "Down"|"Left"|"Next"|"Prev"|"Right"|"Up"
---@return Pane adjacent_pane
function M:get_pane_direction(direction) end

---Returns the overall size of the tab,
---taking into account all of the contained panes.
---
---See:
--- - [`MuxSize`](lua://MuxSize)
---
---@return MuxSize size
function M:get_size() end

---Returns the tab title as set by
---[`MuxTab:set_title()`](lua://MuxTab.set_title).
---
---@return string title
function M:get_title() end

---Returns an array table containing the set of
---[`Pane`](lua://Pane) objects
---contained by this tab.
---
---@return Pane[] panes
function M:panes() end

---Returns an array table containing an extended info entry
---for each of the panes contained by this tab.
---
---See:
--- - [`MuxTab.PaneInfo`](lua://MuxTab.PaneInfo)
---
---@return MuxTab.PaneInfo[] info_panes
function M:panes_with_info() end

---Rotates the panes in the clockwise direction.
---
function M:rotate_clockwise() end

---Rotates the panes in the counter-clockwise direction.
---
function M:rotate_counter_clockwise() end

---Sets the tab title to the provided string.
---
---@param title string
function M:set_title(title) end

---Sets the zoomed state for the active pane
---within the current tab.
---
---A zoomed pane takes up all available space
---in the tab, hiding all other panes
---while it is zoomed.
---
--- - Switching its zoom state off will restore the prior split arrangement
--- - Setting the zoom state to `true` zooms the pane if it wasn't already zoomed
--- - Setting the zoom state to `false` un-zooms the pane if it was zoomed
---
---Returns the prior zoom state.
---
---@param state boolean
---@return boolean previous_state
function M:set_zoomed(state) end

---Returns the tab ID.
---
---@return integer id
function M:tab_id() end

---Returns the `MuxWindow` bject that contains this tab.
---
---@return MuxWindow window
function M:window() end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
