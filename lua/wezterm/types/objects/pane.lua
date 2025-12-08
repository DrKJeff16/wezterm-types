---@meta

---@class SpawnSplit: SpawnTab
---@field direction? "Right"|"Left"|"Top"|"Bottom"
---@field top_level? boolean
---@field size? number

---@class PaneMetadata
---A boolean value that is populated only for local panes.
---It is set to `true` if it appears as though the local PTY is configured
---for password entry (local echo disabled, canonical input mode enabled).
---
---@field password_input boolean
---A boolean value that is populated only for multiplexer client panes.
---It is set to `true` if wezterm is waiting for a response
---from the multiplexer server.
---
---This can be used in conjunction with:
--- - [`PaneMetaData.since_last_response_ms`](lua://PaneMetadata.since_last_response_ms)
---
---@field is_tardy boolean
---An integer value that is populated only for multiplexer client panes.
---It is set to the number of elapsed milliseconds since the most recent
---response from the multiplexer server.
---
---@field since_last_response_ms integer

---@class RenderableDimensions
---The number of columns.
---
---@field cols number
---The top of the physical non-scrollback screen expressed as a stable index.
---
---@field physical_top integer
---The total number of lines in the scrollback and viewport.
---
---@field scrollback_rows number
---The top of the scrollback; the earliest row remembered by wezterm.
---
---@field scrollback_top integer
---The number of vertical cells in the visible portion of the window.
---
---@field viewport_rows number

---A handle to a live instance of a Pane that is known to the wezterm process.
---
---It tracks the pseudo terminal (or real serial terminal) and
---associated process(es) and the parsed screen and scrollback.
---Also,it's typically passed to your code via an event callback.
---
---A `Pane` object can be used to send input to the associated processes
---and introspect the state of the terminal emulation for that pane.
---
---In previous releases there were separate `MuxPane` and `Pane` objects
---created by the mux and GUI layers, respectively.
---This is no longer the case: there is now just the underlying mux pane
---which is referred to in these docs as `Pane` for the sake of simplicity.
---
---@class Pane
local M = {}

---Activates (focuses) the pane and its containing tab.
---
---@param self Pane
function M:activate() end

---~Returns the current working directory of the pane, if known.~
---This method now returns a `Url` object which provides
---a convenient way to decode and operate on said URL.
---
--- ---
---
---The current directory can be specified
---by an application sending `OSC 7`.
---
---If `OSC 7` was never sent to a pane,
---and the pane represents a locally spawned process,
---then wezterm will:
---
--- - On UNIX systems: determie the process group leader attached to the PTY
--- - On Windows systems: use heuristics to infer an equivalent to the foreground process
---
---With the process identified, wezterm will then try to determine
---the current working directory using operating system dependent code.
---
---If the current working directory is not known then
---this method returns `nil`.
---Otherwise, it returns the current working directory
---as a `URL` string.
---
---Note that while the current working directory
---is usually a file path, it is possible for an application
---to set it to an FTP URL or some other kind of URL,
---which is why this method doesn't simply return a file path string
---
---@param self Pane
---@return Url|nil cwd
function M:get_current_working_dir() end

---Returns a Lua representation of the `StableCursorPosition` struct
---that identifies the cursor's position, visibility and shape.
---
---@param self Pane
---@return StableCursorPosition position
function M:get_cursor_position() end

---Returns a Lua representation of the `RenderableDimensions` struct
---that identifies the dimensions and position of the viewport
---as well as the scrollback for the pane.
---
---@param self Pane
---@return RenderableDimensions dimensions
function M:get_dimensions() end

---Returns the name of the domain with which the pane instance
---is associated to.
---
---@param self Pane
---@return string domain_name
function M:get_domain_name() end

---Returns a `LocalProcessInfo` object corresponding
---to the current foreground process that is running in the pane.
---
---This method has some restrictions and caveats:
---
--- - This information is only available for local panes.
---   Multiplexer panes do not report this information.
---   Similarly, if you are using eg: ssh to connect to a remote host,
---   you won't be able to access the name of the remote process
---   that is running
--- - On UNIX systems, the process group leader
---   (the foreground process) will be queried,
---   but that concept doesn't exist on Windows, so instead,
---   the process tree of the originally spawned program is examined,
---   and the most recently spawned descendant is assumed to be
---   the foreground process
--- - On Linux, macOS and Windows, the process can be queried
---   to determine this path.
---   Other operating systems (notably, FreeBSD and other UNIX systems)
---   are not currently supported
--- - Querying the path may fail for a variety of reasons outside of the control of WezTerm
--- - Querying process information has some runtime overhead,
---   which may cause wezterm to slow down if over-used
---
---If the process cannot be determined then this method returns `nil`.
---
---@param self Pane
---@return LocalProcessInfo|nil proc_info
function M:get_foreground_process_info() end

---Returns the path to the executable image for the pane.
---
---This method has some restrictions and caveats:
---
--- - This information is only available for local panes.
---   Multiplexer panes do not report this information.
---   Similarly, if you are using e.g. `ssh` to connect to a remote host,
---   you won't be able to access the name of
---   the remote process that is running
--- - On UNIX systems, the process group leader (the foreground process)
---   will be queried, but that concept doesn't exist on Windows, so instead,
---   the process tree of the originally spawned program is examined,
---   and the most recently spawned descendant is assumed to be
---   the foreground process
--- - On Linux, macOS and Windows, the process can be queried to determine this path.
---   Other operating systems (notably, FreeBSD and other UNIX systems)
---   are not currently supported
--- - Querying the path may fail for a variety of reasons outside of
---   the control of WezTerm
--- - Querying process information has some runtime overhead,
---   which may cause wezterm to slow down if over-used
---
---If the path is not known then this method returns `nil`.
---
---@param self Pane
---@return string|nil name
function M:get_foreground_process_name() end

---Returns the textual representation
---(including color and other attributes)
---of the physical lines of text in the viewport
---as a string with embedded ANSI escape sequences
---to preserve the color and style of the text.
---
---A physical line is a possibly-wrapped line that composes a row
---in the terminal display matrix.
---
---If the optional `nlines` argument is specified then
---it is used to determine how many lines of text
---should be retrieved.
---The default (if `nlines` is not specified) is
---to retrieve the number of lines in the viewport
---(the height of the pane).
---
---To obtain the entire scrollback, you can do something like this:
---
---```lua
---pane:get_lines_as_escapes(pane:get_dimensions().scrollback_rows)
---```
---
---@param self Pane
---@param nlines? integer
---@return string output
function M:get_lines_as_escapes(nlines) end

---Returns the textual representation
---(not including color or other attributes)
---of the physical lines of text in the viewport as a string.
---
---A physical line is a possibly-wrapped line that composes a row
---in the terminal display matrix.
---If you'd rather operate on logical lines,
---see `pane:get_logical_lines_as_text()`.
---
---If the optional `nlines` argument is specified
---then it is used to determine how many lines of text
---should be retrieved.
---The default (if `nlines` is not specified) is
---to retrieve the number of lines in the viewport
---(the height of the pane).
---
---The lines have trailing space removed from each line.
---They will be joined together in the returned string
---separated by a `\n` character.
---Trailing blank lines are stripped, which may result in
---fewer lines being returned
---than you might expect if the pane only had
---a couple of lines of output.
---
---@param self Pane
---@param nlines? integer
---@return string text
function M:get_lines_as_text(nlines) end

---Returns the textual representation (not including color or other attributes)
---of the logical lines of text in the viewport as a string.
---
---A logical line is an original input line prior to being wrapped into physical lines
---to composes rows in the terminal display matrix.
---WezTerm doesn't store logical lines, but can recompute them from metadata stored
---in physical lines.
---Excessively long logical lines are force-wrapped to constrain the cost of rewrapping
---on resize and selection operations.
---
---If you'd rather operate on physical lines, see `pane:get_lines_as_text()`.
---
---If the optional `nlines` argument is specified then it is used to determine
---how many lines of text should be retrieved.
---The default (if `nlines` is not specified) is to retrieve the number of lines
---in the viewport (the height of the pane).
---
---The lines have trailing space removed from each line.
---They will be joined together in the returned string separated by a `\n` character.
---Trailing blank lines are stripped, which may result in fewer lines being returned
---than you might expect if the pane only had a couple of lines of output.
---
---To obtain the entire scrollback, you can do something like this:
---
---```lua
---pane:get_logical_lines_as_text(pane:get_dimensions().scrollback_rows)
---```
---
---@param self Pane
---@param nlines? integer
---@return string text
function M:get_logical_lines_as_text(nlines) end

---Returns metadata about a pane.
---
---The return value depends on the instance of the underlying pane.
---If the pane doesn't support this method, `nil` will be returned.
---Otherwise, the value is a Lua table with the metadata
---contained in table fields.
---
---To consume this value, it is recommend to use logic like this
---to obtain a table value even if the pane doesn't
---support this method:
---
---```lua
---local meta = pane:get_metadata() or {}
---```
---
---@param self Pane
---@return PaneMetadata|nil metadata
function M:get_metadata() end

---Returns the progress state associated with the pane.
---
---By default, when the terminal is reset, the progress state
---will be `"None"` to indicate that
---no progress has been reported.
---
---@param self Pane
---@return string|"None" progress
function M:get_progress() end

---Resolves the semantic zone that encapsulates
---the supplied `x` and `y` coordinates.
---
---`x` is the cell column index, where `0` is the left-most column
---`y` is the stable row index
---
---Use `pane:get_dimensions()` to retrieve the
---currently valid stable index values
---for the top of scrollback and top of viewport.
---
---@param self Pane
---@param x integer
---@param y integer
---@return table zone
function M:get_semantic_zone_at(x, y) end

---When `zone_type` is omitted, returns the list of
---all semantic zones defined in the pane.
---
---When `zone_type` is supplied, returns the list of
---all semantic zones of the matching type.
---
---Valid values for `zone_type` are:
---
--- - `"Input"`
--- - `"Output"`
--- - `"Prompt"`
---
---@param self Pane
---@param zone_type? "Input"|"Output"|"Prompt"
---@return table zones
function M:get_semantic_zones(zone_type) end

---Returns the text from the specified region.
---
--- - `start_x` and `end_x` are the starting and ending cell column,
---   where `0` is the left-most cell
--- - `start_y` and `end_y` are the starting and ending row,
---   expressed as a stable row index
---
---Use `pane:get_dimensions()` to retrieve the currently valid
---stable index values for the top of scrollback and top of viewport
---
---The text within the region is unwrapped to its logical
---line representation, rather than the
---_wrapped-to-physical-display-width_.
---
---@param self Pane
---@param start_x integer
---@param start_y integer
---@param end_x integer
---@param end_y integer
---@return string text
function M:get_text_from_region(start_x, start_y, end_x, end_y) end

---This is a convenience method that calls
---`Pane:get_text_from_region()` on the supplied zone parameter.
---
---Use `Pane:get_semantic_zone_at()` or `Pane:get_semantic_zones()`
---to obtain a zone.
---
---@param self Pane
---@param zone table
---@return any text
function M:get_text_from_semantic_zone(zone) end

---Returns the title of the pane.
---
---This will typically be wezterm by default but
---can be modified by applications that send `OSC 1`
---(Icon/Tab title changing) and/or `OSC 2` (Window title changing)
---escape sequences.
---
---The value returned by this method is the same as that used to
---display the tab title if this pane were the only pane in the tab;
---if `OSC 1` was used to set a non-empty string then
---that string will be returned.
---Otherwise the value for `OSC 2` will be returned.
---
---Note that on Windows the default behavior of the OS level PTY
---is to implicitly send `OSC 2` sequences to the terminal
---as new programs attach to the console.
---
---If the title text is `"wezterm"` and the pane is a local pane,
---then wezterm will attempt to resolve the executable path
---of the foreground process that is associated with the pane
---and will use that instead of `wezterm`.
---
---@param self Pane
---@return string title
function M:get_title() end

---Returns the tty device name, or `nil` if the name is unavailable.
---
--- - This information is only available for local panes.
---   Multiplexer panes do not report this information.
---   Similarly, if you are using e.g. `ssh` to connect to a remote host,
---   you won't be able to access the name of the remote process
---   that is running
--- - This information is only available on UNIX systems.
---   Windows systems do not have an equivalent concept
---
---@param self Pane
---@return string|nil name
function M:get_tty_name() end

---Returns a table holding the user variables that have been
---assigned to this `Pane` instance.
---
---User variables are set using an escape sequence defined by `iterm2`,
---but also recognized by wezterm.
---
---@param self Pane
---@return table<string, string> env
function M:get_user_vars() end

---Returns `true` if there has been output in the pane
---since the last time the pane was focused.
---
---See also `PaneInformation.has_unseen_output` for an example
---using equivalent information to color tabs based on this state.
---
---@param self Pane
---@return boolean unseen
function M:has_unseen_output() end

---Sends text, which may include escape sequences,
---to the output side of the current pane.
---
---The text will be evaluated by the terminal emulator
---and can thus be used to inject/force the terminal
---to process escape sequences that adjust the current mode,
---as well as sending human readable output to the terminal.
---
---Note that if you move the cursor position as a result
---of using this method, you should expect the display to change
---and for text UI programs to get confused.
---
---@param self Pane
---@param text string
function M:inject_output(text) end

---Returns whether the alternate screen is active for the pane.
---
---The alternate screen is a secondary screen that is activated
---by certain escape codes.
---It has no scrollback, which makes it ideal for a "full-screen"
---terminal program (e.g. `vim` or `less`) to do whatever they want
---on the screen without fear of destroying the user's scrollback.
---Those programs emit escape codes to return to the normal screen
---when they exit.
---
---@param self Pane
---@return boolean active
function M:is_alt_screen_active() end

---Creates a new tab in the window that contains a pane,
---and moves the current pane into that tab.
---
---Returns a tuple of the newly created:
--- 1. [`MuxTab`](lua://MuxTab)
--- 2. [`MuxWindow`](MuxWindow)
---
---@param self Pane
---@return MuxTab tab
---@return MuxWindow window
function M:move_to_new_tab() end

---Creates a window and moves pane into that window.
---
---The `workspace` parameter is optional;
---if specified, it will be used as the name of the workspace
---that should be associated with the new window.
---Otherwise, the current active workspace will be used.
---
---Returns a tuple of the newly created:
--- 1. [`MuxTab`](lua://MuxTab)
--- 2. [`MuxWindow`](MuxWindow)
---
---@param self Pane
---@param workspace? string
---@return MuxTab tab
---@return MuxWindow window
function M:move_to_new_window(workspace) end

---Returns the id number for the pane.
---
---The Id is used to identify the pane within the internal multiplexer
---and can be used when making API calls via wezterm CLI
---to indicate the subject of manipulation.
---
---@param self Pane
---@return integer id
function M:pane_id() end

---Alias of `Pane:send_paste()` for backwards
---compatibility with prior releases.
---
---@param self Pane
---@param text string
function M:paste(text) end

---Sends the supplied text string to the input of the pane
---as if it were pasted from the clipboard,
---except that the clipboard is not involved.
---
---Newlines are rewritten according to:
--- - [`config.canonicalize_pasted_newlines`](lua://Config.canonicalize_pasted_newlines)
---
---If the terminal attached to the pane is set to bracketed paste mode
---then the text will be sent as a bracketed paste,
---and newlines will not be rewritten.
---
---@param self Pane
---@param text string
function M:send_paste(text) end

---Sends text to the pane as-is.
---
---@param self Pane
---@param text string
function M:send_text(text) end

---Splits the `Pane` instance and spawns a program into said split,
---returning the `Pane` object associated with it.
---
---When no arguments are passed, the pane is split in half left/right
---and the right half has the default program spawned into it.
---
---For available args, see:
--- - [`SpawnSplit`](lua://SpawnSplit)
---
---@param self Pane
---@param args? SpawnSplit
---@return Pane split_pane
function M:split(args) end

---Returns the `MuxTab` that contains this pane.
---
---Note that this method can return `nil` when the pane is
---a GUI-managed overlay pane (such as the debug overlay),
---because those panes are not managed by the mux layer.
---
---@param self Pane
---@return MuxTab? tab
function M:tab() end

---Returns
---the [`MuxWindow`](lua://MuxWindow)
---that contains the tab this pane is in.
---
---@param self Pane
---@return MuxWindow window
function M:window() end

-- vim:ts=4:sts=4:sw=4:et:ai:si:sta:
