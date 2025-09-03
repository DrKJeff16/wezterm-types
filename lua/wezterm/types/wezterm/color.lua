---@meta

--TODO: finish

---@class ImageExtractorParams
---@field fuzziness? number
---@field num_colors? number
---@field max_width? number
---@field max_height? number
---@field min_brightness? number
---@field max_brightness? number
---@field threshold? number
---@field min_contrast? number

---The `wezterm.color` module exposes functions that work with colors.
---
---@class Wezterm.Color
local C = {}

---This function loads an image from the specified filename
---and analyzes it to determine a set of distinct colors present
---in the image, ordered by how often a given color is found
---in the image, descending.
---
---For example, if an image is predominantly black with
---a bit of white, then `black` will be listed first
---in the returned array.
---
---This is potentially useful if you wish to generate
---a color scheme to match an image, for example.
---
---The default is to extract 16 colors from an image.
---
---For more info on the parameters you can use, see:
--- - [`ImageExtractorParams`](lua://ImageExtractorParams)
---
--- ---
---The analysis is relatively expensive and can take
---several seconds if used on a full 4K image file.
---To reduce the runtime, WezTerm will by default
---scale the image down and skip over nearby pixels.
---The results of the analysis will be cached to avoid
---repeating the same work each time the configuration
---is re-evaluated.
---
---You can find more examples [here](https://wezterm.org/config/lua/wezterm.color/extract_colors_from_image.html).
---
---@param filename string
---@param params? ImageExtractorParams
---@return string[]
function C.extract_colors_from_image(filename, params) end

---Constructs a new [`Color`](lua://Color)
---object from values in the HSL colorspace,
---plus `alpha`.
---
---[`wezterm.color.parse()`](lua://Wezterm.Color.parse) is
---a useful source for info on parsing.
---
---@param h string|number
---@param s string|number
---@param l string|number
---@param a string|number
---@return Color
function C.from_hsla(h, s, l, a) end

---Returns a Lua table keyed by color scheme name,
---whose values are the color scheme definition
---of the builtin color schemes.
---
---This is useful for programmatically deciding things
---about the scheme to use based on its color,
---or for taking a scheme and overriding a couple of entries
---just from your `wezterm.lua` configuration file.
---
---@return table<string, Palette>
function C.get_builtin_schemes() end

---Returns the set of colors that would be used by default.
---
---This is useful if you want to reference those colors
---in a color scheme definition.
---
---@return Palette
function C.get_default_colors() end

---Given a gradient spec and a number of colors,
---returns a table holding that many colors spaced evenly
---across the range of the gradient.
---
---Returns an array of tables of type
---[`Color`](lua://Color).
---
---This is useful, for example, to generate colors for tabs
---or to do something fancy like interpolating colors
---across a gradient based on the time of the day.
---
---`gradient` is any [`Gradient`](lua://Gradient)
---allowed by the `config.window_background_gradient` option.
---
---See:
--- - [`config.window_background_gradient`](lua://Config.window_background_gradient)
---
---@param gradient Gradient
---@param num_colors number
---@return Color[]
function C.gradient(gradient, num_colors) end

---Loads a YAML file in `base16` format and returns it
---as a WezTerm color scheme.
---
---Note that wezterm ships with the `base16` color schemes
---that were referenced via [base16-schemes-source](https://github.com/chriskempson/base16-schemes-source)
---when the release was prepared, so this function is primarily useful
---if you want to import a `base16` color scheme that either
---isn't listed from the main list, or that was created
---after your version of wezterm was built.
---
---This function returns a tuple of the
---the color definitions and the metadata.
---
---@param file_name string
---@return Palette
---@return ColorSchemeMetaData
function C.load_base16_scheme(file_name) end

---Loads a wezterm color scheme from a TOML file.
---
---This function returns a tuple of the the color definitions
---and the metadata.
---
---See:
--- - [`Palette`](lua://Palette)
--- - [`ColorSchemeMetaData`](lua://ColorSchemeMetaData)
---
---@param file_name string
---@return Palette scheme
---@return ColorSchemeMetaData metadata
function C.load_scheme(file_name) end

---Loads a json file exported from [`terminal.sexy`](https://terminal.sexy/)
---and returns it as a wezterm color scheme.
---
---Note that wezterm ships with all of the pre-defined `terminal.sexy` color schemes,
---so this function is primarily useful if you want to design a color scheme
---using `terminal.sexy` and then import it to wezterm.
---
---This function returns a tuple of the the color definitions and the metadata.
---
---See:
--- - [`Palette`](lua://Palette)
--- - [`ColorSchemeMetaData`](lua://ColorSchemeMetaData)
---
---@param file_name string
---@return Palette colors
---@return ColorSchemeMetaData metadata
function C.load_terminal_sexy_scheme(file_name) end

---Parses the passed color and returns a
---[`Color`](lua://Color) object.
---
---`Color` objects evaluate as strings
---but have a number of methods that allow
---transforming and comparing colors.
---
---```lua
---local wezterm = require 'wezterm'
---
---local fg = wezterm.color.parse 'yellow'
---local bg = fg:complement_ryb():darken(0.2)
---
---return {
---  colors = {
---    foreground = fg,
---    background = bg,
---  },
---}
---```
---
---@param color_name string
---@return Color color
function C.parse(color_name) end

---Saves a color scheme as a wezterm TOML file.
---
---This is useful when sharing your custom
---color scheme with others.
---
---While you could share the Lua representation
---of the scheme, the TOML file is recommended
---for sharing as it is purely declarative:
---no executable logic is present in the
---TOML color scheme which makes it safe
---to consume "random" schemes from the internet.
---
---You may find examples [here](https://wezterm.org/config/lua/wezterm.color/save_scheme.html).
---
function C.save_scheme(colors, metadata, file_name) end
