---@meta
---@diagnostic disable:unused-local

---@enum (key) Kanagawa.PaletteName
local scheme_names = { dragon = 1, lotus = 1, wave = 1 }

---Options for `apply_to_config`.
---
---@class KanagawaOpts
---Partial overrides deep-merged into the scheme.
---
---@field overrides? Palette
---Scheme name. Defaults to `"wave"`.
---
---@field scheme? Kanagawa.PaletteName

---@class Kanagawa
---Base Dragon preset (shared reference).
---
---@field dragon Palette
---Base Lotus preset (shared reference).
---
---@field lotus Palette
---Base Wave preset (shared reference).
---
---@field wave Palette
local M = {}

---Resolve a scheme (with optional overrides), register it in `config.color_schemes`
---under its display name, and set `config.color_scheme` to that name.
---
---This follows WezTerm's own precedence model: `color_scheme` wins over `colors`,
---so the user can still layer extra per-key tweaks through `config.colors` and
---they will act as overrides on top of the scheme.
---
---@param config Config WezTerm config builder.
---@param opts? KanagawaOpts Options table.
function M.apply_to_config(config, opts) end

---Return a **new** scheme table, optionally deep-merged with user overrides.
---The base preset is never mutated.
---
---@param name Kanagawa.PaletteName Scheme name: `"wave"`, `"lotus"`, or `"dragon"`.
---@param overrides? Palette Partial table, deep-merged into the cloned scheme.
---@return Palette scheme A fresh table suitable for `config.colors`.
function M.get(name, overrides) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
