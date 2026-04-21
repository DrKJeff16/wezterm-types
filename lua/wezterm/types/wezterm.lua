---@meta wezterm
---@diagnostic disable:unused-local

---@module "wezterm.types.config"
---@module "wezterm.types.events"
---@module "wezterm.types.harfbuzz"
---@module "wezterm.types.wezterm.color"
---@module "wezterm.types.wezterm.gui"
---@module "wezterm.types.wezterm.mux"
---@module "wezterm.types.wezterm.nerdfonts"
---@module "wezterm.types.wezterm.plugin"
---@module "wezterm.types.wezterm.procinfo"
---@module "wezterm.types.wezterm.serde"
---@module "wezterm.types.wezterm.time"
---@module "wezterm.types.wezterm.url"

---@module "wezterm.types.plugins.agent-deck"
---@module "wezterm.types.plugins.ai-commander"
---@module "wezterm.types.plugins.ai-helper"
---@module "wezterm.types.plugins.bar"
---@module "wezterm.types.plugins.battery"
---@module "wezterm.types.plugins.cmd-sender"
---@module "wezterm.types.plugins.dev"
---@module "wezterm.types.plugins.lib"
---@module "wezterm.types.plugins.listeners"
---@module "wezterm.types.plugins.modal"
---@module "wezterm.types.plugins.pinned-tabs"
---@module "wezterm.types.plugins.pivot-panes"
---@module "wezterm.types.plugins.presentation"
---@module "wezterm.types.plugins.quick-domains"
---@module "wezterm.types.plugins.quickselect"
---@module "wezterm.types.plugins.replay"
---@module "wezterm.types.plugins.resurrect"
---@module "wezterm.types.plugins.rosepine"
---@module "wezterm.types.plugins.sessionizer"
---@module "wezterm.types.plugins.smart-splits"
---@module "wezterm.types.plugins.smart-workspace-switcher"
---@module "wezterm.types.plugins.stack"
---@module "wezterm.types.plugins.tabline"
---@module "wezterm.types.plugins.tabsets"
---@module "wezterm.types.plugins.toggle-terminal"
---@module "wezterm.types.plugins.wez-pain-control"
---@module "wezterm.types.plugins.wezterm-config"
---@module "wezterm.types.plugins.wezterm-status"
---@module "wezterm.types.plugins.wezterm-tabs"
---@module "wezterm.types.plugins.wezterm-theme-rotator"
---@module "wezterm.types.plugins.wez-tmux"
---@module "wezterm.types.plugins.workspace-picker"
---@module "wezterm.types.plugins.workspacesionizer"
---@module "wezterm.types.plugins.wsinit"

---@alias ColorSpec { AnsiColor: AnsiColor }|{ Color: string }

---@enum (key) FormatItemAttribute.Underline
local format_item_underline = {
  Curly = 1,
  Dashed = 1,
  Dotted = 1,
  Double = 1,
  None = 1,
  Single = 1,
}

---@enum (key) FormatItemAttribute.Intensity
local format_item_intensity = {
  Bold = 1,
  Half = 1,
  Normal = 1,
}

---@class FormatItemAttribute
---@field Intensity? FormatItemAttribute.Intensity
---@field Italic? boolean
---@field Underline FormatItemAttribute.Underline

---@class FormatItemSpec
---@field Attribute? FormatItemAttribute
---@field Background? ColorSpec
---@field Foreground? ColorSpec
---@field Text? string

---@alias FormatItem "ResetAttributes"|FormatItemSpec

---This is a virtual modifier used by wezterm
---@enum (key) Modifiers
local modifiers = {
  ALT = 1,
  CTRL = 1,
  ENHANCED_KEY = 1,
  LEADER = 1,
  LEFT_ALT = 1,
  LEFT_CTRL = 1,
  LEFT_SHIFT = 1,
  NONE = 1,
  RIGHT_ALT = 1,
  RIGHT_CTRL = 1,
  RIGHT_SHIFT = 1,
  SHIFT = 1,
  SUPER = 1,
}

---Configures whether the window has a title bar and/or resizable border.
---
---The value is a set of flags:
---
---  - `"NONE"`: Disables titlebar and border (borderless mode),
---            but causes problems with resizing and minimizing the window,
---            so you probably want to use `"RESIZE"` instead of `"NONE"`
---            if you just want to remove the title bar
---  - `"TITLE"`: Disable the resizable border and enable only the title bar
---  - `"RESIZE"`: Disable the title bar but enable the resizable border
---  - `"TITLE|RESIZE"`: Enable titlebar and border.
---                    This is the default
---  - `"INTEGRATED_BUTTONS|RESIZE"`: Place window management buttons (minimize, maximize, close)
---                                 into the tab bar instead of showing a title bar
---  - `"MACOS_FORCE_DISABLE_SHADOW"`: (macOS only) disable the window shadow effect
---  - `"MACOS_FORCE_ENABLE_SHADOW"`: (macOS only) enable the window shadow effect
---  - `"MACOS_FORCE_SQUARE_CORNERS"`: (macOS only) force the window to have square
---                                  rather than rounded corners.
---                                  It is not compatible with `"TITLE"` or `"INTEGRATED_BUTTONS"`
---  - `"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"`: (macOS only) change the system titlebar background color
---                                                    to match the terminal background color defined
---                                                    by your configuration.
---                                                    This option doesn't make sense to use without
---                                                    also including `"TITLE|RESIZE"` in the set of decorations
---
---@enum (key) WindowDecorations
local window_decorations = {
  INTEGRATED_BUTTONS = 1,
  MACOS_FORCE_DISABLE_SHADOW = 1,
  MACOS_FORCE_ENABLE_SHADOW = 1,
  MACOS_FORCE_SQUARE_CORNERS = 1,
  NONE = 1,
  RESIZE = 1,
  TITLE = 1,

  ["INTEGRATED_BUTTONS|RESIZE"] = 1,
  ["MACOS_FORCE_DISABLE_SHADOW|TITLE"] = 1,
  ["MACOS_FORCE_ENABLE_SHADOW|TITLE"] = 1,
  ["RESIZE|INTEGRATED_BUTTONS"] = 1,
  ["RESIZE|TITLE"] = 1,
  ["TITLE|MACOS_FORCE_DISABLE_SHADOW"] = 1,
  ["TITLE|MACOS_FORCE_ENABLE_SHADOW"] = 1,
  ["TITLE|RESIZE"] = 1,

  ["INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW|RESIZE"] = 1,
  ["INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW|RESIZE"] = 1,
  ["INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_DISABLE_SHADOW"] = 1,
  ["INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"] = 1,
  ["MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"] = 1,
  ["MACOS_FORCE_DISABLE_SHADOW|RESIZE"] = 1,
  ["MACOS_FORCE_DISABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"] = 1,
  ["MACOS_FORCE_DISABLE_SHADOW|RESIZE|TITLE"] = 1,
  ["MACOS_FORCE_DISABLE_SHADOW|TITLE|RESIZE"] = 1,
  ["MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS|RESIZE"] = 1,
  ["MACOS_FORCE_ENABLE_SHADOW|RESIZE"] = 1,
  ["MACOS_FORCE_ENABLE_SHADOW|RESIZE|INTEGRATED_BUTTONS"] = 1,
  ["MACOS_FORCE_ENABLE_SHADOW|RESIZE|TITLE"] = 1,
  ["MACOS_FORCE_ENABLE_SHADOW|TITLE|RESIZE"] = 1,
  ["MACOS_FORCE_SQUARE_CORNERS|RESIZE"] = 1,
  ["MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE|TITLE"] = 1,
  ["MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"] = 1,
  ["RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"] = 1,
  ["RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"] = 1,
  ["RESIZE|MACOS_FORCE_DISABLE_SHADOW"] = 1,
  ["RESIZE|MACOS_FORCE_DISABLE_SHADOW|INTEGRATED_BUTTONS"] = 1,
  ["RESIZE|MACOS_FORCE_DISABLE_SHADOW|TITLE"] = 1,
  ["RESIZE|MACOS_FORCE_ENABLE_SHADOW"] = 1,
  ["RESIZE|MACOS_FORCE_ENABLE_SHADOW|INTEGRATED_BUTTONS"] = 1,
  ["RESIZE|MACOS_FORCE_ENABLE_SHADOW|TITLE"] = 1,
  ["RESIZE|MACOS_FORCE_SQUARE_CORNERS"] = 1,
  ["RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE"] = 1,
  ["RESIZE|TITLE|MACOS_FORCE_DISABLE_SHADOW"] = 1,
  ["RESIZE|TITLE|MACOS_FORCE_ENABLE_SHADOW"] = 1,
  ["RESIZE|TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"] = 1,
  ["TITLE|MACOS_FORCE_DISABLE_SHADOW|RESIZE"] = 1,
  ["TITLE|MACOS_FORCE_ENABLE_SHADOW|RESIZE"] = 1,
  ["TITLE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|RESIZE"] = 1,
  ["TITLE|RESIZE|MACOS_FORCE_DISABLE_SHADOW"] = 1,
  ["TITLE|RESIZE|MACOS_FORCE_ENABLE_SHADOW"] = 1,
  ["TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"] = 1,

  -- TODO: Do the 24 combinations for each of the remaining elements
  ["TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_DISABLE_SHADOW"] = 1,
  ["TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW"] = 1,
  ["TITLE|RESIZE|INTEGRATED_BUTTONS|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"] = 1,
  ---Add other valid combinations if needed
}

---@enum (key) PaletteAnsi
local palette_ansi = {
  black = 1,
  green = 1,
  maroon = 1,
  navy = 1,
  olive = 1,
  purple = 1,
  silver = 1,
  teal = 1,
}

---@enum (key) PaletteBrights
local palette_brights = {
  aqua = 1,
  blue = 1,
  fuchsia = 1,
  grey = 1,
  lime = 1,
  red = 1,
  white = 1,
  yellow = 1,
}

---@enum (key) AnsiColor
local ansi_color = {
  Aqua = 1,
  Black = 1,
  Blue = 1,
  Fuchsia = 1,
  Green = 1,
  Grey = 1,
  Lime = 1,
  Maroon = 1,
  Navy = 1,
  Olive = 1,
  Purple = 1,
  Red = 1,
  Silver = 1,
  Teal = 1,
  White = 1,
  Yellow = 1,
}

---@enum (key) TabBarColor.Underline
local tab_bar_underline = {
  Double = 1,
  None = 1,
  Single = 1,
}

---@class TabBarColor
---The color of the background area for the tab.
---
---@field bg_color? string
---The color of the text for the tab.
---
---@field fg_color? string
---Specify whether you want `"Half"`, `"Normal"` or `"Bold"`
---intensity for the label shown for this tab.
---
---The default is `"Normal"`.
---
---@field intensity? FormatItemAttribute.Intensity
---Specify whether you want the text to be italic for this tab.
---
---The default is `false`.
---
---@field italic? boolean
---Specify whether you want the text to be rendered with strikethrough
---or not for this tab.
---
---The default is `false`.
---
---@field strikethrough? boolean
---Specify whether you want `"None"`, `"Single"` or `"Double"`
---underline for label shown for this tab.
---
---The default is `"None"`.
---
---@field underline? TabBarColor.Underline

---@class TabBarColors
---The text color to use when the attributes are reset to default.
---
---@field background? string
---@field inactive_tab_edge? string
---@field inactive_tab_edge_hover? string

---Configure the color and styling for the tab bar.
---
---@class TabBar: TabBarColors
---The active tab is the one that has focus in the window.
---
---@field active_tab? TabBarColor
---The color of the strip that goes along the top of the window
---(does not apply when fancy tab bar is in use).
---
---@field background? string
---Inactive tabs are the tabs that do not have focus.
---
---@field inactive_tab? TabBarColor
---You can configure some alternate styling when
---the mouse pointer moves over inactive tabs.
---
---@field inactive_tab_hover? TabBarColor
---The new tab button that let you create new tabs.
---
---@field new_tab? TabBarColor
---You can configure some alternate styling
---when the mouse pointer moves over the new tab button.
---
---@field new_tab_hover? TabBarColor

---@class Palette
---A list of 8 colors corresponding to the basic ANSI palette.
---
---@field ansi? table<integer, PaletteAnsi>
---The background color to use when the attributes are
---reset to default.
---
---@field background? string
---A list of 8 colors corresponding to the brights.
---
---@field brights? table<integer, PaletteBrights>
---The color to use for the cursor when a dead key
---or leader state is active.
---
---@field compose_cursor? string
---Colors for `copy_mode` and `quick_select`.
---
---In `copy_mode`, the color of the active text is:
---
--- 1. `copy_mode_active_highlight` if additional text was selected
---                               using the mouse
--- 2. `selection` otherwise
---
---@field copy_mode_active_highlight_bg? ColorSpec
---Use `AnsiColor` to specify one of the ANSI color palette values
---(index 0-15), using one of the following values:
---
--- - `"Black"`
--- - `"Maroon"`
--- - `"Green"`
--- - `"Olive"`
--- - `"Navy"`
--- - `"Purple"`
--- - `"Teal"`
--- - `"Silver"`
--- - `"Grey"`
--- - `"Red"`
--- - `"Lime"`
--- - `"Yellow"`
--- - `"Blue"`
--- - `"Fuchsia"`
--- - `"Aqua"`
--- - `"White"`
---
---For more information, see:
--- - [`AnsiColor`](lua://AnsiColor)
---
---@field copy_mode_active_highlight_fg? ColorSpec
---Colors for `copy_mode` and `quick_select`.
---
---In `copy_mode`, the color of the active text is:
---
--- - `copy_mode_active_highlight` if additional text
---   was selected using the mouse
--- - `selection` otherwise
---
---@field copy_mode_inactive_highlight_bg? ColorSpec
---Use `AnsiColor` to specify one of the ANSI color palette values
---(index 0-15), using one of the following values:
---
--- - `"Black"`
--- - `"Maroon"`
--- - `"Green"`
--- - `"Olive"`
--- - `"Navy"`
--- - `"Purple"`
--- - `"Teal"`
--- - `"Silver"`
--- - `"Grey"`
--- - `"Red"`
--- - `"Lime"`
--- - `"Yellow"`
--- - `"Blue"`
--- - `"Fuchsia"`
--- - `"Aqua"`
--- - `"White"`
---
---For more information, see:
--- - [`AnsiColor`](lua://AnsiColor)
---
---@field copy_mode_inactive_highlight_fg? ColorSpec
---The background color of the cursor.
---
---@field cursor_bg? string
---The border of the cursor.
---
---@field cursor_border? string
---The foreground color of the cursor.
---
---@field cursor_fg? string
---The text color to use when the attributes are
---reset to default.
---
---@field foreground? string
---A map for setting arbitrary colors ranging from `16`
---to `256` in the color palette.
---
---@field indexed? string[]
---@field input_selector_label_bg? ColorSpec
---@field input_selector_label_fg? ColorSpec
---@field launcher_label_bg? ColorSpec
---@field launcher_label_fg? ColorSpec
---@field quick_select_label_bg? ColorSpec
---@field quick_select_label_fg? ColorSpec
---@field quick_select_match_bg? ColorSpec
---@field quick_select_match_fg? ColorSpec
---The color of the "thumb" of the scrollbar;
---the segment that represents the current viewable area.
---
---@field scrollbar_thumb? string
---The background color of selected text.
---
---@field selection_bg? string
---The foreground color of selected text.
---
---@field selection_fg? string
---The color of the split line between panes.
---
---@field split? string
---@field tab_bar? TabBar
---The color of the visual bell.
---
---If unspecified, the foreground color is used instead.
---
---@field visual_bell? string

---@enum (key) FontWeight
local font_weight = {
  Black = 1,
  Bold = 1,
  Book = 1,
  DemiBold = 1,
  DemiLight = 1,
  ExtraBlack = 1,
  ExtraBold = 1,
  ExtraLight = 1,
  Light = 1,
  Medium = 1,
  Regular = 1,
  Thin = 1,
}

---@enum (key) FontStretch
local font_stretch = {
  Condensed = 1,
  Expanded = 1,
  ExtraCondensed = 1,
  ExtraExpanded = 1,
  Normal = 1,
  SemiCondensed = 1,
  SemiExpanded = 1,
  UltraCondensed = 1,
  UltraExpanded = 1,
}

---@enum (key) FontStyle
local font_style = {
  Italic = 1,
  Normal = 1,
  Oblique = 1,
}

---@enum (key) FreeTypeLoadFlags
local freetype_load_flags = {
  DEFAUlT = 1,
  FORCE_AUTOHINT = 1,
  MONOCHROME = 1,
  NO_AUTOHINT = 1,
  NO_BITMAP = 1,
  NO_HINTING = 1,
}

---@enum (key) FreeTypeTarget
local freetype_target = {
  HorizontalLcd = 1,
  Light = 1,
  Mono = 1,
  Normal = 1,
  VerticalLcd = 1,
}

---@class FontAttributesBase
---To control whether a font is considered to have emoji (rather than text)
---presentation glyphs for emoji.
---
---@field assume_emoji_presentation? boolean
---@field family string
---you can combine the flags like `"NO_HINTING|MONOCHROME"`
---**(you probably wouldn't want to do this)**.
---
---@field freetype_load_flags? FreeTypeLoadFlags
---@field freetype_load_target? FreeTypeTarget
---@field freetype_render_target? FreeTypeTarget
---When `config.font_shaper` is
---set to `"Harfbuzz"`, this setting affects
---how font shaping takes place.
---
---The _OpenType_ spec lists a number of features
---[here](https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist).
---
---For more information and examples, see:
--- - [Font Shaping](https://wezterm.org/config/font-shaping.html)
--- - [`config.font_shaper`](lua://Config.font_shaper)
---
---@field harfbuzz_features? HarfbuzzFeatures[]
---@field scale? number
---@field stretch? FontStretch
---This option will only be respected if the `italic` option is `nil`.
---
---@field style? FontStyle
---@field weight? FontWeight

---Argument type for `Wezterm.font()` and `Wezterm.font_with_fallback()`.
---@class FontFamilyAttributes: FontAttributesBase
---Setting this option to `true`, will overwrite the `style` option to `Italic`.
---Setting this option to `false` will overwrite the `style` option to `Normal`.
---
---@field italic? boolean

---Corresponds to the internal `FontAttributes` struct that is used to
---select a single named font.
---
---@class FontAttributes: FontAttributesBase
---@field is_fallback? boolean
---@field is_synthetic? boolean

---@class TextStyleAttributes
---@field bold? boolean
---If set, when rendering text that is set to the default
---foreground color, use this color instead.  This is most
---useful in a `Config.font_rules` section to implement changing
---the text color for eg: bold text.
---
---For more information and examples, see:
--- - [Font Rules](ttps://wezterm.org/config/lua/config/font_rules.html)
--- - [`config.font_rules`](lua://Config.font_rules)
---
---@field foreground? string
---@field italic? boolean
---@field stretch? FontStretch
---@field style? FontStyle
---@field weight? FontWeight

---@class TextStyle
---@field fonts FontAttributes[]
---@field foreground? string

---@class WindowFrameConfig
---@field active_titlebar_bg? string
---@field active_titlebar_border_bottom? string
---@field active_titlebar_fg? string
---@field border_bottom_color? string
---@field border_bottom_height? string|integer
---@field border_left_color? string
---@field border_left_width? string|integer
---@field border_right_color? string
---@field border_right_width? string|integer
---@field border_top_color? string
---@field border_top_height? string|integer
---@field button_bg? string
---@field button_fg? string
---@field button_hover_bg? string
---@field button_hover_fg? string
---@field font? TextStyle
---@field font_size? number
---@field inactive_titlebar_bg? string
---@field inactive_titlebar_border_bottom? string
---@field inactive_titlebar_fg? string

---@class TabBarStyle
---@field new_tab? string
---@field new_tab_hover? string
---@field window_close? string
---@field window_close_hover? string
---@field window_hide? string
---@field window_hide_hover? string
---@field window_maximize? string
---@field window_maximize_hover? string

---@class HyperlinkRule
---@field format string
---@field highlight? integer
---@field regex string

---@class SerialDomain
---Set the baud rate.
---
---The default is `9600` baud.
---
---@field baud integer
---The name of this specific domain.
---
---Must be unique amongst all types of domain
---in the configuration file.
---
---@field name string
---Specifies the serial device name.
---
--- - On Windows systems this can be a name like `COM0`
--- - On POSIX systems this will be something like `/dev/ttyUSB0`
--- - If omitted, the name will be interpreted as the port
---
---@field port string

---@enum (key) GpuInfo.DeviceType
local gpu_device_type = {
  Cpu = 1,
  DiscreteGpu = 1,
  IntegratedGpu = 1,
  Other = 1,
}

---@enum (key) GpuInfo.Backend
local gpu_backend = {
  Dx12 = 1,
  Gl = 1,
  Metal = 1,
  Vulkan = 1,
}

---Corresponds to [`wgpu::AdapterInfo`](https://docs.rs/wgpu/latest/wgpu/struct.AdapterInfo.html).
---@class GpuInfo
---@field backend GpuInfo.Backend
---@field device integer
---@field device_type GpuInfo.DeviceType
---@field driver? string
---@field driver_info? string
---@field name string
---@field vendor integer

---@class UnixDomain
---If `true`, connect to this domain on startup.
---
---@field connect_automatically boolean
---Show time since last response when waiting for a response.
---
---[Recommended Source](https://wezterm.org/config/lua/pane/get_metadata.html#since_last_response_ms).
---
---@field local_echo_threshold_ms integer
---The name of this specific domain.
---
---Must be unique amongst all types of domain
---in the configuration file.
---
---@field name string
---If `true`, do not attempt to start this server
---if we try and fail to connect to it.
---
---@field no_serve_automatically boolean
---@field overlay_lag_indicator boolean
---Instead of directly connecting to `socket_path`
---spawn this command and use its stdin/stdout
---in place of the socket.
---
---@field proxy_command string[]
---@field read_timeout integer
---If we decide that we need to start the server,
---the command to run to set that up.
---
---The default is to spawn:
---
---```sh
---wezterm-mux-server --daemonize
---```
---
---To start up a UNIX domain inside a WSL container:
---
---```sh
---wsl -e wezterm-mux-server --daemonize
---```
---
---@field serve_command string[]
---If `true`, bypass checking for secure ownership
---of the `socket_path`.
---
---This is not recommended on a multi-user system,
---but is useful, for example, when running the server
---inside a WSL container but with the socket
---on the host NTFS volume.
---
---@field skip_permissions_check boolean
---@field socket_path string
---@field write_timeout integer

---@class LeaderKey: Key
---Maximum time to wait for next key.
---
---Default is `1000` ms.
---
---@field timeout_milliseconds? integer

---@class HyperLinkRule
---Controls which parts of the regex match will be used
---to form the link.
---
---Must have a prefix: signaling the protocol type
---(e.g. `https:/mailto:`), which can either come from
---the regex match or needs to be explicitly added.
---
---The format string can use placeholders like `$0`, `$1`, `$2` etc.
---that will be replaced with that numbered capture group.
---So, `$0` will take the entire region of text matched
---by the whole regex, while `$1` matches out
---the first capture group.
---
---@field format string
---Specifies the range of the matched text that should be
---highlighted/underlined when the mouse hovers over the link.
---
---The value is a number that corresponds to a capture group in the regex.
---
---The default is `0`, highlighting the entire region of text
---matched by the regex.
---`1` would be the first capture group, and so on...
---
---@field highlight? number
---The regular expression to match.
---
---@field regex string

---@enum (key) BatteryInfo.State
local battery_info_state = {
  Charging = 1,
  Discharging = 1,
  Empty = 1,
  Full = 1,
  Unknown = 1,
}

---@class BatteryInfo
---If known, shows the battery model string or `"unknown"` otherwise.
---
---@field model string
---If known, shows the battery serial number or `"unknown"` otherwise.
---
---@field serial string
---@field state BatteryInfo.State
---The battery level expressed as a number between `0.0` (empty)
---and `1.0` (full).
---
---@field state_of_charge number
---If discharing, how long until the battery is empty (in seconds).
---
---@field time_to_empty? integer
---If charging, how long until the battery is full (in seconds).
---
---@field time_to_full? integer
---If known, shows battery manufacturer name or `"unknown"` otherwise.
---
---@field vendor string

---@class AugmentCommandPaletteReturn
---The action to take when the item is activated.
---
---Can be any key assignment action.
---
---For more information, see:
--- - [`Action`](lua://Action)
---
---@field action Action
---The brief description for the entry.
---
---@field brief string
---A long description that may be shown after the entry,
---or that may be used in future versions of WezTerm to provide
---more information about the command.
---
---@field doc? string
---**(OPTIONAL)** Nerd Fonts glyph name to use for the icon for the entry.
---
---For a list of icon names, see:
--- - [`Wezterm.NerdFont`](lua://Wezterm.NerdFont)
---
---@field icon? Wezterm.NerdFont

---@enum (key) StableCursorPosition.Shape
local shape = {
  BlinkingBar = 1,
  BlinkingBlock = 1,
  BlinkingUnderline = 1,
  SteadyBar = 1,
  SteadyBlock = 1,
  SteadyUnderline = 1,
}

---Mirrors `StableCursorPosition` in wezterm upstream:
---https://github.com/wezterm/wezterm/blob/main/mux/src/renderable.rs
---
---@class StableCursorPosition
---@field shape StableCursorPosition.Shape
---@field visibility "Visible"|"Hidden"
---The horizontal cell index.
---
---@field x integer
---The vertical stable row index.
---
---@field y integer

---@class LinearGradientOrientation
---@field angle number

---@class RadialGradientOrientation
---@field cx? number
---@field cy? number
---@field radius? number

---@alias GradientOrientation
---|"Horizontal"
---|"Vertical"
---|{ Linear: LinearGradientOrientation }
---|{ Radial: RadialGradientOrientation }

---@enum (key) Gradient.Blend
local blend = {
  Hsv = 1,
  LinearRgb = 1,
  Oklab = 1,
  Rgb = 1,
}

---@enum (key) Gradient.Interpolation
local interpolation = {
  Basis = 1,
  CatmullRom = 1,
  Linear = 1,
}

---@class Gradient
---@field blend? Gradient.Blend
---@field colors string[]
---@field interpolation? Gradient.Interpolation
---@field noise? number
---@field orientation? GradientOrientation
---@field segment_size? number
---@field segment_smoothness? number

---@class ColorSchemeMetaData
---@field aliases? string[]
---@field author? string
---@field name? string
---@field origin_url? string
---@field wezterm_version? string

---@enum (key) CursorStyle
local cursor_style = {
  BlinkingBar = 1,
  BlinkingBlock = 1,
  BlinkingUnderline = 1,
  SteadyBar = 1,
  SteadyBlock = 1,
  SteadyUnderline = 1,
}

---@enum (key) Direction
local direction = {
  Down = 1,
  Left = 1,
  Next = 1,
  Prev = 1,
  Right = 1,
  Up = 1,
}

---@alias EasingFunction
---|"Constant"
---|"Ease"
---|"EaseIn"
---|"EaseInOut"
---|"EaseOut"
---|"Linear"
---|{ CubicBezier: number[] }

---@enum (key) Stretch
local stretch = {
  Condensed = 1,
  Expanded = 1,
  ExtraCondensed = 1,
  ExtraExpanded = 1,
  Normal = 1,
  SemiCondensed = 1,
  SemiExpanded = 1,
  UltraCondensed = 1,
  UltraExpanded = 1,
}

---@enum (key) Weight
local weight = {
  Black = 1,
  Bold = 1,
  Book = 1,
  DemiBold = 1,
  DemiLight = 1,
  ExtraBlack = 1,
  ExtraBold = 1,
  ExtraLight = 1,
  Light = 1,
  Medium = 1,
  Regular = 1,
  Thin = 1,
}

---@class ScreenInformation
---@field height number
---@field max_fps? number
---@field name string
---@field width number
---@field x number
---@field y number

---@class GuiScreensInfo
---@field active ScreenInformation
---@field byName table<string, ScreenInformation>
---@field main ScreenInformation
---@field origin_x number
---@field origin_y number
---@field virtual_height number
---@field virtual_width number

---@class KeyBinding: Key
---@field action Action
---@field key string
---@field mods? string

---@class MouseEventInfo
---@field button "Left"|"Right"|"Middle"|{ WheelDown: number }|{ WheelUp: number }
---@field streak number

---@alias MouseEvent
---|{ Down: MouseEventInfo }
---|{ Drag: MouseEventInfo }
---|{ Up: MouseEventInfo }

---@class MouseBindingBase
---@field action Action
---@field alt_screen? boolean|"Any"
---@field event MouseEvent
---@field mouse_reporting? boolean

---@class MouseBinding: MouseBindingBase
---@field mods string

--- - The first event parameter is a `Window`
---   object that represents the GUI window
--- - The second event parameter is a `Pane`
---   object that represents the pane in which
---   the event was triggered.
---
---See:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
---
---@alias CallbackWindowPane fun(window: Window, pane: Pane)

---Action callback type for `InputSelectorParams.action`
---
---See:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
--- - [`InputSelectorParams`](lua://InputSelectorParams)
---
---@alias CallbackInputSelector fun(window: Window, pane: Pane, id?: string, label?: string)

---Action callback type for `PromptInputLineParams.action`
---
---See:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
--- - [`PromptInputLineParams`](lua://PromptInputLineParams)
---
---@alias CallbackPromptInputLine fun(window: Window, pane: Pane, line?: string)

---@alias WezTerm Wezterm

---The `wezterm` module is the primary module that exposes
---WezTerm configuration and control to your config file.
---
---You will typically place:
---
---```lua
---local wezterm = require 'wezterm'
---```
---
---at the top of your configuration file to enable it.
---
---@class Wezterm: ExecDomain
---`wezterm.GLOBAL` is a special `userdata` value that acts
---like a table.
---Writing to keys will copy the data that you assign
---into a global in-memory table and allow it to be read back later.
---
---Provides global, in-process, in-memory, data storage
---for JSON-like variables that persists across config reloads.
---
---WezTerm's Lua files may be re-loaded and re-evaluated
---multiple times in different contexts or in different threads.
---If you'd like to keep track of state that lasts
---for the lifetime of your wezterm process then
---you cannot simply use global variables in the Lua script.
---
---Reads and writes from/to `wezterm.GLOBAL` are thread-safe
---but don't currently provide synchronization primitives for managing
---read-modify-write operations.
---
---You may store values with the following types:
---
--- -  `string`
--- -  `number`
--- -  `table`
--- -  `boolean`
---
---**Attempting to assign other types will raise an error.**
---
---@field GLOBAL table<string, string|number|table|boolean>
---Helper for defining key assignment actions
---in your configuration file.
---
---This is really just sugar for the underlying Lua ==> Rust
---deserialation mapping that makes it a bit easier to identify
---where syntax errors may exist in your configuration file.
---
---For more information, see:
--- - [`KeyAssignment`](lua://KeyAssignment)
--- - [`Action`](lua://Action)
---
---@field action KeyAssignment
---The `wezterm.color` module exposes functions
---that work with colors.
---
---For more information, see:
--- - [`Wezterm.Color`](lua://Wezterm.Color)
---
---@field color Wezterm.Color
---This constant is set to the path to the directory
---in which your `wezterm.lua` configuration file was found.
---
---@field config_dir string
---This constant is set to the path to the `wezterm.lua`
---that is in use.
---
---@field config_file string
---This constant is set to the directory containing
---the wezterm executable file.
---
---@field executable_dir string
---The `wezterm.gui` module exposes functions that operate
---on the GUI layer.
---
---The multiplexer may not be connected to a GUI,
---so attempting to resolve this module from the mux server
---will return `nil`.
---
---For more information, see:
--- - [`Wezterm.Gui`](lua://Wezterm.Gui)
---
---@field gui Wezterm.Gui
---@field home_dir string
---For more information, see:
--- - [`Wezterm.Mux`](lua://Wezterm.Mux)
---
---@field mux Wezterm.Mux
---For more information, see:
--- - [`Wezterm.NerdFont`](lua://Wezterm.NerdFont)
---
---@field nerdfonts Wezterm.NerdFont
---The `wezterm.plugin` module provides functions
---to manage WezTerm plugins.
---
---For more information, see:
--- - [`Wezterm.Plugin`](lua://Wezterm.Plugin)
---
---@field plugin Wezterm.Plugin
---The `wezterm.procinfo` module exposes functions
---that allow querying information about processes
---that are running on the local system.
---
---For more information, see:
--- - [`Wezterm.ProcInfo`](lua://Wezterm.ProcInfo)
---
---@field procinfo Wezterm.ProcInfo
---The `wezterm.serde` module provides functions for parsing
---the given string as JSON, YAML, or TOML, returning
---the corresponding Lua values, and vice versa.
---
---For more information, see:
--- - [`Wezterm.Serde`](lua://Wezterm.Serde)
---
---@field serde Wezterm.Serde
---This constant is set to the Rust target triple for
---the platform on which wezterm was built.
---
---This can be useful when you wish to conditionally adjust
---your configuration based on the platform.
---
---@field target_triple string
---The `wezterm.time` module exposes functions that allow
---working with time.
---
---For more information, see:
--- - [`Wezterm.Time`](lua://Wezterm.Time)
---
---@field time Wezterm.Time
---The `wezterm.url` module exposes functions that allow
---working with URLs.
---
---For more information, see:
--- - [`Wezterm.Url`](lua://Wezterm.Url)
---
---@field url Wezterm.Url
---This constant is set to the wezterm version string
---that is also reported by running `wezterm -V`.
---
---This can potentially be used to adjust configuration
---according to the installed version.
---
---@field version string
local M = {}

---This function is a helper to register a custom event and return
---an action triggering it.
---
---It is helpful to write custom key bindings directly, without having to declare
---the event and use it in a different place.
---
---The implementation is essentially the same as:
---
---```lua
---function wezterm.action_callback(callback)
---  local event_id = '...' -- the function generates a unique event id
---  wezterm.on(event_id, callback)
---  return wezterm.action.EmitEvent(event_id)
---end
---```
---@param callback function|CallbackWindowPane|CallbackInputSelector|CallbackPromptInputLine
---@return { EmitEvent: string } event
function M.action_callback(callback) end

---Adds path to the list of files that are watched for config changes.
---
---If [`config.automatically_reload_config`](lua://Config.automatically_reload_config)
---is enabled, then the config will be reloaded
---when any of the files that have been added to the watch list have changed.
---
---@param path string
function M.add_to_config_reload_watch_list(path) end

---Accepts an argument list; it will attempt to spawn that command in the background.
---
---@param args string[]
function M.background_child_process(args) end

---Returns the battery information for each of the
---installed batteries on the system.
---
---This is useful for example to assemble status information
---for the status bar.
---
---@return BatteryInfo[] info
function M.battery_info() end

---Given a `string` parameter, returns the number of columns
---that text occupies in the terminal.
---
---This is useful together with the `"format-tab-title"`
---and `"update-right-status"` events to compute/layout tabs
---and status information.
---
---@param value string
---@return number width
function M.column_width(value) end

---Returns a `Config` object that can be used to define your configuration.
---
---See:
--- - [`Config`](lua://Config)
---
---@return Config config
function M.config_builder() end

---Returns the compiled-in default hyperlink rules as a table.
---
---For more information, see:
--- - [`HyperLinkRule`](lua://HyperLinkRule)
---
---@return HyperLinkRule[] rules
function M.default_hyperlink_rules() end

---Computes a list of `SshDomain` objects based on the set of hosts
---discovered in `~/.ssh/config`.
---
---Each host will have both a plain SSH and a multiplexing SSH domain
---generated and returned in the list of domains.
---The former don't require wezterm to be installed on the remote host,
---while the latter do require it.
---
---The intended purpose of this function is to give you the opportunity
---to edit/adjust the returned information before assigning it to your config.
---
---For more information, see:
--- - [SshDomain](lua://SshDomain)
---
---@return SshDomain[] domains
function M.default_ssh_domains() end

---Computes a list of `WslDomain` objects, each one representing
---an installed WSL distribution on your system.
---
---This list is the same as the default value for the `config.wsl_domains`
---configuration option, which is to make a `WslDomain` object
---with the `distribution` field set to the name of the WSL distro
---and the `name` field set to name of the distro with `"WSL:"` prefixed to it.
---
---See:
--- - [`WslDomain`](lua://WslDomain)
--- - [`config.wsl_domains`](lua://Config.wsl_domains)
---
---@return WslDomain[] domains
function M.default_wsl_domains() end

---`wezterm.emit` resolves the registered callback(s) for the specified event name
---and calls each of them in turn, passing the additional arguments
---through to the callback.
---
---If a callback returns `false` then it prevents later callbacks from being called
---for this particular call to `wezterm.emit`, and `wezterm.emit` will return `false`
---to indicate that no additional/default processing should take place.
---
---If none of the callbacks returned `false` then `wezterm.emit` will itself return `true`
---to indicate that default processing should take place.
---
---This function has no special knowledge of which events are defined by wezterm,
---or what their required arguments might be.
---
---For more information on event handling, see:
---- [`wezterm.on`](lua://Wezterm.on)
---
---@param event string
---@param ... any
---@return boolean result
function M.emit(event, ...) end

---This function will parse your ssh configuration file(s) and extract from them
---the set of literal (non-pattern, non-negated) host names that are specified
---in `Host` and `Match` stanzas contained in those configuration files
---and return a mapping from the hostname to the effective ssh config options for that host.
---
---You may optionally pass a list of ssh configuration files that should be read
---in case you have a special configuration.
---
---@param ssh_config_file_name? string[]|string
---@return table<string, SshHost> ssh_hosts
function M.enumerate_ssh_hosts(ssh_config_file_name) end

---This function constructs a Lua table that corresponds to the internal
---`FontAttributes` struct that is used to select a single named font:
---
---```lua
---local wezterm = require 'wezterm'
---
---return {
---  font = wezterm.font 'JetBrains Mono',
---}
---```
---
---The first parameter is the name of the font; the name can be one of the following types of names:
---
--- - The font family name, e.g. `"JetBrains Mono"`. The family name doesn't include any style information
---   (such as `weight`, `stretch` or `italic`), which can be specified via the `attributes` parameter.
---   This is the recommended name to use for the font, as it the most compatible way to resolve
---   an installed font.
--- - The computed full name, which is the family name with the sub-family
---   (which incorporates style information) appended, e.g. `"JetBrains Mono Regular"`.
--- - The postscript name, which is an ostensibly unique name identifying a given font and style
---   that is encoded into the font by the font designer.
---
---When specifying a font using its family name, the second `attributes` parameter is
---an **optional** table that can be used to specify style attributes.
---
---See:
--- - [`TextStyleAttributes`](lua://TextStyleAttributes)
--- - [`TextStyle`](lua://TextStyle)
---
---@param font string|FontFamilyAttributes
---@param attributes? TextStyleAttributes
---@return TextStyle
function M.font(font, attributes) end

---This function constructs a Lua table that corresponds to the internal
---`FontAttributes` struct that is used to select a single named font.
---
---The first parameter is a table where the font family and the attributes are combined.
---
---You can use this expanded table form to override freetype and harfbuzz settings
---just for the specified font.
---
---The second attributes parameter is an **optional** table that can also be used
---to specify style attributes.
---
---**Note**, that the attributes specified in the second `attributes` parameter will take precedence over
---any attributes specified in the first `font` parameter.
---
---This example shows how to disable the default ligature feature just for this particular font:
---
---```lua
---local wezterm = require 'wezterm'
---return {
---  font = wezterm.font {
---    family = 'JetBrains Mono',
---    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
---  },
---}
---```
---
---See:
--- - [`FontFamilyAttributes`](lua://FontFamilyAttributes)
--- - [`TextStyleAttributes`](lua://TextStyleAttributes)
--- - [`TextStyle`](lua://TextStyle)
---
---@param font FontFamilyAttributes
---@param attributes? TextStyleAttributes
---@return TextStyle
function M.font(font, attributes) end

---This function constructs a lua table that configures a font with fallback processing.
---Glyphs are looked up in the first font in the list but if missing the next font is checked and so on.
---
---The first parameter is a table listing the fonts in their preferred order.
---The fonts can be specified by the their family or using the alternative form where the family and attributes
---are specified as part of the same lua table:
---
---```lua
---local wezterm = require 'wezterm'
---return {
---  font = wezterm.font_with_fallback {
---  {
---    family = 'JetBrains Mono'
---    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
---    weight = 'Medium'
---  },
---  { family = 'Terminus', weight = 'Bold' },
---  'Noto Color Emoji',
---}
---```
---
---WezTerm implicitly adds its default fallback to the list that you specify.
---
---The second `attributes` parameter is an **optional** table that can also be used
---to specify style attributes.
---
---**Note**, that the attributes specified in the second `attributes` parameter will take precedence over
---any attributes specified in the individual font tables and will affect all listed fonts.
---
---See:
--- - [`FontFamilyAttributes`](lua://FontFamilyAttributes)
--- - [`TextStyleAttributes`](lua://TextStyleAttributes)
--- - [`TextStyle`](lua://TextStyle)
---
---@param fonts (string|FontFamilyAttributes)[]
---@param attributes? TextStyleAttributes
---@return TextStyle
function M.font_with_fallback(fonts, attributes) end

---Can be used to produce a formatted string with terminal graphic attributes
---such as `bold`, `italic` and `colors`.
---
---The result is a string with wezterm-compatible escape sequences embedded.
---
---@param ... FormatItem[]
---@return string str
function M.format(...) end

---While this function is still valid, it is recommended to use instead:
---
--- - [`wezterm.color.get_builtin_schemes`](lua://Wezterm.Color.get_builtin_schemes)
---
--- ---
---Returns a Lua table keyed by color scheme name and whose values are
---the color scheme definition of the builtin color schemes.
---
---This is useful for programmatically deciding things about the scheme
---to use based on its color, or for taking a scheme and overriding
---a couple of entries from your `wezterm.lua` configuration file.
---
---@return table<string, Palette> builtin
---@deprecated
function M.get_builtin_color_schemes() end

---This function evalutes the glob pattern and returns an array
---containing the absolute file names of the matching results.
---
---Due to limitations in the Lua bindings,
---all of the paths must be able to be represented
---as `UTF-8` or this function will generate an error.
---
---@param pattern string
---@param relative_to? string
---@return string[] file_names
function M.glob(pattern, relative_to) end

---This function was moved to `wezterm.color.gradient`.
---In addition, the returned colors are now of `Color` type.
---
--- ---
---Given a gradient spec (`gradient`) and a number of colors
---(`num_colors`), returns a table holding that many colors
---spaced evenly across the range of the gradient.
---
---This is useful, for instance, for generating colors for tabs,
---or doing something fancy like interpolating colors across a gradient
---based on the time of the day.
---
---See:
--- - [`Color`](lua://Color)
--- - [`wezterm.color.gradient`](lua://Wezterm.Color.gradient)
---
---@param gradient Gradient
---@param num_colors number
---@return Color[]
---@deprecated
function M.gradient_colors(gradient, num_colors) end

---@param action string
---@return boolean has
function M.has_action(action) end

---@return string host_name
function M.hostname() end

---@param value any
---@return string json_str
function M.json_encode(value) end

---@param value string
---@return any data
function M.json_parse(value) end

---This function logs the provided message string through wezterm's logging layer
---at `'ERROR'` level, which can be displayed via the
---[`ShowDebugOverlay`](https://wezterm.org/config/lua/keyassignment/ShowDebugOverlay.html) action.
---
---If you started wezterm from a terminal that text will print to the `stdout` of that terminal.
---
---If running as a daemon for the multiplexer server then it will be logged
---to the daemon output path.
---
---```lua
---local wezterm = require 'wezterm'
---wezterm.log_error 'Hello!'
---```
---
---See also:
--- - [`wezterm.log_info()`](lua://Wezterm.log_info)
--- - [`wezterm.log_warn()`](lua://Wezterm.log_warn)
---
---@param msg string
---@param ... any
function M.log_error(msg, ...) end

---This function logs the provided message string through wezterm's logging layer
---at the `'INFO'` level, which can be displayed via the
---[`ShowDebugOverlay`](https://wezterm.org/config/lua/keyassignment/ShowDebugOverlay.html) action.
---
---If you started wezterm from a terminal that text will print to the `stdout` of that terminal.
---
---If running as a daemon for the multiplexer server then it will be logged to the daemon output path.
---
---```lua
---local wezterm = require 'wezterm'
---wezterm.log_info 'Hello!'
---```
---
---See also:
--- - [`wezterm.log_error()`](lua://Wezterm.log_error)
--- - [`wezterm.log_warn()`](lua://Wezterm.log_warn)
---
---@param msg string
---@param ... any
function M.log_info(msg, ...) end

---This function logs the provided message string through wezterm's logging layer
---at the `'WARN'` level, which can be displayed via the
---[`ShowDebugOverlay`](https://wezterm.org/config/lua/keyassignment/ShowDebugOverlay.html) action.
---
---If you started wezterm from a terminal that text will print to the `stdout` of that terminal.
---
---If running as a daemon for the multiplexer server then it will be logged to the daemon output path.
---
---```lua
---local wezterm = require 'wezterm'
---wezterm.log_warn 'Hello!'
---```
---
---See also:
--- - [`wezterm.log_info()`](lua://Wezterm.log_info)
--- - [`wezterm.log_error()`](lua://Wezterm.log_error)
---
---@param msg string
---@param ... any
function M.log_warn(msg, ...) end

---A custom declared event handler.
---
---You may register handlers for arbitrary events for which Wezterm itself has no special knowledge.
---
---It is recommended that you avoid event names that are likely to be used future versions of Wezterm
---in order to avoid unexpected behavior if or when those names might be used in future.
---
---The `wezterm.emit()` function and the `EmitEvent` key assignment can be used to emit events.
---
---See:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
--- - [`EmitEvent`](lua://KeyAssignment.EmitEvent)
--- - [`wezterm.emit()`](lua://Wezterm.emit)
---
---@param event string
---@param callback fun(...:any): any
function M.on(event, callback) end

---A custom declared event handler for events emitted by the `EmitEvent` key assignment.
---
--- - The first event parameter is a `Window` object that represents the GUI window
--- - The second event parameter is a `Pane` object that represents the pane
---   in which the event was triggered
---
---See:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
--- - [`EmitEvent`](lua://KeyAssignment.EmitEvent)
---
---@param event string
---@param callback CallbackWindowPane
function M.on(event, callback) end

---This event is emitted when the Command Palette is shown.
---
---Its purpose is to enable you to add additional entries to the list of commands shown in the palette.
---
---This hook is synchronous; calling asynchronous functions will not succeed.
------
---The `"augment-command-palette"` event is emitted when the `Command Palette` is shown.
---
---Its purpose is to enable you to add additional entries to the list of commands
---shown in the palette.
---
---This hook is synchronous; calling asynchronous functions will not succeed.
---
---The return value is an `AugmentCommandPaletteReturn` table.
---
---See:
--- - [`AugmentCommandPaletteReturn`](lua://AugmentCommandPaletteReturn)
---
---@param event "augment-command-palette"
---@param callback fun(window: Window, pane: Pane): AugmentCommandPaletteReturn
function M.on(event, callback) end

--- - The first event parameter is a `Window` object that represents the GUI window
--- - The second event parameter is a `Pane` object that represents the pane
---   in which the bell was rung, which may not be active pane;
---   rather it could be in an unfocused pane or tab
---
------
---The `"bell"` event is emitted when the ASCII `BEL` sequence
---is emitted to a pane in the window.
---
---Defining an event handler doesn't alter wezterm's handling of the bell;
---the event supplements it and allows you
---to take additional action over the configured behavior.
---
---See:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
---
---@param event "bell"
---@param callback CallbackWindowPane
function M.on(event, callback) end

---The parameters to the event are:
---
--- - `tab`: The `TabInformation` for the active tab
--- - `tabs`: An array containing `TabInformation` objects for each of the tabs in the window
--- - `panes`: An array containing `PaneInformation` objects for each of the panes in the active tab
--- - `config`: The effective configuration for the window
--- - `hover`: `true` if the current tab is in the hover state
--- - `max_width`: The maximum number of cells available to draw this tab
---              when using the retro tab bar style
---
---The return value of the event can be:
---
--- - A string, holding the text to use for the tab title
--- - A `FormatItem` object as used in the `wezterm.format()` function.
---   This allows formatting style and color information
---   for individual elements within the tab
---
---If the event encounters an error, or returns something that is not
---one of the types mentioned above, then the default tab title text
---will be computed and used instead.
---
---When the tab bar is computed, this event is called twice for each tab;
---on the first pass, `hover` will be false and `max_width` will be set to `tab_max_width`.
---WezTerm will then compute the tab widths that will fit in the tab bar,
---and then call the event again for the set of tabs,
---this time with appropriate hover and max_width values.
---
---Only the first `"format-tab-title"` event will be executed;
---it doesn't make sense to define multiple instances of the event
---with multiple `wezterm.on("format-tab-title", ...)` calls.
---
--- ---
---The `"format-tab-title"` event is emitted when the text for a tab title
---needs to be recomputed.
---
---This event is a bit special in that it is synchronous and must return
---as quickly as possible in order to avoid blocking the GUI thread.
---
---The most notable consequence of this is that some functions that are asynchronous
---(e.g. `wezterm.run_child_process()`) are not possible to call
---from inside the event handler and will generate the following error:
---
---```
---format-tab-title: runtime error: attempt to yield from outside a coroutine
---```
---
---See:
--- - [`FormatItem`](lua://FormatItem)
--- - [`wezterm.run_child_process()`](lua://Wezterm.run_child_process)
--- - [`wezterm.format()`](lua://Wezterm.format)
---
---@param event "format-tab-title"
---@param callback fun(tab: TabInformation, tabs: TabInformation[], panes: PaneInformation[], config: Config, hover: boolean, max_width: integer): string|FormatItem
function M.on(event, callback) end

---The parameters to the event are:
---
--- - `tab`: The `TabInformation` object for the active tab
--- - `pane`: The `PaneInformation` object for the active pane
--- - `tabs`: An array containing `TabInformation` objects for each of the tabs in the window
--- - `panes`: An array containing `PaneInformation` objects for each of the panes in the active tab
--- - `config`: The effective configuration for the window
---
---The return value of the event should be a `string`,
---and if it is then it will be used as the title text in the window title bar.
---
---If the event encounters an error, or returns something that is not a `string`,
---then the default window title text will be computed and used instead.
---
---Only the first `"format-window-title"` event will be executed;
---it doesn't make sense to define multiple instances of the event
---with multiple `wezterm.on("format-window-title", ...)` calls.
---
---The `"format-window-title"` event is emitted when the text for the window title
---needs to be recomputed.
---
---This event is a bit special in that it is synchronous and must return
---as quickly as possible in order to avoid blocking the GUI thread.
---
---The most notable consequence of this is that some functions that are asynchronous
---(e.g. `wezterm.run_child_process()`) are not possible to call from inside
---the event handler and will generate a
---`format-window-title: runtime error: attempt to yield from outside a coroutine` error.
---
---For more information, see:
--- - [`wezterm.run_child_process()`](lua://Wezterm.run_child_process)
---
---Mirrors the `format-window-title` callback arguments in wezterm upstream:
---https://github.com/wezterm/wezterm/blob/main/wezterm-gui/src/termwindow/mod.rs
---
---@param event "format-window-title"
---@param callback fun(tab: TabInformation, pane: PaneInformation, tabs: TabInformation[], panes: PaneInformation[], config: Config): string
function M.on(event, callback) end

---This event is triggered when the GUI is starting up after attaching the selected domain.
---For example, when running `wezterm connect DOMAIN` or `wezterm start --domain DOMAIN`
---to start the GUI, the `gui-attached` event will be triggered and passed the `MuxDomain` object
---associated with `DOMAIN`.
---
---In cases where you don't specify the domain, the default domain will be passed instead.
---
---This event fires after the `gui-startup` event.
---
---Note that the `gui-startup` event does not fire when invoking
---`wezterm connect DOMAIN` or `wezterm start --domain DOMAIN --attach`.
---
---@param event "gui-attached"
---@param callback fun(domain: MuxDomain|ExecDomain)
function M.on(event, callback) end

---The `gui-startup` event is emitted once when the GUI server
---is starting up when running the `wezterm start` subcommand.
---
---If no explicit program was passed to `wezterm start`,
---and if the `gui-startup` event causes any panes to be created
---then those will take precedence
---over the default program configuration
---and no additional default program will be spawned.
---
---This event is useful for starting a set of programs in a
---standard configuration to save you the effort of doing it
---manually each time.
---
--- - It is triggered before any default program is started
--- - This event fires before `gui-attached`
--- - This event does not fire for `wezterm connect` invocations
--- - The event receives an optional `SpawnCommand` argument
---   that corresponds to any arguments that may have been passed
---   via `wezterm start`
---
---The intent is for you to use the information in the command object
---to spawn a new window, but you can choose to use or ignore it
---as suits your purpose.
---
---@param event "gui-startup"
---@param callback fun(cmd?: SpawnCommand)
function M.on(event, callback) end

---The `mux-is-process-stateful` event is emitted when the multiplexer layer
---wants to determine whether a given `Pane` can be closed without prompting the user.
---
---This event is synchronous and must return as quickly as possible
---in order to avoid blocking the multiplexer.
---
---The event is passed a `LocalProcessInfo` object representing the process
---that corresponds to the pane.
---
---The hook can return one of the following values:
--- - `true`: to indicate that this process tree is considered to be stateful
---         and that the user should be prompted before terminating the pane
--- - `false`: to indicate that the process tree can be terminated
---          without prompting the user
---
---Any other value means to use the default behavior,
---which is to consider the configuration option:
---[`skip_close_confirmation_for_processes_named`](lua://Config.skip_close_confirmation_for_processes_named)
---
---@param event "mux-is-process-stateful"
---@param callback fun(info: LocalProcessInfo): boolean
function M.on(event, callback) end

---The `mux-startup` event is emitted once when the mux server is starting up.
---
---It is triggered before any default program is started.
---
---If the `mux-startup` event causes any panes to be created then
---those will take precedence over the default program configuration
---and no additional default program will be spawned.
---
---This event is useful for starting a set of programs in a
---standard configuration to save you the effort of
---manually doing it each time.
---
---Example:
---
---```lua
---local wezterm = require 'wezterm'
---local mux = wezterm.mux
---
----- this is called by the mux server when it starts up.
----- It makes a window split top/bottom
---wezterm.on('mux-startup', function()
---  local tab, pane, window = mux.spawn_window {}
---  pane:split { direction = 'Top' }
---end)
---
---return {
---  unix_domains = {
---    { name = 'unix' },
---  },
---}
---```
---
---See also:
--- - [`wezterm.mux`](lua://Wezterm.Mux)
---
---@param event "mux-startup"
---@param callback function
function M.on(event, callback) end

--- - The first event parameter is a `Window` object that represents the GUI window
--- - The second event parameter is a `Pane` object that represents the active pane in the window
---
------
---The `"new-tab-button-click"` event is emitted when the user clicks on the
---`"new tab"` button in the tab bar.
---
---This is the `+` button that is drawn to the right of the last tab.
---
---Returning early with `false` in the callback will prevent the event handler from
---performing the default actions of the button pressed.
---
---For more information, see:
--- - [`Pane`](lua://Pane)
--- - [`Window`](lua://Window)
---
---@param event "new-tab-button-click"
---@param callback fun(window: Window, pane: Pane, button: "Left"|"Middle"|"Right", default_action?: Action): false|nil
function M.on(event, callback) end

--- - The first event parameter is a `Window` object that represents the GUI window
--- - The second event parameter is a `Pane` object that represents the pane
--- - The third event parameter is the URI string
---
------
---The `"open-uri"` event is emitted when
---the `CompleteSelectionOrOpenLinkAtMouseCursor` key/mouse assignment is triggered.
---
---The default action is to open the active URI in your browser,
---but if you register for this event and return early with `false`
---you can co-opt the default behavior.
---
---For more information, see:
--- - [`Pane`](lua://Pane)
--- - [`Window`](lua://Window)
---
---@param event "open-uri"
---@param callback fun(window: Window, pane: Pane, uri: string): false|nil
function M.on(event, callback) end

---This event is considered to be deprecated and you should migrate to using `"update-status"`,
---which behaves the same way, but doesn't overly focus on the right status area.
---
------
--- - The first event parameter is a `Window` object that represents the GUI window
--- - The second event parameter is a `Pane` object that represents the active pane in that window
---
---There is no defined return value for the event, but its purpose is
---to allow you the chance to carry out some activity and then ultimately call
---`Window:set_right_status()`.
---
---WezTerm will ensure that only a single instance of this event is outstanding;
---if the hook takes longer than the `config.status_update_interval` to complete,
---`wezterm` won't schedule another call until `config.status_update_interval` time
---has elapsed since the last call completed.
---
------
---The `"update-right-status"` event is emitted periodically
---(based on the interval specified by `config.status_update_interval`).
---
---For more information, see:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
--- - [`Window:set_right_status()`](lua://Window.set_right_status)
--- - [`config.status_update_interval`](lua://Config.status_update_interval)
---
---@param event "update-right-status"
---@param callback CallbackWindowPane
---@deprecated
function M.on(event, callback) end

--- - The first event parameter is a `Window` object that represents the GUI window
--- - The second event parameter is a `Pane` object that represents the active pane in that window
---
---There is no defined return value for the event, but its purpose is
---to allow you the chance to carry out some activity and then ultimately call
---`Window:set_left_status()`.
---
---WezTerm will ensure that only a single instance of this event is outstanding;
---if the hook takes longer than the `config.status_update_interval` to complete,
---`wezterm` won't schedule another call until `config.status_update_interval` time
---has elapsed since the last call completed.
---
------
---The `"update-left-status"` event is emitted periodically
---(based on the interval specified by `config.status_update_interval`).
---
---For more information, see:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
--- - [`Window:set_left_status()`](lua://Window.set_left_status)
--- - [`config.status_update_interval`](lua://Config.status_update_interval)
---
---@param event "update-status"
---@param callback CallbackWindowPane
function M.on(event, callback) end

---You can use something like the following from your shell
---to set the user var named `foo` to the value `bar`:
---
---```sh
---printf "\033]1337;SetUserVar=%s=%s\007" foo `echo -n bar | base64`
---```
---
---Then, if you have this in your config:
---
---```lua
---local wezterm = require 'wezterm'
---
---wezterm.on('user-var-changed', function(window, pane, name, value)
---  wezterm.log_info('var', name, value)
---end)
---
---return {}
---```
---
---your event handler will be called with `name = 'foo'` and `value = 'bar'`.
---
---For more info, see:
--- - [`Pane:get_user_vars()`](lua://Pane.get_user_vars)
---
------
---The `"user-var-changed"` event is emitted when a _user var escape sequence_
---is used to set a user var.
---
---@param event "user-var-changed"
---@param callback fun(window: Window, pane: Pane, name: string, value: string)
function M.on(event, callback) end

---This event is _fire-and-forget_ from the perspective of wezterm;
---it fires the event to advise of the config change, but has no other expectations.
---
---If you call `Window:set_config_overrides()` from inside this event callback
---then an additional `window-config-reloaded` event will be triggered.
---
---You should take care to avoid creating a loop by only calling `Window:set_config_overrides()`
---when the actual override values are changed.
---
--- - The first event parameter is a `Window` object that represents the GUI window
--- - The second event parameter is a `Pane` object that represents the active pane in that window
---
------
---The `"window-config-reloaded"` event is emitted when the configuration for
---a window has been reloaded.
---
---This can occur when the configuration file is detected as changed
---(when `config.automatically_reload_config` is enabled), when the configuration
---is explicitly reloaded via the `ReloadConfiguration` key action, and when
---`Window:set_config_overrides()` is called for the window.
---
---For more information, see:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
--- - [`Window:set_config_overrides()`](lua://Window.set_config_overrides)
--- - [`config.automatically_reload_config`](lua://Config.automatically_reload_config)
---
---@param event "window-config-reloaded"
---@param callback CallbackWindowPane
function M.on(event, callback) end

---This event is _fire-and-forget_ from the perspective of wezterm;
---it fires the event to advise of the config change, but has no other expectations.
---
--- - The first event parameter is a `Window` object that represents the GUI window
--- - The second event parameter is a `Pane` object that represents the active pane in that window
---
------
---The `"window-focus-changed"` event is emitted when the focus state
---for a window is changed.
---
---For more information, see:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
---
---@param event "window-focus-changed"
---@param callback CallbackWindowPane
function M.on(event, callback) end

--- - The first event parameter is a `Window` object that represents the GUI window
--- - The second event parameter is a `Pane` object that represents the active pane in that window
---
---The `"window-resized"` event is emitted when the window is resized
---and when transitioning between full-screen and regular windowed mode.
---
---The event is triggered asynchronously with respect to the potentially-ongoing
---live resize operation. `wezterm` will coalesce the stream of multiple events
---generated by a live resize such that there can be
---a maximum of 1 event executing and 1 event buffered.
---
---For more information, see:
--- - [`Window`](lua://Window)
--- - [`Pane`](lua://Pane)
---
---@param event "window-resized"
---@param callback CallbackWindowPane
function M.on(event, callback) end

---=============================== dev.wezterm =====================================

---This is for `dev.wezterm` only!
------
---Either no `hashkey` or an invalid one provided.
---
---@param event "dev.wezterm.invalid_hashkey" This is for `dev.wezterm` only!
---@param callback function
function M.on(event, callback) end

---This is for `dev.wezterm` only!
------
---Invalid options provided to plugin setup.
---
---@param event "dev.wezterm.invalid_opts" This is for `dev.wezterm` only!
---@param callback function
function M.on(event, callback) end

---This is for `dev.wezterm` only!
------
---No keywords were provided for searching the plugin.
---
---@param event "dev.wezterm.no_keywords" This is for `dev.wezterm` only!
---@param callback function
function M.on(event, callback) end

---This is for `dev.wezterm` only!
------
---The plugin was not found and thus `package.path` could not be set.
---
---@param event "dev.wezterm.require_path_not_set" This is for `dev.wezterm` only!
---@param callback function
function M.on(event, callback) end

---This is for `dev.wezterm` only!
------
---The provided keywords did not allow for the plugin to be found.
---
---@param event "dev.wezterm-plugin-not-found" This is for `dev.wezterm` only!
---@param callback function
function M.on(event, callback) end

---=================================================================================

---============================== modal.wezterm ====================================

---This is for `modal.wezterm only!`
---
---@param event "modal.enter"
---@param callback fun(name: string, window: Window, pane: Pane)
function M.on(event, callback) end

---This is for `modal.wezterm only!`
---
---@param event "modal.exit"
---@param callback fun(name: string, window: Window, pane: Pane)
function M.on(event, callback) end

---=================================================================================

---===================== smart_workspace_switcher.wezterm ==========================

---@param event "smart_workspace_switcher.workspace_switcher.chosen"
---@param callback fun(window: MuxWindow, workspace: string)
function M.on(event, callback) end

---@param event "smart_workspace_switcher.workspace_switcher.created"
---@param callback fun(window: MuxWindow, workspace: string)
function M.on(event, callback) end

---=================================================================================

---============================= tabsets.wezterm ===================================

---This is for `tabsets.wezterm` only!
---
---@param event "delete_tabset"
---@param callback fun(window: Window)
function M.on(event, callback) end

---This is for `tabsets.wezterm` only!
---
---@param event "load_tabset"
---@param callback fun(window: Window)
function M.on(event, callback) end

---This is for `tabsets.wezterm` only!
---
---@param event "rename_tabset"
---@param callback fun(window: Window)
function M.on(event, callback) end

---This is for `tabsets.wezterm` only!
---
---@param event "save_tabset"
---@param callback fun(window: Window)
function M.on(event, callback) end

---=================================================================================

---============================= wezterm-sessions ==================================

---This is for `wezterm-sessions` only!
---
---@param event "delete_session"
---@param callback fun(window: Window, pane: Pane)
function M.on(event, callback) end

---This is for `wezterm-sessions` only!
---
---@param event "edit_session"
---@param callback fun(window: Window, pane: Pane)
function M.on(event, callback) end

---This is for `wezterm-sessions` only!
---
---@param event "fork_session"
---@param callback fun(window: Window, pane: Pane)
function M.on(event, callback) end

---This is for `wezterm-sessions` only!
---
---@param event "load_session"
---@param callback fun(window: Window, pane: Pane)
function M.on(event, callback) end

---This is for `wezterm-sessions` only!
---
---@param event "restore_session"
---@param callback fun(window: Window)
function M.on(event, callback) end

---This is for `wezterm-sessions` only!
---
---@param event "save_session"
---@param callback fun(window: Window)
function M.on(event, callback) end

---This is for `wezterm-sessions` only!
---
---@param event "toggle_autosave"
---@param callback fun(window: Window)
function M.on(event, callback) end

---=================================================================================

---This function opens the specified `path_or_url` with
---either the specified application or the default application
---if `application` was not passed in.
---
---```lua
----- Opens a URL in your default browser
---wezterm.open_with('http://example.com')
---
----- Opens a URL specifically in firefox
---wezterm.open_with('http://example.com', 'firefox')
---```
---
---@param path_or_url string
---@param application? string
function M.open_with(path_or_url, application) end

---Returns a copy of a string `s` that is at least
---`min_width` columns as measured by `wezterm.column_width()`.
---
---If the string `s` is shorter than `min_width`, spaces are added
---to the left end of the string.
---
---For example, `wezterm.pad_left("o", 3)` returns `" o"`.
---
---See also:
--- - [`wezterm.column_width()`](lua://Wezterm.column_width)
--- - [`wezterm.truncate_left()`](lua://Wezterm.truncate_left)
--- - [`wezterm.pad_right()`](lua://Wezterm.pad_right)
---
---@param s string
---@param min_width integer
---@return string str
function M.pad_left(s, min_width) end

---Returns a copy of a string `s` that is at least
---`min_width` columns as measured by `wezterm.column_width()`.
---
---If the string `s` is shorter than `min_width`, spaces are added
---to the right end of the string.
---
---For example, `wezterm.pad_right("o", 3)` returns `"o "`.
---
---See also:
--- - [`wezterm.column_width()`](lua://Wezterm.column_width)
--- - [`wezterm.truncate_right()`](lua://Wezterm.truncate_right)
--- - [`wezterm.pad_left()`](lua://Wezterm.pad_left)
---
---@param s string
---@param min_width integer
---@return string str
function M.pad_right(s, min_width) end

---This function is intended to help with generating `KeyBinding` entries.
---These should apply regardless of the combination of modifier keys pressed.
---
---For each combination of modifiers, the supplied `table` value `T`
---is copied with a `mods = <value>` entry:
---
--- - `CTRL`
--- - `ALT`
--- - `SHIFT`
--- - `SUPER`
---
---An entry for `NONE` is **NOT** generated. This is the only difference
---between `wezterm.permute_any_or_no_mods()` `wezterm.permute_any_mods()`.
---
---Either a `KeyBinding` array or a `MouseBinding` is returned.
---
---See:
--- - [`KeyBinding`](lua://KeyBinding)
--- - [`MouseBinding`](lua://MouseBinding)
--- - [`wezterm.permute_any_or_no_mods()`](lua://Wezterm.permute_any_or_no_mods)
---
---@param T table
---@return (MouseBinding|KeyBinding)[] bindings
function M.permute_any_mods(T) end

---This function is intended to help with generating `KeyBinding` entries.
---These should apply regardless of the combination of modifier keys pressed.
---
---For each combination of modifiers (`CTRL`, `ALT`, `SHIFT` and `SUPER`)
---the supplied `table` value `T` is copied with a `mods = <value>` entry.
---In addition, an entry for `NONE` is generated. This is the only difference
---between `wezterm.permute_any_mods()` and `wezterm.permute_any_or_no_mods()`.
---
---A `KeyBinding` array is returned.
---
---If this is either the only binding or the last one, the resulting array
---can be unpacked into a Lua table initializer by using `table.unpack()`.
---
---See:
--- - [`KeyBinding`](lua://KeyBinding)
--- - [`table.unpack()`](lua://table.unpack)
--- - [`wezterm.permute_any_mods()`](lua://Wezterm.permute_any_mods)
---
---@param T table
---@return KeyBinding[] key_bindings
function M.permute_any_or_no_mods(T) end

---This function is intended to help with generating `MouseBinding` entries.
---These should apply regardless of the combination of modifier keys pressed.
---
---For each combination of modifiers (`CTRL`, `ALT`, `SHIFT` and `SUPER`),
---the supplied `table` value `T` is copied with a `mods = <value>` entry.
---
---In addition, an entry for `NONE` is generated. This is the only difference between
---`wezterm.permute_any_mods()` and `wezterm.permute_any_or_no_mods()`.
---
---A `MouseBinding` array is returned.
---
---If this is either the only binding or the last one, the resulting array
---can be unpacked into a Lua table initializer by using `table.unpack()`.
---
---See:
--- - [`MouseBinding`](lua://MouseBinding)
--- - [`table.unpack()`](lua://table.unpack)
--- - [`wezterm.permute_any_mods()`](lua://Wezterm.permute_any_mods)
---
---@param T table
---@return MouseBinding[] mouse_bindings
function M.permute_any_or_no_mods(T) end

---Returns an array containing the absolute file name paths of
---the directory `path` specified.
---
---Due to limitations in the Lua bindings, all of the paths must be able
---to be represented as `UTF-8` or this function will generate an error.
---
---@param path string
---@return string[] fire_paths
function M.read_dir(path) end

---Immediately causes the configuration to be reloaded and re-applied.
---
---**If you call this at the file scope in your config you are in danger of creating
---an infinite loop that renders WezTerm unresponsive.**
---
---The intent is for this to be used from an event or timer callback function.
---
function M.reload_configuration() end

---This function accepts an argument list; it will attempt to spawn that command.
---
---It will return a tuple consisting of the boolean `success` of the invocation,
---the `stdout` data and the `stderr` data.
---
---```lua
---local wezterm = require 'wezterm'
---local success, stdout, stderr = wezterm.run_child_process { 'ls', '-l' }
---```
---
---See also:
--- - [`wezterm.background_child_process()`](lua://Wezterm.background_child_process)
---
---@param args string[]
---@return boolean success A `boolean` to denote a successful invocation
---@return string stdout The `stdout` data as a `string`
---@return string stderr The `stderr` data as a `string`
function M.run_child_process(args) end

---This function returns a `boolean` indicating whether it is believed that WezTerm
---runs in a WSL container.
---
---In such an environment, `wezterm.target_triple` will indicate that the process
---is running in Linux with some slight differences in system behavior
---(such as filesystem capabilities) that you may wish to probe for in the configuration.
---
---```lua
---local wezterm = require 'wezterm'
---
---wezterm.log_error(
---  'System '
---  .. wezterm.target_triple
---  .. ' '
---  .. tostring(wezterm.running_under_wsl())
---)
---```
---
---See:
--- - [`wezterm.target_triple`](lua://Wezterm.target_triple)
---
---@return boolean wsl
function M.running_under_wsl() end

---Joins together its array arguments by applying POSIX-style shell quoting
---on each argument and then adding a space.
---
---@param args string[]
---@return string joined_args
function M.shell_join_args(args) end

---Quotes its single argument `s` using POSIX shell quoting rules.
---
---@param s string
---@return string quoted_arg
function M.shell_quote_arg(s) end

---Splits a command line into a `string` argument array in accordance with
---POSIX shell rules.
---
---@param line string
---@return string[] lines
function M.shell_split(line) end

---Suspends the execution of the script for `ms` milliseconds.
---When the time period has elapsed, the script continues running at the next statement.
---
---@param ms integer
function M.sleep_ms(ms) end

---Takes the input string and splits it by newlines.
---The result as an array of strings with the newlines removed.
---
---Both `\n` (LF) and `\r\n` (CRLF) are recognized as newlines.
---
---@param s string
---@return string[] lines
function M.split_by_newlines(s) end

---Formats the current local date/time into a string using the Rust `chrono strftime`
---syntax.
---
---@param format string
---@return string str
function M.strftime(format) end

---Formats the current UTC date/time into a string using the Rust `chrono strftime`
---syntax.
---
---@param format string
---@return string utc_str
function M.strftime_utc(format) end

---Returns a copy of a string that is no longer than `max_width` columns
---as measured by `wezterm.column_width()`.
---Truncation occurs by removing excess characters from the left end of the string.
---
---For example, `wezterm.truncate_left("hello", 3)` returns `"llo"`.
---
---See also:
--- - [`wezterm.column_width()`](lua://Wezterm.column_width)
--- - [`wezterm.truncate_right()`](lua://Wezterm.truncate_right)
--- - [`wezterm.pad_right()`](lua://Wezterm.pad_right)
---
---@param s string
---@param max_width integer
---@return string trunc_str
function M.truncate_left(s, max_width) end

---Returns a copy of a string that is no longer than `max_width` columns
---as measured by `wezterm.column_width()`.
---
---Truncation occurs by reemoving excess characters from the right end of the string.
---For example, `wezterm.truncate_right("hello", 3)` returns `"hel"`.
---
---See also:
--- - [`wezterm.truncate_left()`](lua://Wezterm.truncate_left)
--- - [`wezterm.pad_left()`](lua://Wezterm.pad_left)
--- - [`wezterm.column_width()`](lua://Wezterm.column_width)
---
---@param s string
---@param max_width integer
---@return string trunc_str
function M.truncate_right(s, max_width) end

---Overly specific and exists primarily to workaround this `wsl.exe` issue.
---It takes as input a string and attempts to convert it from utf16 to utf8.
---
---@param s string
---@return string str
function M.utf16_to_utf8(s) end

return M

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
