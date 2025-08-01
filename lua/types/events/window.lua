---@meta

-- The `"augment-command-palette"` event is emitted when
-- the `Command Palette` is shown.
--
-- Its purpose is to enable you to add additional entries
-- to the list of commands shown in the palette.
--
-- This hook is synchronous; calling asynchronous functions will not succeed.
--
-- The return value is a `AugmentCommandPaletteReturn` table
---@see AugmentCommandPaletteReturn
---@alias AugmentCommandPalette "augment-command-palette"

-- The `"bell"` event is emitted when the `ASCII BEL` sequence
-- is emitted to a pane in the window.
--
-- Defining an event handler doesn't alter wezterm's handling of the bell;
-- the event supplements it and allows you
-- to take additional action over the configured behavior.
---@see Event.Bell
---@alias Bell "bell"

-- The `"format-tab-title"` event is emitted when the text for a tab title
-- needs to be recomputed.
--
-- This event is a bit special in that it is synchronous and must return
-- as quickly as possible in order to avoid blocking the GUI thread.
--
-- The most notable consequence of this is that some functions that are asynchronous
-- (e.g. `wezterm.run_child_process()`) are not possible to call
-- from inside the event handler and will generate a
-- `format-tab-title: runtime error: attempt to yield from outside a coroutine` error
---@alias FormatTabTitle "format-tab-title"

-- The `"format-window-title"` event is emitted when the text for the window title
-- needs to be recomputed.
--
-- This event is a bit special in that it is synchronous and must return
-- as quickly as possible in order to avoid blocking the GUI thread.
--
-- The most notable consequence of this is that some functions that are asynchronous
-- (e.g. `wezterm.run_child_process()`) are not possible to call
-- from inside the event handler and will generate a
-- `format-window-title: runtime error: attempt to yield from outside a coroutine` error
---@alias FormatWindowTitle "format-window-title"

-- The `"new-tab-button-click"` event is emitted when the user clicks on the
-- `"new tab"` button in the tab bar.
--
-- This is the `+` button that is drawn to the right of the last tab
---@alias NewTabButtonClick "new-tab-button-click"

-- The `"open-uri"` event is emitted when
-- the `CompleteSelectionOrOpenLinkAtMouseCursor` key/mouse assignment is triggered.
--
-- The default action is to open the active URI in your browser,
-- but if you register for this event you can co-opt the default behavior
---@alias OpenUri "open-uri"

-- ## WARNING
--
-- This event is considered to be deprecated and you should migrate to using `"update-status"`,
-- which behaves the same way, but doesn't overly focus on the right status area.
--
-- ---
--
-- The `"update-right-status"` event is emitted periodically
-- (based on the interval specified by the status_update_interval configuration value)
---@deprecated
---@alias UpdateRightStatus "update-right-status"

-- The `"update-status"` event is emitted periodically
-- (based on the interval specified by the status_update_interval configuration value)
---@alias UpdateStatus "update-status"

-- The `"user-var-changed"` event is emitted when a _user var escape sequence_
-- is used to set a user var
---@alias UserVarChanged "user-var-changed"

-- The `"window-config-reloaded"` event is emitted when the configuration for
-- a window has been reloaded.
--
-- This can occur when the configuration file is detected as changed
-- (when `Config.automatically_reload_config` is enabled),
-- when the configuration is explicitly reloaded via the `ReloadConfiguration` key action,
-- and when `Window:set_config_overrides()` is called for the window
---@alias WindowConfigReloaded "window-config-reloaded"

-- The `"window-focus-changed"` event is emitted when the focus state for a window is changed
---@alias WindowFocusChanged "window-focus-changed"
-- The `"window-resized"` event is emitted when the window is resized
-- and when transitioning between full-screen and regular windowed mode.
--
-- The event is triggered asynchronously with respect to the potentially-ongoing
-- live resize operation. `wezterm` will coalesce the stream of multiple events
-- generated by a live resize such that there can be
-- a maximum of 1 event executing and 1 event buffered.
---@alias WindowResized "window-resized"

---@alias WindowEvent
---|AugmentCommandPalette
---|Bell
---|FormatTabTitle
---|FormatWindowTitle
---|NewTabButtonClick
---|OpenUri
---|UpdateRightStatus -- DEPRECATED
---|UpdateStatus
---|UserVarChanged
---|WindowConfigReloaded
---|WindowFocusChanged
---|WindowResized
