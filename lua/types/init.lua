---@meta

---@module "types.config"
---@module "types.enum"
---@module "types.events"
---@module "types.objects"
---@module "types.wezterm"

-- Alias to help identify types that should actually be any
---@alias ANY any

---@alias FormatItem.UnderlineStyle
---|"None"
---|"Single"
---|"Double"
---|"Curly"
---|"Dotted"
---|"Dashed"

---@alias FormatItem.Intensity
---|"Normal"
---|"Bold"
---|"Half"

---@alias FormatItemAttribute
---|{ Underline: FormatItem.UnderlineStyle }
---|{ Intensity: FormatItem.Intensity }
---|{ Italic: bool }

-- Reset all attributes to default
---@alias FormatItemReset "ResetAttributes"

---@alias FormatItem
---|FormatItemReset
---|{ Attribute: FormatItemAttribute }
---|{ Foreground: ColorSpec }
---|{ Background: ColorSpec }
---|{ Text: string }

---@alias CopyToTarget
---|"Clipboard"
---|"PrimarySelection"
---|"ClipboardAndPrimarySelection"

---@alias SshBackend
---|"Ssh2"
---|"LibSsh"

-- This is a virtual modifier used by wezterm
---@alias Modifiers
---|"ALT"
---|"CTRL"
---|"ENHANCED_KEY"
---|"LEADER"
---|"LEFT_ALT"
---|"LEFT_CTRL"
---|"LEFT_SHIFT"
---|"NONE"
---|"RIGHT_ALT"
---|"RIGHT_CTRL"
---|"RIGHT_SHIFT"
---|"SHIFT"
---|"SUPER"

---@alias WebGpuPowerPreference
---|"LowPower"
---|"HighPerformance"

-- Only Option
---@alias FontRasterizerSelection "FreeType"

---@alias FontShaperSelection
---|"Allsorts" very preliminary support
---|"Harfbuzz" default

---@alias FontLocatorSelection
---|"FontConfig" Use fontconfig APIs to resolve fonts (!macos, posix systems)
---|"Gdi" Use GDI on win32 systems
---|"CoreText" Use CoreText on macOS
---|"ConfigDirsOnly" Use only the font_dirs configuration to locate fonts

---@alias FrontEndSelection
---|"OpenGL"
---|"WebGpu" default
---|"Software"

---@alias DisplayPixelGeometry
---|"RGB" default
---|"BGR"

---@alias BatteryState
---|"Charging"
---|"Discharging"
---|"Empty"
---|"Full"
---|"Unknown"

-- 32-bit floating point number
---@alias f32 number
-- 64-bit floating point number
---@alias f64 number

-- 8-bit unsigned integer
---@alias u8 integer
-- 16-bit unsigned integer
---@alias u16 integer
-- 32-bit unsigned integer
---@alias u32 integer
-- 64-bit unsigned integer
---@alias u64 integer

-- 64-bit signed integer
---@alias i64 integer

---@alias Duration u64

---@alias usize number

---@alias Regex string

---@alias RgbColor string
--
---@alias RgbaColor string

---@alias bool boolean

---@alias BoldBrightening
---|"No"
---|"BrightAndBold"
---|"BrightOnly"

-- TODO: describe
---@alias ExitBehavior
---|"Close"
---|"CloseOnCleanExit"
---|"Hold"

-- TODO: describe
---@alias ExitBehaviorMessaging
---|"Verbose"
---|"Brief"
---|"Terse"
---|"None"

---@alias IntegratedTitleButton
---|"Hide"
---|"Maximize"
---|"Close"

---@alias IntegratedTitleButtonAlignment
---|"Right"
---|"Left"

---@alias IntegratedTitleButtonStyle
---|"Windows"
---|"Gnome"
---|"MacOsNative"

-- Configures whether the window has a title bar and/or resizable border.
--
-- The value is a set of flags:
--
--   - `"NONE"`: disables titlebar and border (borderless mode),
--               but causes problems with resizing and minimizing the window,
--               so you probably want to use `"RESIZE"` instead of `"NONE"`
--               if you just want to remove the title bar
--   - `"TITLE"`: disable the resizable border and enable only the title bar
--   - `"RESIZE"`: disable the title bar but enable the resizable border
--   - `"TITLE|RESIZE"`: Enable titlebar and border. This is the default
--   - `"INTEGRATED_BUTTONS|RESIZE"`: place window management buttons (minimize, maximize, close)
--                                      into the tab bar instead of showing a title bar
--   - `"MACOS_FORCE_DISABLE_SHADOW"`: (macOS only) disable the window shadow effect
--   - `"MACOS_FORCE_ENABLE_SHADOW"`: (macOS only) enable the window shadow effect
--   - `"MACOS_FORCE_SQUARE_CORNERS"`: (macOS only) force the window to have square
--                                     rather than rounded corners.
--                                     It is not compatible with `"TITLE"` or `"INTEGRATED_BUTTONS"`
--   - `"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"`: (macOS only) change the system titlebar background color
--                                                       to match the terminal background color defined
--                                                       by your configuration.
--                                                       This option doesn't make sense to use without
--                                                       also including `"TITLE|RESIZE"` in the set of decorations
--
---@alias WindowDecorations
---|"NONE"
---|"TITLE"
---|"RESIZE"
---|"MACOS_FORCE_DISABLE_SHADOW"
---|"MACOS_FORCE_ENABLE_SHADOW"
---|"MACOS_FORCE_SQUARE_CORNERS"
---|"TITLE|RESIZE"
---|"TITLE|MACOS_FORCE_DISABLE_SHADOW"
---|"TITLE|MACOS_FORCE_ENABLE_SHADOW"
---|"RESIZE|INTEGRATED_BUTTONS"
---|"RESIZE|MACOS_FORCE_DISABLE_SHADOW"
---|"RESIZE|MACOS_FORCE_ENABLE_SHADOW"
---|"RESIZE|MACOS_FORCE_SQUARE_CORNERS"
---|"TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"
---|"TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
---|"TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
---|"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
---|"RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
---|"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"
---|"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"
---|"TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
---|string
-- Add other valid combinations if needed

-- A value expressed in points, where 72 points == 1 inch
---@alias Points string

-- A value expressed in raw pixels
---@alias Pixels string|number

-- A value expressed in terms of a fraction of the maximum
-- value in the same direction.
-- For example, left padding of 10% depends on
-- the pixel width of that element.
-- The value is 1.0 == 100%.
-- It is possible to express e.g. 2.0 for 200%
---@alias Percent string

-- A value expressed in terms of a fraction of the cell
-- size computed from the configured font size.
-- 1.0 == the cell size
---@alias Cells string

---@alias Dimension
---|Points
---|Pixels
---|Percent
---|Cells

---@alias TabBarIntensity
---|"Normal"
---|"Half"
---|"Bold"

---@alias TabBarUnderline
---|"None"
---|"Single"
---|"Double"

---@alias PaletteAnsi
---|"black"
---|"maroon"
---|"green"
---|"olive"
---|"navy"
---|"purple"
---|"teal"
---|"silver"

---@alias PaletteBrights
---|"grey"
---|"red"
---|"lime"
---|"yellow"
---|"blue"
---|"fuchsia"
---|"aqua"
---|"white"

---@alias AnsiColor
---|"Black"
---|"Maroon"
---|"Green"
---|"Olive"
---|"Navy"
---|"Purple"
---|"Teal"
---|"Silver"
---|"Grey"
---|"Red"
---|"Lime"
---|"Yellow"
---|"Blue"
---|"Fuchsia"
---|"Aqua"
---|"White"

---@class TabBarColor
-- The color of the background area for the tab
---@field bg_color? string
-- The color of the text for the tab
---@field fg_color? string
-- Specify whether you want `"Half"`, `"Normal"` or `"Bold"` intensity for the
-- label shown for this tab.
--
-- The default is `"Normal"`
---@field intensity? TabBarIntensity
-- Specify whether you want `"None"`, `"Single"` or `"Double"` underline for
-- label shown for this tab.
--
-- The default is `"None"`
---@field underline? TabBarUnderline
-- Specify whether you want the text to be italic for this tab.
--
-- The default is `false`
---@field italic? bool
-- Specify whether you want the text to be rendered with strikethrough (true)
-- or not for this tab.
--
-- The default is `false`
---@field strikethrough? bool

---@class TabBarColors
-- The text color to use when the attributes are reset to default
---@field background? string
---@field inactive_tab_edge? string
---@field inactive_tab_edge_hover? string

-- Configure the color and styling for the tab bar
---@class TabBar: TabBarColors
-- The color of the strip that goes along the top of the window
-- (does not apply when fancy tab bar is in use)
---@field background string
-- The active tab is the one that has focus in the window
---@field active_tab TabBarColor
-- Inactive tabs are the tabs that do not have focus
---@field inactive_tab TabBarColor
-- You can configure some alternate styling when the mouse pointer
-- moves over inactive tabs
---@field inactive_tab_hover TabBarColor
-- The new tab button that let you create new tabs
---@field new_tab TabBarColor
-- You can configure some alternate styling when the mouse pointer
-- moves over the new tab button
---@field new_tab_hover TabBarColor

---@alias AC "AnsiColor"

---@alias CO "Color"

---@alias ColorSpec table<AC, AnsiColor>|table<CO, string>

---@class Palette
-- The text color to use when the attributes are reset to default
---@field foreground? string
--  The background color to use when the attributes are reset to default
---@field background? string
-- The foreground color of the cursor
---@field cursor_fg? string
-- The background color of the cursor
---@field cursor_bg? string
-- The border of the cursor
---@field cursor_border? string
-- The foreground color of selected text
---@field selection_fg? string
-- The background color of selected text
---@field selection_bg? string
-- A list of 8 colors corresponding to the basic ANSI palette
---@field ansi? table<integer, PaletteAnsi>
-- A list of 8 colors corresponding to the brights
---@field brights? table<integer, PaletteBrights>
-- A map for setting arbitrary colors ranging from 16 to 256 in the color palette
---@field indexed? string[]|table
-- The color of the "thumb" of the scrollbar; the segment that represents the current viewable area
---@field scrollbar_thumb? string
-- The color of the split line between panes
---@field split? string
-- The color of the visual bell.
-- If unspecified, the foreground color is used instead
---@field visual_bell? string
-- The color to use for the cursor when a dead key or leader state is active
---@field compose_cursor? string
-- Use `AnsiColor` to specify one of the ansi color palette values
-- (index 0-15) using one of the following values:
--
-- - `"Black"`
-- - `"Maroon"`
-- - `"Green"`
-- - `"Olive"`
-- - `"Navy"`
-- - `"Purple"`
-- - `"Teal"`
-- - `"Silver"`
-- - `"Grey"`
-- - `"Red"`
-- - `"Lime"`
-- - `"Yellow"`
-- - `"Blue"`
-- - `"Fuchsia"`
-- - `"Aqua"`
-- - `"White"`
---@field copy_mode_active_highlight_fg? ColorSpec
-- Colors for copy_mode and quick_select.
--
-- In copy_mode, the color of the active text is:
-- 1. `copy_mode_active_highlight` if additional text was selected using the mouse
-- 2. `selection` otherwise
---@field copy_mode_active_highlight_bg? ColorSpec
-- Use `AnsiColor` to specify one of the ansi color palette values
-- (index 0-15) using one of the following values:
--
-- - `"Black"`
-- - `"Maroon"`
-- - `"Green"`
-- - `"Olive"`
-- - `"Navy"`
-- - `"Purple"`
-- - `"Teal"`
-- - `"Silver"`
-- - `"Grey"`
-- - `"Red"`
-- - `"Lime"`
-- - `"Yellow"`
-- - `"Blue"`
-- - `"Fuchsia"`
-- - `"Aqua"`
-- - `"White"`
---@field copy_mode_inactive_highlight_fg? ColorSpec
-- Colors for copy_mode and quick_select.
--
-- In copy_mode, the color of the active text is:
-- 1. `copy_mode_active_highlight` if additional text was selected using the mouse
-- 2. `selection` otherwise
---@field copy_mode_inactive_highlight_bg? ColorSpec
---@field quick_select_label_fg? ColorSpec
---@field quick_select_label_bg? ColorSpec
---@field quick_select_match_fg? ColorSpec
---@field quick_select_match_bg? ColorSpec
---@field input_selector_label_fg? ColorSpec
---@field input_selector_label_bg? ColorSpec
---@field launcher_label_bg? ColorSpec
---@field launcher_label_fg? ColorSpec
---@field tab_bar? TabBar

---@alias FontWeight
---|"Regular"
---|"Black"
---|"Bold"
---|"Book"
---|"DemiBold"
---|"DemiLight"
---|"ExtraBlack"
---|"ExtraBold"
---|"ExtraLight"
---|"Light"
---|"Medium"
---|"Thin"

---@alias FontStretch
---|"Normal"
---|"Condensed"
---|"Expanded"
---|"ExtraCondensed"
---|"ExtraExpanded"
---|"SemiCondensed"
---|"SemiExpanded"
---|"UltraCondensed"
---|"UltraExpanded"

---@alias FontStyle
---|"Normal"
---|"Italic"
---|"Oblique"

---@alias FreeTypeLoadTarget
---|"Normal"
---|"HorizontalLcd"
---|"Light"
---|"Mono"
---|"VerticalLcd"

---@alias FreeTypeLoadFlags
---|"DEFAUlT"
---|"NO_HINTING"
---|"NO_BITMAP"
---|"FORCE_AUTOHINT"
---|"MONOCHROME"
---|"NO_AUTOHINT"

-- TODO: Find out what do the undocumented options do
---@alias HarfbuzzFeatures
---|"calt=0"
---|"clig=0"
---|"liga=0"
---|"calt=1"
---|"clig=1"
---|"liga=1"
---|"zero" -- `0`
---|"onum" -- numbers
---|"cv01"
---|"cv02"
---|"cv03"
---|"cv04"
---|"cv05"
---|"cv06"
---|"cv07"
---|"cv08"
---|"cv09"
---|"cv10"
---|"cv11" -- numbers
---|"cv12" -- numbers
---|"cv13" -- numbers
---|"cv14" -- numbers
---|"cv15" -- `*`
---|"cv16" -- `*`
---|"cv17" -- `~`
---|"cv18" -- `%`
---|"cv19" -- `<=`
---|"cv20" -- `<=`
---|"cv21"
---|"cv22"
---|"cv23" -- `>=`
---|"cv24" -- `/=`
---|"cv25" -- `.-`
---|"cv26" -- `:-`
---|"cv27" -- `[]`
---|"cv28" -- `{. .}`
---|"cv29" -- `{}`
---|"cv30" -- `|`
---|"cv31" -- `()`
---|"cv32" -- `.=`
---|"ss01"
---|"ss02" -- `<=`, `>=`
---|"ss03" -- `&`
---|"ss04" -- `$`
---|"ss05" -- `@`
---|"ss06" -- `\\`
---|"ss07" -- `=~`, `!~`
---|"ss08" -- `==`, `===`, `!=`, `!==`
---|"ss09" -- `>>=`, `<<=`, `||=`, `|=`
---|"ss10"

---@class FontAttributes
-- Whether the font should be a bold variant
---@field weight? FontWeight
---@field stretch? FontStretch
-- Whether the font should be an italic variant
---@field style? FontStyle
---@field is_fallback? bool
---@field is_synthetic? bool
---@field scale? number

-- `FontAttributes`-like class but with font family specified
---@class FontFamilyAttributes: FontAttributes
---@field family string

---@class FontFamilyExtendedAttributes: FontFamilyAttributes
---@field harfbuzz_features? HarfbuzzFeatures[]
---@field freetype_load_target? FreeTypeLoadTarget
---@field freetype_render_target? FreeTypeLoadTarget
-- you can combine the flags like `"NO_HINTING|MONOCHROME"`
-- **(you probably wouldn't want to do this)**
---@field freetype_load_flags? FreeTypeLoadFlags
---@field assume_emoji_presentation? bool

---@class Fonts
---@field fonts FontAttributes[]

---@class WindowFrameConfig
---@field inactive_titlebar_bg? RgbColor
---@field active_titlebar_bg? RgbColor
---@field inactive_titlebar_fg? RgbColor
---@field active_titlebar_fg? RgbColor
---@field inactive_titlebar_border_bottom? RgbColor
---@field active_titlebar_border_bottom? RgbColor
---@field button_fg? RgbColor
---@field button_bg? RgbColor
---@field button_hover_fg? RgbColor
---@field button_hover_bg? RgbColor
---@field border_left_width? Dimension
---@field border_right_width? Dimension
---@field border_top_height? Dimension
---@field border_bottom_height? Dimension
---@field border_left_color? RgbaColor
---@field border_right_color? RgbaColor
---@field border_top_color? RgbaColor
---@field border_bottom_color? RgbaColor

---@class TabBarStyle
---@field new_tab? string
---@field new_tab_hover? string
---@field window_hide? string
---@field window_hide_hover? string
---@field window_maximize? string
---@field window_maximize_hover? string
---@field window_close? string
---@field window_close_hover? string

---@class HyperlinkRule
---@field regex? Regex
---@field format? string
---@field highlight? usize

---@class SerialDomain
-- The name of this specific domain.
-- Must be unique amongst all types of domain in the configuration file
---@field name string
-- Specifies the serial device name.
--
-- - On Windows systems this can be a name like `COM0`
-- - On POSIX systems this will be something like `/dev/ttyUSB0`
-- - If omitted, the name will be interpreted as the port
---@field port string
-- Set the baud rate.
--
-- The default is `9600` baud
---@field baud usize|9600

---@class GpuInfo
---@field name string
---@field device_type string
---@field backend string
---@field driver string
---@field driver_info string
---@field vendor u32
---@field device u32

---@class UnixDomain
-- The name of this specific domain.
-- Must be unique amongst all types of domain in the configuration file
---@field name string
-- The path to the socket.
-- If unspecified, a resonable default value will be computed
---@field socket_path PathBuf
-- If `true`, connect to this domain automatically at startup
---@field connect_automatically bool
-- If `true`, do not attempt to start this server if we try and fail to
-- connect to it.
---@field no_serve_automatically bool
-- If we decide that we need to start the server, the command to run
-- to set that up.
--
-- The default is to spawn:
--
-- ```sh
-- wezterm-mux-server --daemonize
-- ```
--
-- To start up a UNIX domain inside a WSL container:
--
-- ```sh
-- wsl -e wezterm-mux-server --daemonize
-- ```
---@field serve_command string[]
-- Instead of directly connecting to `socket_path`
-- spawn this command and use its stdin/stdout in place of
-- the socket
---@field proxy_command string[]
-- If `true`, bypass checking for secure ownership of the socket_path.
--
-- This is not recommended on a multi-user system,
-- but is useful, for example, when running the server inside a WSL container
-- but with the socket on the host NTFS volume
---@field skip_permissions_check bool
---@field read_timeout Duration
-- Don"t use `default_local_echo_threshold_ms()` here to disable
-- the predictive echo for UNIX domains by default
---@field write_timeout Duration
-- Show time since last response when waiting for a response.
--
-- Recommended to look at this:
-- `https://wezfurlong.org/wezterm/config/lua/pane/get_metadata.html#since_last_response_ms`
---@field local_echo_threshold_ms u64
---@field overlay_lag_indicator bool

---@class LeaderKey: KeyNoAction
---@field timeout_milliseconds? u64

---@class HyperLinkRule
-- The regular expression to match
---@field regex string
-- Controls which parts of the regex match will be used to form the link.
--
-- Must have a prefix: signaling the protocol type (e.g., `https:/mailto:`),
-- which can either come from the regex match or needs to be explicitly added.
--
-- The format string can use placeholders like `$0`, `$1`, `$2` etc.
-- that will be replaced with that numbered capture group.
-- So, `$0` will take the entire region of text matched by the whole regex,
-- while `$1` matches out the first capture group.
---@field format string
-- Specifies the range of the matched text that should be highlighted/underlined
-- when the mouse hovers over the link.
--
-- The value is a number that corresponds to a capture group in the regex.
--
-- The default is `0`, highlighting the entire region of text matched by the regex.
-- `1` would be the first capture group, and so on...
---@field highlight? number

---@class BatteryInfo
-- The battery level expressed as a number between `0.0` (empty) and `1.0` (full)
---@field state_of_charge number
-- If known, shows battery manufacturer name or `"unknown"` otherwise
---@field vendor string
-- If known, shows the battery model string or `"unknown"` otherwise
---@field model string
-- If known, shows the battery serial number or `"unknown"` otherwise
---@field serial string
-- If charging, how long until the battery is full (in seconds)
---@field time_to_full? number
-- If discharing, how long until the battery is empty (in seconds)
---@field time_to_empty? number
---@field state BatteryState

---@class AugmentCommandPaletteReturn
-- The brief description for the entry
---@field brief string
-- A long description that may be shown after the entry, or that may be used in
-- future versions of wezterm to provide more information about the command
---@field doc? string
-- The action to take when the item is activated.
-- Can be any key assignment action
---@field action KeyAssignment
-- (Optional) Nerd Fonts glyph name to use for the icon for the entry.
---@see Wezterm.NerdFont for a list of icon names
---@field icon? Wezterm.NerdFont

-- - The first event parameter is a `Window` object that represents the GUI window
-- - The second event parameter is a `Pane` object that represents the pane in which
--   the bell was rung, which may not be active pane;
--   it could be in an unfocused pane or tab
---@alias CallbackWindowPane fun(window: Window, pane: Pane)

---@alias AugmentCallbackWindowPane fun(window: Window, pane: Pane): AugmentCommandPaletteReturn

-- This event is emitted when the Command Palette is shown.
--
-- Its purpose is to enable you to add additional entries to the list of commands shown in the palette.
--
-- This hook is synchronous; calling asynchronous functions will not succeed
---@alias Event.AugmentCommandPalette fun(event: AugmentCommandPalette, callback: AugmentCallbackWindowPane): AugmentCommandPaletteReturn): nil

-- - The first event parameter is a `Window` object that represents the GUI window
-- - The second event parameter is a `Pane` object that represents
--   the pane in which the bell was rung, which may not be active pane;
--   it could be in an unfocused pane or tab
---@alias Event.Bell fun(event: Bell, callback: CallbackWindowPane)

-- The parameters to the event are:
--
-- - `tab`: The `TabInformation` for the active tab
-- - `tabs`: An array containing `TabInformation` objects
--         for each of the tabs in the window
-- - `panes`: An array containing `PaneInformation` objects
--          for each of the panes in the active tab
-- - `config`: The effective configuration for the window
-- - `hover`: `true` if the current tab is in the hover state
-- - `max_width`: The maximum number of cells available
--              to draw this tab when using the retro tab bar style
--
-- The return value of the event can be:
--
-- - A string, holding the text to use for the tab title
-- - A `FormatItem` object as used in the `wezterm.format()` function.
--   This allows formatting style and color information
--   for individual elements within the tab
--
-- If the event encounters an error, or returns something that is not one of the types mentioned above,
-- then the default tab title text will be computed and used instead.
--
-- When the tab bar is computed, this event is called twice for each tab;
-- on the first pass, `hover` will be false and `max_width` will be set to `tab_max_width`.
-- WezTerm will then compute the tab widths that will fit in the tab bar,
-- and then call the event again for the set of tabs,
-- this time with appropriate hover and max_width values.
--
-- Only the first `"format-tab-title"` event will be executed;
-- it doesn't make sense to define multiple instances of the event
-- with `multiple wezterm.on("format-tab-title", ...)` calls
---@alias Event.FormatTabTitle fun(event: FormatTabTitle, callback: fun(tab: MuxTab, tabs: MuxTab[], panes: Pane[], config: Config, hover: bool, max_width: number): string|FormatItem)

-- The parameters to the event are:
--
-- - `tab`: The `TabInformation` object for the active tab
-- - `pane`: The `PaneInformation` object for the active pane
-- - `tabs`: An array containing TabInformation objects
--         for each of the tabs in the window
-- - `panes`: An array containing `PaneInformation` objects
--          for each of the panes in the active tab
-- - `config`: The effective configuration for the window
--
-- The return value of the event should be a `string`,
-- and if it is then it will be used as the title text in the window title bar.
--
-- If the event encounters an error, or returns something that is not a `string`,
-- then the default window title text will be computed and used instead.
--
-- Only the first `"format-window-title"` event will be executed;
-- it doesn't make sense to define multiple instances of the event
-- with multiple `wezterm.on("format-window-title", ...)` calls
---@alias Event.FormatWindowTitle fun(event: FormatWindowTitle, callback: fun(window: Window, pane: Pane, tabs: MuxTab[], panes: Pane[], config: Config): string)

-- - The first event parameter is a `Window` object that represents the GUI window
-- - The second event parameter is a `Pane` object that represents the active pane in the window
---@alias Event.NewTabButtonClick fun(event: NewTabButtonClick, callback: fun(window: Window, pane: Pane, button: "Left"|"Middle"|"Right", default_action: KeyAssignment))

-- - The first event parameter is a `Window` object that represents the GUI window
-- - The second event parameter is a `Pane` object that represents the pane
-- - The third event parameter is the URI string
---@alias Event.OpenUri fun(event: OpenUri, callback: fun(window: Window, pane: Pane, uri: string))

-- ## WARNING
--
-- This event is considered to be deprecated and you should migrate to using `"update-status"`,
-- which behaves the same way, but doesn't overly focus on the right status area.
--
-- ---
--
-- - The first event parameter is a `Window` object that represents the GUI window
-- - The second event parameter is a `Pane` object that represents the active pane in that window
--
-- There is no defined return value for the event,
-- but its purpose is to allow you the chance to carry out some activity
-- and then ultimately call `Window:set_right_status()'
--
-- WezTerm will ensure that only a single instance of this event is outstanding;
-- if the hook takes longer than the `status_update_interval` to complete,
-- `wezterm` won't schedule another call until `status_update_interval milliseconds`
-- have elapsed since the last call completed
---@deprecated
---@alias Event.UpdateRightStatus fun(event: UpdateRightStatus, callback: CallbackWindowPane)

-- - The first event parameter is a `Window` object that represents the GUI window
-- - The second event parameter is a `Pane` object that represents the active pane in that window
--
-- There is no defined return value for the event, but its purpose is
-- to allow you the chance to carry out some activity and then ultimately call either
-- `Window:set_right_status()` or `Window:set_left_status()`.
--
-- WezTerm will ensure that only a single instance of this event is outstanding;
-- if the hook takes longer than the `status_update_interval` to complete,
-- `wezterm` won't schedule another call until `status_update_interval milliseconds`
-- have elapsed since the last call completed
---@alias Event.UpdateStatus fun(event: UpdateStatus, callback: CallbackWindowPane)

-- You can use something like the following from your shell
-- to set the user var named foo to the value bar:
--
-- ```sh
-- printf "\033]1337;SetUserVar=%s=%s\007" foo `echo -n bar | base64`
-- ```
--
-- Then, if you have this in your config:
--
-- ```lua
-- local wezterm = require 'wezterm'
--
-- wezterm.on('user-var-changed', function(window, pane, name, value)
--   wezterm.log_info('var', name, value)
-- end)
--
-- return {}
-- ```
--
-- your event handler will be called with `name = 'foo'` and `value = 'bar'`.
--
-- See `Pane:get_user_vars()`
---@alias Event.UserVarChanged fun(event: UserVarChanged, callback: fun(window: Window, pane: Pane, name: string, value: string))

-- This event is _fire-and-forget_ from the perspective of wezterm;
-- it fires the event to advise of the config change, but has no other expectations.
--
-- If you call `Window:set_config_overrides()` from inside this event callback
-- then an additional window-config-reloaded event will be triggered.
-- You should take care to avoid creating a loop by only calling `Window:set_config_overrides()`
-- when the actual override values are changed.
--
-- - The first event parameter is a `Window` object that represents the GUI window
-- - The second event parameter is a `Pane` object that represents the active pane in that window
---@alias Event.WindowConfigReloaded fun(event: WindowConfigReloaded, callback: CallbackWindowPane)

-- This event is _fire-and-forget_ from the perspective of wezterm;
-- it fires the event to advise of the config change, but has no other expectations.
--
-- - The first event parameter is a `Window` object that represents the GUI window
-- - The second event parameter is a `Pane` object that represents the active pane in that window
---@alias Event.WindowFocusChanged fun(event: WindowFocusChanged, callback: CallbackWindowPane)

-- - The first event parameter is a `Window` object that represents the GUI window
-- - The second event parameter is a `Pane` object that represents the active pane in that window
---@alias Event.WindowResized fun(event: WindowResized, callback: CallbackWindowPane)

-- A custom declared function
---@alias Event.Custom fun(event: string, callback: fun(...: any))

---@alias Events
---|Event.AugmentCommandPalette
---|Event.Bell
---|Event.Custom
---|Event.FormatTabTitle
---|Event.FormatWindowTitle
---|Event.NewTabButtonClick
---|Event.OpenUri
---|Event.UpdateRightStatus -- DEPRECATED
---|Event.UpdateStatus
---|Event.UserVarChanged
---|Event.WindowConfigReloaded
---|Event.WindowFocusChanged
---|Event.WindowResized

---@alias CursorShape
---|"BlinkingBlock"
---|"BlinkingBar"
---|"BlinkingUnderline"
---|"SteadyBar"
---|"SteadyBlock"
---|"SteadyUnderline"

---@alias CursorVisibility
---|"Visible"
---|"Hidden"

---@class StableCursorPosition
-- The horizontal cell index
---@field x number
-- The vertical stable row index
---@field y number
-- The CursorShape enum value
---@field shape CursorShape
-- The CursorVisibility enum value
---@field visibility CursorVisibility

---@class LinearGradientOrientation
---@field angle number

---@class RadialGradientOrientation
---@field radius? number
---@field cx? number
---@field cy? number

---@alias GradientOrientation
---|"Horizontal"
---|"Vertical"
---|{ Linear: LinearGradientOrientation }
---|{ Radial: RadialGradientOrientation }

---@class Gradient
---@field colors string[]
---@field orientation? GradientOrientation
---@field interpolation? "Linear"|"Basis"|"CatmullRom"
---@field blend? "Rgb"|"LinearRgb"|"Hsv"|"Oklab"
---@field noise? number
---@field segment_size? number
---@field segment_smoothness? number

---@class ColorSchemeMetaData
---@field name? string
---@field author? string
---@field origin_url? string
---@field wezterm_version? string
---@field aliases? string[]

---@alias ActionCallback fun(win: Window, pane: Pane, ...: any): false?

-- - `"Light"`: The normal appearance, with dark text on a light background
-- - `"Dark"`: Dark mode with predominantly dark colors and probably a lighter,
--             lower contrasting, text color on a dark background
-- - `"LightHighContrast"`: Light mode but with high contrast colors (not reported on all systems)
-- - `"DarkHighContrast"`: Dark mode but with high contrast colors (not reported on all systems)
---@alias Appearance
---|"Dark"
---|"DarkHighContrast"
---|"Light"
---|"LightHighContrast"

---@alias Clipboard
---|"Clipboard"
---|"PrimarySelection"
---|"ClipboardAndPrimarySelection"

---@alias CopyMode
---|"AcceptPattern"
---|"ClearPattern"
---|"ClearSelectionMode"
---|"Close"
---|"CycleMatchType"
---|"EditPattern"
---|"MoveBackwardSemanticZone"
---|"MoveBackwardWord"
---|"MoveDown"
---|"MoveForwardSemanticZone"
---|"MoveForwardWord"
---|"MoveForwardWordEnd"
---|"MoveLeft"
---|"MoveRight"
---|"MoveToEndOfLineContent"
---|"MoveToScrollbackBottom"
---|"MoveToScrollbackTop"
---|"MoveToSelectionOtherEnd"
---|"MoveToSelectionOtherEndHoriz"
---|"MoveToStartOfLine"
---|"MoveToStartOfLineContent"
---|"MoveToStartOfNextLine"
---|"MoveToViewportBottom"
---|"MoveToViewportMiddle"
---|"MoveToViewportTop"
---|"MoveUp"
---|"NextMatch"
---|"NextMatchPage"
---|"PriorMatch"
---|"PriorMatchPage"
---|{ MoveBackwardSemanticZoneOfType: SemanticZoneType }
---|{ MoveForwardSemanticZoneOfType: SemanticZoneType }
---|{ SetSelectionMode: SelectionMode|"SemanticZone" }

---@alias CursorStyle
---|"BlinkingBlock"
---|"SteadyBlock"
---|"BlinkingUnderline"
---|"SteadyUnderline"
---|"BlinkingBar"
---|"SteadyBar"

---@alias Direction
---|"Left"
---|"Right"
---|"Up"
---|"Down"
---|"Next"
---|"Prev"

---@alias EasingFunction
---|"Constant"
---|"Ease"
---|"EaseIn"
---|"EaseInOut"
---|"EaseOut"
---|"Linear"
---|{ CubicBezier: number[] }

---@alias FreetypeLoadTarget
---|"Normal"
---|"HorizontalLcd"
---|"Light"
---|"Mono"

---@alias Stretch
---|"Normal"
---|"Condensed"
---|"Expanded"
---|"ExtraCondensed"
---|"ExtraExpanded"
---|"SemiCondensed"
---|"SemiExpanded"
---|"UltraCondensed"
---|"UltraExpanded"

---@alias Style
---|"Normal"
---|"Italic"
---|"Oblique"

---@alias Weight
---|"Regular"
---|"Black"
---|"Bold"
---|"Book"
---|"DemiBold"
---|"DemiLight"
---|"ExtraBlack"
---|"ExtraBold"
---|"ExtraLight"
---|"Light"
---|"Medium"
---|"Thin"

---@class ScreenInformation
---@field name string
---@field x number
---@field y number
---@field height number
---@field width number
---@field max_fps? number

---@class KeyBindingBase
---@field key string
---@field action Action

---@class KeyBinding: KeyBindingBase
---@field mods string

---@class MouseEventInfo
---@field streak number
---@field button "Left"|"Right"|"Middle"|{ WheelDown: number }|{ WheelUp: number }

---@class MouseDownEvent
---@field Down MouseEventInfo

---@class MouseUpEvent
---@field Up MouseEventInfo

---@class MouseDragEvent
---@field Drag MouseEventInfo

---@alias MouseEvent
---|MouseDownEvent
---|MouseDragEvent
---|MouseUpEvent

---@class MouseBindingBase
---@field event MouseEvent
---@field action Action
---@field mouse_reporting? bool
---@field alt_screen? bool|"Any"

---@class MouseBinding: MouseBindingBase
---@field mods string
