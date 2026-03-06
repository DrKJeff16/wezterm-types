---@meta
---@diagnostic disable:unused-local

---@class ListenersOpts
---Default options for state functions.
---
---@field function_options? Listeners.FunctionOpts
---@field toast_timeout? integer

---@generic T
---@class Listeners.EventListener
---@field error? boolean
---@field fn? fun(args: T[])
---@field info? boolean
---@field log_message? string
---@field max_time? integer
---Key of a stored function in the state.
---
---@field state_fn? string
---@field toast_arg? integer
---@field toast_message? string
---@field warn? boolean

---@alias Listeners.EventListeners table<string, Listeners.EventListener[]|Listeners.EventListener>

---@class Listeners.InternalState
---@field counters table<string, integer>
---@field data table<string, any>
---@field flags table<string, boolean>
---@field functions table<string, function>

---@class Listeners.Flags
local G = {}

---@param key string
---@return boolean
function G.get(key) end

---@param key string
function G.remove(key) end

---@param key string
---@param value boolean
---@return boolean
function G.set(key, value) end

---@param key string
---@return boolean
function G.toggle(key) end

---@class Listeners.Data
local D = {}

---@param key string
---@return any data
function D.get(key) end

---@param key string
function D.remove(key) end

---@param key string
---@param value any
---@return any new_data
function D.set(key, value) end

---@class Listeners.Counters
local C = {}

---@param key string
---@param decrement integer
---@return integer @ If no value is provided default to `1`.
function C.decrement(key, decrement) end

---@param key string
---@return integer
function C.get(key) end

---@param key string
---@param increment? integer
---@return integer @ If no value is provided default to `1`.
function C.increment(key, increment) end

---@param key string
function C.remove(key) end

---@param key string
---@param value? integer
---@return integer @ If no value is provided default to `0`.
function C.set(key, value) end

---@class Listeners.FunctionOpts
---Whether to use safe execution with error handling (default: `true`).
---
---@field safe? boolean
---Timeout setting (currently not enforced due to WezTerm limitations).
---
---@field timeout? integer

---@class Listeners.FunctionCallResult
---Error message (if not successful).
---
---@field error? string
---The result of the function call (if successful).
---
---@field result any
---Whether the function executed successfully.
---
---@field success boolean
---Whether the function timed out.
---
---@field timed_out? boolean

---@class Listeners.Functions
local F = {}

---Call a function with variable arguments, returns result and error.
---
---@param key string
---@param ... any
---@return any result
---@return string|nil error
function F.call(key, ...) end

---@param key string
---@return boolean exists
function F.exists(key) end

---@param key string
---@return function func
function F.get(key) end

---Get the options for a function.
---
---@param key string
---@return Listeners.FunctionOpts|nil opts
function F.get_options(key) end

---@param key string
function F.remove(key) end

---Safe call with full result object.
---
---@param key string
---@param ... any
---@return Listeners.FunctionCallResult result
function F.safecall(key, ...) end

---@param key string
---@param value function
---@param options? Listeners.FunctionOpts
---@return function func
function F.set(key, value, options) end

---@class Listeners.State: Listeners.InternalState
---@field counters Listeners.Counters
---@field data Listeners.Data
---@field flags Listeners.Flags
---@field functions Listeners.Functions

---@class Listeners
---@field state Listeners.State
local M = {}

---@param event_listeners Listeners.EventListeners
---@param opts ListenersOpts
function M.config(event_listeners, opts) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
