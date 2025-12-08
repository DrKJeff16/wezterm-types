---@meta

---`Color` objects can be created by calling
---[`wezterm.color.parse()`](lua://Wezterm.Color.parse)
---and may also be returned by various
---wezterm functions and methods.
---
---They represent a color that is internally stored
---in `SRGBA` format.
---
---@class Color
local Color = {}

---Adjust the hue angle by the specified number of degrees.
---
---180 degrees gives the complementary color.
---Three colors separated by 120 degrees form the triad.
---Four colors separated by 90 degrees form the square.
---
---@param self Color
---@param degrees number
---@return Color adjusted_color
function Color:adjust_hue_fixed(degrees) end

---Adjust the hue angle by the specified number of degrees.
---
---This method uses the `RYB` color model,
---which more closely matches how artists think of
---mixing colors and which is sometimes referred to
---as the _"artist's color wheel"_.
---
---180 degrees gives the complementary color.
---Three colors separated by 120 degrees form the triad.
---Four colors separated by 90 degrees form the square.
---
---@param self Color
---@param degrees number
---@return Color adjusted_color
function Color:adjust_hue_fixed_ryb(degrees) end

---Returns the complement of the color.
---
---The complement is computed by converting to `HSL`,
---rotating by 180 degrees and converting back to `RGBA`.
---
---@param self Color
---@return Color complement
function Color:complement() end

---Returns the complement of the color using
---the `RYB` color model, which more closely matches
---how artists think of mixing colors.
---
---The complement is computed by converting to `HSL`,
---converting the hue angle to the equivalent `RYB` angle,
---rotating by 180 degrees and and then converting back to `RGBA`.
---
---@param self Color
---@return Color ryb_complement
function Color:complement_ryb() end

---Computes the contrast ratio between the two colors.
---
---The contrast ratio is computed by first
---converting to `HSL`, taking the `L` components,
---and dividing the lighter one by the darker one.
---
---A contrast ratio of `1` means _no contrast_.
---
---Note: The maximum possible contrast ratio is `21`.
---
---@param self Color
---@param other Color
---@return number ratio
function Color:contrast_ratio(other) end

---Scales the color towards the minimum lightness
---by the provided factor, which should be
---in the range `0.0` through `1.0`.
---
---@param self Color
---@param amount number
---@return Color darker_color
function Color:darken(amount) end

---Decrease the lightness by `amount`,
---a value ranging from `0.0` to `1.0`.
---
---@param self Color
---@param amount number
---@return Color darker_color
function Color:darken_fixed(amount) end

---Computes the `CIEDE2000` `DeltaE` value
---representing the difference between
---the two colors.
---
---@param self Color
---@param other Color
---@return number value
function Color:delta_e(other) end

---Scales the color towards the minimum saturation
---by the provided factor, which should be
---in the range `0.0` through `1.0`.
---
---@param self Color
---@param amount number
---@return Color desaturated
function Color:desaturate(amount) end

---Decrease the saturation by `amount`,
---a value ranging from `0.0` to `1.0`.
---
---@param self Color
---@param amount number
---@return Color desaturated
function Color:desaturate_fixed(amount) end

---Converts the color to the `HSL` colorspace and
---returns those values + `alpha`.
---
---@param self Color
---@return number h
---@return number s
---@return number l
---@return number alpha
function Color:hsla() end

---Converts the color to the `LAB` colorspace and
---returns those values + `alpha`.
---
---@param self Color
---@return number l
---@return number a
---@return number b
---@return number alpha
function Color:laba() end

---Scales the color towards the maximum lightness
---by the provided factor, which should be
---in the range `0.0` through `1.0`.
---
---@param self Color
---@param amount number
---@return Color lighter_color
function Color:lighten(amount) end

---Increase the lightness by `amount`, a value
---ranging from `0.0` to `1.0`.
---
---@param self Color
---@param amount number
---@return Color lighter_color
function Color:lighten_fixed(amount) end

---Returns a tuple of the colors converted to
---linear `RGBA` and expressed as
---floating point numbers in the range `0.0-1.0`.
---
---@param self Color
---@return number r
---@return number g
---@return number b
---@return number alpha
function Color:linear_rgba() end

---Scales the color towards the maximum saturation
---by the provided factor, which should be
---in the range `0.0` through `1.0`.
---
---@param self Color
---@param amount number
---@return Color saturated
function Color:saturate(amount) end

---Increase the saturation by amount, a value
---ranging from `0.0` to `1.0`.
---
---@param self Color
---@param amount number
---@return Color saturated
function Color:saturate_fixed(amount) end

---Returns the other three colors that form a square.
---The other colors are `90` degrees apart
---on the `HSL` color wheel.
---
---@param self Color
---@return Color a
---@return Color b
---@return Color c
function Color:square() end

---Returns a tuple of the internal `SRGBA` colors
---expressed as unsigned 8-bit integers in
---the range `0-255`.
---
---@param self Color
---@return integer r
---@return integer g
---@return integer b
---@return integer alpha
function Color:srgb_u8() end

---Returns the other two colors that form a triad.
---
---The other colors are at +/- 120 degrees in the `HSL` color wheel.
---
---@param self Color
---@return Color a
---@return Color b
function Color:triad() end

-- vim:ts=4:sts=4:sw=4:et:ai:si:sta:
