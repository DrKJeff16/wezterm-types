---@meta

---@class WindowDimensions
---@field pixel_width number
---@field pixel_height number
---@field dpi number
---@field is_full_screen boolean

---A `Window` object cannot be created in Lua code;
---it is typically passed to the user code via an event callback.
---It is a handle to a GUI `TermWindow` running
---in the wezterm process.
---
---@class Window
local M = {}

---A convenience accessor for returning the active pane
---in the active tab of the GUI window.
---
---This is similar to
---[`MuxWindow:active_pane()`](lua://MuxWindow.active_pane)
---but, because it operates at the GUI layer, it can return
---[`Pane`](lua://Pane) objects
---for special overlay panes that are not visible
---to the mux layer of the API.
---
---@param self Window
---@return Pane pane
function M:active_pane() end

---A convenience accessor for returning the active
---`tab` within the window.
---
---@param self Window
---@return MuxTab tab
function M:active_tab() end

---Returns the name of the active workspace.
---
---@param self Window
---@return string name
function M:active_workspace() end

---Returns either a string holding the current dead key
---or IME composition text, or `nil` if the input layer
---is not in a composition state.
---
---This is the same text that is shown
---at the cursor position when composing.
---
---@param self Window
---@return string|nil status
function M:composition_status() end

---Puts text into the specified clipboard.
---
---@param self Window
---@param text string
---@param target? "Clipboard"|"PrimarySelection"|"ClipboardAndPrimarySelection"
function M:copy_to_clipboard(text, target) end

---Returns the current event.
---
---For now this is only implemented for mouse events.
---
---@param self Window
---@return WindowEvent event
function M:current_event() end

---Returns a Lua table representing the effective configuration
---for the `Window`.
---
---The table is in the same format as that used to specify
---the config in the `wezterm.lua` file, but represents
---the fully-populated state of the configuration,
---including any CLI or per-window configuration overrides.
---
---Note that changing the config table will NOT change
---the effective window config; it's just
---a copy of that information.
---
---@param self Window
---@return Config effective_cfg
function M:effective_config() end

---Attempts to focus and activate the window.
---
---@param self Window
function M:focus() end

---Returns the appearance of the window environment.
---
---@param self Window
---@return ("Light"|"Dark"|"LightHighContrast"|"DarkHighContrast") appearance
function M:get_appearance() end

---Returns a copy of the current set of configuration overrides
---that is in effect for the window.
---
---For examples, see:
--- - [`set_config_overrides`](lua://Window.set_config_overrides)
---
---@param self Window
---@return Config config
function M:get_config_overrides() end

---Returns a Lua table representing the dimensions for the `Window`.
---
---@param self Window
---@return WindowDimensions dimensions
function M:get_dimensions() end

---Returns the text that is currently selected
---within the specified pane, within the specified window
---formatted with the escape sequences
---necessary to reproduce the same colors and styling.
---
---This is the same text that
---[`window:get_selection_text_for_pane()`](lua://Window.get_selection_text_for_pane)
---would return, except that it includes escape sequences.
---
---@param self Window
---@return string text
function M:get_selection_escapes_for_pane() end

---Returns the text that is currently selected
---within the specified pane, within the specified window.
---
---This is the same text that would be copied to the clipboard
---if the `CopyTo` action were to be performed.
---
---@param self Window
---@return string text
function M:get_selection_text_for_pane() end

---Returns `true` if the window has focus.
---
---The `"update-status"` event is fired when
---the focus state changes.
---
---@param self Window
---@return boolean focused
function M:is_focused() end

---Returns two values; the keyboard `modifiers`
---and the key status `leds`.
---
---Note that macOS doesn't have a num lock concept.
---
---@param self Window
---@return string mods
---@return "CAPS_LOCK"|"NUM_LOCK"|"CAPS_LOCK|NUM_LOCK" leds
function M:keyboard_modifiers() end

---Returns `true` if the Leader Key is active in the window,
---or `false` otherwise.
---
---@param self Window
---@return boolean active
function M:leader_is_active() end

---Puts the window into the maximized state.
---
---To return to the normal/non-maximized state
---use [`window:restore()`](lua://Window.restore).
---
---@param self Window
function M:maximize() end

---Returns the
---[`MuxWindow`](lua://MuxWindow)
---representation of this window.
---
---@param self Window
---@return MuxWindow mux_win
function M:mux_window() end

---Performs a key assignment against the window and pane.
---There are a number of actions that can be performed
---against a pane in a window when configured via the keys
---and mouse configuration options.
---
---@param self Window
---@param key_assignment Action
---@param pane Pane
function M:perform_action(key_assignment, pane) end

---Restores the window from the maximized state.
---
---See [`Window:maximize()`](lua://Window.maximize).
---
---@param self Window
function M:restore() end

---Changes the set of configuration overrides for the window.
---
---The config file is re-evaLuated and any CLI overrides are applied,
---followed by the keys and values from the overrides parameter.
---This can be used to override configuration on a per-window basis;
---this is only useful for options that apply to the GUI window,
---such as rendering the GUI.
---
---Each call to `window:set_config_overrides()` will emit
---the `"window-config-reloaded"` event for the window.
---
---If you are calling this method from inside the handler
---for `"window-config-reloaded"` you should take care to
---only call `window:set_config_overrides()` if the actual
---override values have changed to avoid a loop.
---
---@param self Window
---@param overrides Config
function M:set_config_overrides(overrides) end

---Resizes the inner portion of the window
---(excluding any window decorations)
---to the specified width and height.
---
---@param self Window
---@param width number
---@param height number
function M:set_inner_size(width, height) end

---This method can be used to change the content
---that is displayed in the tab bar, to the left of
---the tabs and new tab button.
---
---The content is left-aligned and will be clipped
---from the right edge to fit in the available space.
---
---The parameter is a string that can contain
---escape sequences that change presentation.
---To compose the string, it is recommended that you use
---[`wezterm.format()`](lua://Wezterm.format).
---
---@param self Window
---@param str string
function M:set_left_status(str) end

---Repositions the top-left corner of the window
---to the specified `x` and `y` coordinates.
---
---Note that Wayland does not allow applications to directly control
---their window placement, so this method has no effect on Wayland.
---
---@param self Window
---@param x number
---@param y number
function M:set_position(x, y) end

---This method can be used to change the content
---that is displayed in the tab bar, to the right of
---the tabs and new tab button.
---
---The content is right-aligned and will be clipped
---from the left edge to fit in the available space.
---
---The parameter is a string that can contain
---escape sequences that change presentation.
---
---To compose the string, it is recommended that you use
---[`wezterm.format()`](lua://Wezterm.format).
---
---@param self Window
---@param str string
function M:set_right_status(str) end

---Generates a desktop "toast notification" with
---the specified `title` and `message`.
---
---An optional `url` parameter can be provided;
---clicking on the notification will open that URL.
---
---An optional `timeout` parameter can be provided;
---if so, it specifies how long the notification will remain
---prominently displayed in milliseconds.
---
---To specify a `timeout` without specifying a `url`,
---set the `url` parameter to `nil`.
---
---The timeout you specify may not be respected by the system,
---particularly in X11/Wayland environments, and Windows will always use
---a fixed, unspecified, duration.
---
---The notification will persist on screen until dismissed or clicked,
---or until its timeout duration elapses.
---
---@param self Window
---@param title string
---@param message string
---@param url? string|nil
---@param timeout? integer
function M:toast_notification(title, message, url, timeout) end

---Toggles full screen mode for the window.
---
---@param self Window
function M:toggle_fullscreen() end

---Returns the ID number for the window.
---
---The ID is used to identify the window within
---the internal multiplexer and can be used
---when making API calls via wezterm CLI
---to indicate the subject of manipulation.
---
---@param self Window
---@return integer id
function M:window_id() end

---Returns a string holding the top of the current key table activation stack,
---or `nil` if the stack is empty.
---
---See [Key Tables](https://wezterm.org/config/key-tables.html) for a detailed example.
---
---@param self Window
---@return string? stack
function M:active_key_table() end
