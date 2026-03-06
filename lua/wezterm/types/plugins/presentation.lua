---@meta

---@class PresentationWezConfigMode
---@field enabled? boolean
---@field keybind? Key
---@field font_weight? FontWeight
---@field font_size_multiplier? number

---@class PresentationWezConfig
---@field presentation? PresentationWezConfigMode
---@field presentation_full? PresentationWezConfigMode
---@field font_weight? FontWeight
---@field font_size_multiplier? number

---@class PresentationWez
local M = {}

---@param config Config
---@param opts? PresentationWezConfig
---@return Config config
function M.apply_to_config(config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
