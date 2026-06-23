---@meta
---@diagnostic disable:unused-local

---@class Widgets.WidgetOpts
---@field color? string
---@field icon? string|false
---@field throttle? integer

---@class WidgetsOpts
---@field left? Widgets.Widget[]
---@field right? Widgets.Widget[]
---@field separator? { text?: string, color?: string }

---@class Widgets.Battery
---@field charge Widgets.Battery.Charge

---@class Widgets.CPU
---@field utilization Widgets.CPU.Utilization

---@class Widgets.Disk
---@field read Widgets.Disk.Read
---@field space Widgets.Disk.Space
---@field write Widgets.Disk.Write

---@class Widgets.Network
---@field download Widgets.Network.Download
---@field upload Widgets.Network.Upload

---@class Widgets.RAM
---@field utilization Widgets.RAM.Utilization

---@class Widgets.CPU.Utilization
local U = {}

---@param opts? WidgetsOpts
---@return Widgets.Widget widget
function U.widget(opts) end

---@class Widgets.Battery.Charge
local C = {}

---@param opts? WidgetsOpts
---@return Widgets.Widget widget
function C.widget(opts) end

---@class Widgets.Disk.Read
local R = {}

---@param opts? WidgetsOpts
---@return Widgets.Widget widget
function R.widget(opts) end

---@class Widgets.Disk.Space
local S = {}

---@param opts? WidgetsOpts
---@return Widgets.Widget widget
function S.widget(opts) end

---@class Widgets.Disk.Write
local Write = {}

---@param opts? WidgetsOpts
---@return Widgets.Widget widget
function Write.widget(opts) end

---@class Widgets.Network.Download
local D = {}

---@param opts? WidgetsOpts
---@return Widgets.Widget widget
function D.widget(opts) end

---@class Widgets.RAM.Utilization
local RU = {}

---@param opts? WidgetsOpts
---@return Widgets.Widget widget
function RU.widget(opts) end

---@class Widgets.Network.Upload
local Upload = {}

---@param opts? WidgetsOpts
---@return Widgets.Widget widget
function Upload.widget(opts) end

---@class Widgets.Widget
---@field opts Widgets.WidgetOpts
local W = {}

---@return string formatted
function W.get_text() end

---@return { [1]: { Foreground: string }, [2]: { Text: string } }
function W.get_formatted() end

---@class Widgets
---@field battery Widgets.Battery
---@field cpu Widgets.CPU
---@field disk Widgets.Disk
---@field network Widgets.Network
---@field ram Widgets.RAM
local M = {}

---@param config Config
---@param opts WidgetsOpts
function M.apply_to_config(config, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
