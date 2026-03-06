---@meta
---@diagnostic disable:unused-local

---Orientation enum for panes.
---
---@enum (key) Orientation
local orientation = {
  horizontal = 1,
  unknown = 1,
  vertical = 1,
}

---@enum (key) LoggerLevel
local log_level = {
  debug = 1,
  error = 1,
  info = 1,
  warn = 1,
}

---Process information returned from `get_pane_process()`.
---
---@class LibWeztermProcessInfo
---Process arguments (if available).
---
---@field args string[]
---Current working directory if available.
---
---@field cwd string
---Whether this appears to be a shell process.
---
---@field is_shell boolean
---The process name.
---
---@field name string
---Process ID if available.
---
---@field pid? integer

---@class LibWezterm.Table
local T = {}

---Deep copy.
---
---@generic T
---@param original T<table>
---@return T<table> copy
function T.deepcopy(original) end

---shallow copy.
---
---@generic T
---@param original T<table>
---@return T<table> copy
function T.shallowcopy(original) end

-- extend table
---@param behavior Behavior
---@param ... table
---@return table|nil new_tbl
function T.tbl_deep_extend(behavior, ...) end

---@class LibWezterm.FileIO
local F = {}

---Create the folder if it does not exist.
---
---@param path string
---@return boolean|nil success
---@return number|nil signal
function F.ensure_folder_exists(path) end

---Execute a cmd and return its stdout.
---
---@param cmd string command
---@return boolean success result
---@return string|nil error
function F.execute(cmd) end

---Read a file and return its content.
---
---@param file_path string full filename
---@return boolean success result
---@return string|nil content_or_error
function F.read_file(file_path) end

---Write a file with the content of a string.
---
---@param file_path string full filename
---@param str string content to write
---@return boolean success result
---@return string|nil error
function F.write_file(file_path, str) end

---@class LibWezterm.Math

---@class LibWezterm.String
local S = {}

---Generate a hash from an array by concatenating elements with commas
---then applying the DJB2 hashing algorithm.
--
---@generic T
---@param arr T[] Array of values to hash
---@return string hashkey Hexadecimal representation of the hash
function S.array_hash(arr) end

---Get basename for dir/file.
---
---@param str string string with the dir/file
---@return string|nil basename
function S.basename(str) end

---WezTerm module name decoder.
---
---@param encoded string
---@return string decoded_str
function S.decode_wezterm_dir(encoded) end

---Compute a hash key from a string using the DJB2 algorithm (Dan Bernstein).
---The DJB2 is a simple and fast non-cryptographic hash function.
---
---Formula: `hash = ((hash << 5) + hash) + c = hash * 33 + c`
---
---Starting value `5381` is a prime number chosen by Dan Bernstein for the algorithm.
---
---@param str string Input string to hash
---@return string hashkey Hexadecimal representation of the hash
function S.hash(str) end

---Helper function to normalize path separator to `/`.
---
---@param str string string with path
---@return string normalized_path
function S.norm_path(str) end

---Replace the center of a string with another string.
---
---@param str string String to be modified
---@param len integer Length to be removed from the middle of str
---@param pad string String that must be inserted in place of the missing part of str
---@return string new_str Modified string with center replaced
function S.replace_center(str, len, pad) end

---Helper function to remove formatting esc sequences in the string.
---
---@param str string Input string that may contain ANSI escape sequences
---@return string clean_str Clean string with escape sequences removed
function S.strip_format_esc_seq(str) end

---Returns the length of a UTF-8 string, correctly counting multi-byte characters.
---
---@param str string UTF-8 encoded string
---@return integer len Count of UTF-8 characters (not bytes)
function S.utf8len(str) end

---@class LibWezterm.Wezterm
local W = {}

---Capture scrollback buffer from a pane.
---
---@param pane Pane WezTerm pane object
---@param max_lines? integer Maximum number of lines to capture (`nil` for all available)
---@return string|nil scrollback
function W.capture_scrollback(pane, max_lines) end

---Get current working directory from a pane.
---
---@param pane Pane WezTerm pane object
---@return string cwd
function W.get_cwd(pane) end

---Determines the process running in a pane.
---
---@param pane Pane WezTerm pane object
---@param shell_list? string[] Optional list of shell names to check against
---@return LibWeztermProcessInfo procinfo
function W.get_pane_process(pane, shell_list) end

---Determines if two panes are adjacent and their split orientation.
---
---@param pane1 Pane WezTerm pane object
---@param pane2 Pane WezTerm pane object
---@return boolean is_adjacent
---@return Orientation orientation
function W.get_panes_orientation(pane1, pane2) end

---@class LibWezterm.LoggerOpts
---@field debug_enabled boolean
---@field prefix string

---Logger module providing consistent logging with customizable prefix and debug level control.
---
---@class LibWezterm.Logger
---Whether debug messages should be displayed.
---
---@field debug_enabled boolean
---The prefix to prepend to all log messages.
---
---@field prefix string
local L = {}

---Create a new logger instance.
---
---@param opts LibWezterm.LoggerOpts
---@return LibWezterm.Logger logger
function L.new(opts) end

---Log a debug message (only if debug is enabled).
---
---@param ... any
function L:debug(...) end

---Disable debug mode for this logger.
---
---@return LibWezterm.Logger logger
function L:disable_debug() end

---Enable debug mode for this logger.
---
---@return LibWezterm.Logger logger
function L:enable_debug() end

---Log an error message.
---
---@param ... any
function L:error(...) end

---Log an info message.
---
---@param ... any
function L:info(...) end

---Log a message at the specified level.
---
---@param level LoggerLevel
---@param ... any
function L:log(level, ...) end

---Set the prefix for this logger.
---
---@param prefix string
---@return LibWezterm.Logger logger
function L:set_prefix(prefix) end

---Log a warning message.
---
---@param ... any
function L:warn(...) end

---@enum (key) LibWezterm.Env.Separator
local separator = {
  ["/"] = 1,
  ["\\"] = 1,
}

---@class LibWezterm.Env
---@field home string
---@field is_mac boolean
---@field is_windows boolean
---@field separator LibWezterm.Env.Separator

---@class LibWezterm
---@field env LibWezterm.Env
---@field file_io LibWezterm.FileIO
---@field logger LibWezterm.Logger
---@field math LibWezterm.Math
---@field string LibWezterm.String
---@field table LibWezterm.Table
---@field wezterm LibWezterm.Wezterm

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
