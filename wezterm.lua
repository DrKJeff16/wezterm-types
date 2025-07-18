-- Pull in the wezterm API

---@module 'types'

---@type Wezterm
local wezterm = require("wezterm")

-- This will hold the configuration.
---@type Config
local config = wezterm.config_builder()

---@type Config
local config = {}

-- if wezterm.config_builder then
config = wezterm.config_builder()
-- end

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

-- TODO: look into other features for fonts https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist
-- config.font = wezterm.font 'Fira Code Nerd Font'
-- config.font = wezterm.font('Fira Code Nerd Font', { weight = 'Medium', italic = false, stretch= 'Normal' })
-- config.font = wezterm.font('Fira Code Nerd Font Propo', { weight = 'Medium', italic = false, stretch= 'Normal' })

-- The filled in variant of the < symbol
-- local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol
-- local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

-- wezterm.on( 'format-tab-title', function(tab, tabs, panes, config, hover, max_width)
--   local edge_background = '#0b0022'
--   local background = '#1b1032'
--   local foreground = '#808080'

--   if tab.is_active then
--     background = '#2b2042'
--     foreground = '#c0c0c0'
--   elseif hover then
--     background = '#3b3052'
--     foreground = '#909090'
--   end

--   local edge_foreground = background

-- -- ensure that the titles fit in the available space
-- -- and that we have room for the edges.
-- local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)
-- local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)
-- local t = wezterm.truncate_right(tab.active_pane.pane_id, max_width - 2)

--   return {
--     { Background = { Color = edge_background } },
--     { Foreground = { Color = edge_foreground } },
--     { Text = SOLID_LEFT_ARROW },
--     { Background = { Color = background } },
--     { Foreground = { Color = foreground } },
--     { Text = title },
--     { Background = { Color = edge_background } },
--     { Foreground = { Color = edge_foreground } },
--     { Text = SOLID_RIGHT_ARROW },
--   }
-- end
-- )
