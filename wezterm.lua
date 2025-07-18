-- Pull in the wezterm API

---@module 'types'

---@type Wezterm
local wezterm = require("wezterm")

-- This will hold the configuration.
---@type Config
local config = wezterm.config_builder()

-- or, changing the font size and color scheme.
config.font_size = 18
config.font = wezterm.font("FiraCode Nerd Font Mono")

config.harfbuzz_features = {
    "calt=1",
    "clig=1",
    "liga=1",
    "zero",
    "onum",
    "ss1",
    "ss2",
    "ss3",
    "ss4",
    "ss5",
    "ss6",
    "ss7",
    "ss8",
    "ss9",
    "ss10",
    "cv01",
    "cv02",
    "cv03",
    "cv04",
    "cv05",
    "cv06",
    "cv07",
    "cv08",
    "cv09",
    "cv10",
    "cv11",
    "cv12",
    "cv13",
    "cv14",
    "cv15",
    "cv16",
    "cv17",
    "cv18",
    "cv19",
    "cv20",
    "cv21",
    "cv22",
    "cv23",
    "cv24",
    "cv25",
    "cv26",
    "cv27",
    "cv28",
    "cv29",
    "cv30",
    "cv31",
}

config.audible_bell = "Disabled"
config.window_background_opacity = 0.90
config.scrollback_lines = 10000
config.color_scheme = "Monokai Vivid"
config.exit_behavior = "Close"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.default_cursor_style = "BlinkingBlock"

config.color_scheme = "Tokyo Night Storm (Gogh)"

return config
