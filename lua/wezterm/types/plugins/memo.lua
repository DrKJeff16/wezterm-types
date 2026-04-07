---@meta
---@diagnostic disable:unused-local

---@class Memo.Cache.Namespace
---@field _prefix string

---@class Memo.CacheOpts
---Whether to log debug messages.
---
---@field debug? boolean
---Eviction policy when max_entries reached ("expire-first").
---
---@field eviction? string
---Max number of cache entries; `nil` == unlimited.
---
---@field max_entries? integer|nil
---Whether to track hit/miss statistics.
---
---@field stats? boolean
---TTL configuration; `nil` == disabled.
---
---@field ttl? table|nil
local CO = {}

---@return integer time
function CO.clock() end

---@class Memo.Cache
local C = {}

---Ensure a key in `wezterm.GLOBAL` is a table and recursively fill defaults.
---
---@param key string
---@param template table
---@return table
function C._ensure_global_tbl(key, template) end

---Reset all configuration to defaults.
---
---Intended for test teardown; not part of the normal public API.
---
function C._reset_config() end

---Recursively assign data into a `wezterm.GLOBAL`-backed table.
---
---@param target table
---@param source table
function C._sync_to_global(target, source) end

---Clear cache entries.
---
---Without arguments, clears the entire cache.
---
---With a selector table:
--- - `{ prefix = "foo" }` — Deletes all keys starting with `"foo"`.
--- - `{ older_than = N }` — Deletes entries older than `N` seconds (TTL mode).
---
---@param selector table|nil
function C.clear(selector) end

---Execute a function and cache its result using an argument-derived key.
---
---Generates a deterministic key from `name` plus the serialised arguments,
---checks the cache first, and only calls `fn(...)` on miss.
---
---@param name string Namespace or context identifier.
---@param fn fun(...: any): any Function to execute on cache miss.
---@param ... any Parameters to be passed to `fn`.
---@return any result Cached or freshly computed result.
function C.compute(name, fn, ...) end

---Configure the cache.
---Merges the provided options into the current configuration.
---
---Pass `false` for nullable fields (`ttl`, `max_entries`) to explicitly disable them.
---
---@param opts Memo.CacheOpts  Partial config table (see `memo.cache.Config` fields).
function C.configure(opts) end

---Delete a single cache entry.
---
---@param key string Cache key.
function C.delete(key) end

---Mark a key as expired immediately.
---
---Will no-op when TTL is disabled.
---
---@param key string Cache key.
function C.expire(key) end

---Retrieve a cached value.
---
---@param key string  Cache key.
---@return any|nil value Stored value or `nil`.
function C.get(key) end

---Check whether a key exists and is fresh.
---
---@param key string Cache key.
---@return boolean has
function C.has(key) end

---Check whether a cached entry is still fresh.
---
---Always returns `true` when TTL is disabled (entries never expire).
---
---@param key string Cache key.
---@return boolean
function C.is_fresh(key) end

---Return all cache keys, optionally filtered.
---
---@param selector? table `{ prefix = "foo" }` to filter.
---@return string[] keys
function C.keys(selector) end

---Create a namespaced cache wrapper.
---
---All keys are automatically prefixed with `name .. ":"`.
---
---The returned wrapper exposes the same API as `Memo.Cache` but scoped to the prefix.
---
---@param name string Namespace identifier.
---@return Memo.Cache.Namespace namespace
function C.namespace(name) end

---Store a value in the cache.
---
---Functions cannot be stored in `wezterm.GLOBAL`. Attempting to store a function
---will log an error and return without writing.
---
---@param key string Cache key.
---@param value any Value to store (must not be a function).
---@param opts Memo.CacheOpts|nil Per-call options `{ ttl = N }`.
function C.set(key, value, opts) end

---Return cache statistics.
---
---Only meaningful when `configure({ stats = true })` has been called.
---
---Returns a table with `hits`, `misses`, `evictions`, and `entries`.
---
---@return table stats
function C.stats() end

---Reset the TTL on an existing key (bump its expiry to now + default TTL).
---
---Will no-op when TTL is disabled or when the key does not exist.
---
---@param key string Cache key.
function C.touch(key) end

---@class Memo.Key
local K = {}

---Generate a deterministic cache key from a name and variadic arguments.
---
---String arguments are included verbatim; all other types are serialized.
---Parts are joined with `|`.
---
---@param name string Namespace or context identifier.
---@param ... any Parameters for the cached computation.
---@return string key Deterministic cache key.
function K.make_cache_key(name, ...) end

---Serialize any Lua value into a deterministic string representation.
---
---Tables are serialized recursively with sorted keys.
---Cyclic references produce the sentinel `"<cycle>"` instead of looping.
---
---@param v any
---@param seen? table<table, boolean> Cycle-detection set (internal).
---@return string representation
function K.serialize(v, seen) end

---@class Memo.State.Store
---Use background_task for writes if available.
---
---@field _async boolean
---Load from disk on first access.
---
---@field _auto_load boolean
---Flush to disk on every mutation.
---
---@field _auto_save boolean
---Absolute path to the JSON file.
---
---@field _path string
---Reference into `wezterm.GLOBAL` slot (`{ loaded, data }`).
---
---@field _store table
local ST = {}

---Clear all entries.
---
function ST:clear() end

---Delete a single key.
---
---@param key string
function ST:delete(key) end

---Retrieve a value by key.
---
---@param key string
---@return any
function ST:get(key) end

---Check whether a key exists.
---
---@param key string
---@return boolean has
function ST:has(key) end

---Load state from the JSON file on disk.
---
---This always reads from disk (bypasses the load guard) and marks the store
---as loaded so subsequent `ensure_loaded` calls are no-oped.
---
function ST:load() end

---Return a shallow copy of all stored data.
---
---@return table data
function ST:restore() end

---Flush current state to disk as JSON.
---
---Uses `wezterm.background_task` when available and `async` is enabled;
---otherwise writes synchronously.
---
function ST:save() end

---Store a value.
---
---Keys must be strings due to limitations from JSON.
---Functions cannot be persisted.
---
---@param key string
---@param value any
function ST:set(key, value) end

---@class Memo.State.StoreOpts
---Use `background_task` when available.
---
---Defaults to `true`.
---
---@field async? boolean
---Load from disk on first access.
---
---Defaults to `true`.
---
---@field auto_load? boolean
---Write to disk on every mutation.
---
---Defaults to `true`.
---
---@field auto_save? boolean
---Absolute path to the JSON file.
---
---@field path string

---@class Memo.State
local S = {}

---Create a new file-persistent state store.
---
---@param opts Memo.State.StoreOpts Options:
---@return Memo.State.Store store
function S.new(opts) end

---@class Memo
---Session-scoped memoization cache (`wezterm.GLOBAL`).
---
---See:
--- - [`wezterm.GLOBAL`](lua://Wezterm.GLOBAL)
---
---@field cache Memo.Cache
---Serialization and key generation utilities.
---
---@field key Memo.Key
---File-persistent key/value store factory.
---
---@field state Memo.State

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
