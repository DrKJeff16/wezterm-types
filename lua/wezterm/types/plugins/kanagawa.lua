---@meta
---@diagnostic disable:unused-local

---@alias Kanagawa.PaletteName "dragon"|"lotus"|"wave"

---Role-based overrides for `kanagawa.apply_by_appearance()`.
---
---See:
--- - [`kanagawa.apply_by_appearance()`](lua://Kanagawa.apply_by_appearance)
---
---@class kanagawa.AppearanceOverrides
---Overrides applied when the dark role is selected.
---
---@field dark? Palette
---Overrides applied when the fallback role is selected.
---
---@field fallback? Palette
---Overrides applied when the light role is selected.
---
---@field light? Palette

---Options for `kanagawa.apply_by_appearance()`.
---
---See:
--- - [`kanagawa.apply_by_appearance()`](lua://Kanagawa.apply_by_appearance)
---
---@class kanagawa.AppearanceApplyOpts
---Explicit appearance string for testing or manual selection.
---
---@field appearance? string
---Scheme name used for dark appearances.
---
---Defaults to `"wave"`.
---
---@field dark? string
---Scheme name used when appearance is unknown.
---
---Defaults to `"wave"`.
---
---@field fallback? string
---Scheme name used for light appearances.
---
---Defaults to `"lotus"`.
---
---@field light? string
---Role-based overrides.
---
---@field overrides? kanagawa.AppearanceOverrides

---Options for `kanagawa.register()`.
---
---See:
--- - [`kanagawa.register()`](lua://Kanagawa.register)
---
---@class kanagawa.RegisterOpts
---Partial overrides deep-merged into every scheme.
---
---@field overrides? Palette
---Per-scheme overrides keyed by scheme name.
---
---@field scheme_overrides? table<string, Palette>

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

---@param config Config
---@param opts? kanagawa.AppearanceApplyOpts Options table.
function M.apply_by_appearance(config, opts) end

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

---Register all Kanagawa schemes in `config.color_schemes` without activating
---one through `config.color_scheme`.
---
---`opts.overrides` applies to every registered scheme. `opts.scheme_overrides`
---can apply additional per-scheme overrides keyed by `wave`, `dragon`, or `lotus`;
---per-scheme overrides win over global overrides.
---
---@param config Config
function M.register(config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
