---@meta
---@diagnostic disable:unused-local

---@class Resurrect.EncryptionOpts
---@field enable boolean
---@field method string
---@field private_key? string
---@field public_key? string
local E = {}

---@param file_path string
---@return string stdout
function E.decrypt(file_path) end

---@param file_path string
---@param lines string
function E.encrypt(file_path, lines) end

---@class Resurrect.TabSize
---@field cols integer
---@field dpi integer
---@field pixel_height integer
---@field pixel_width integer
---@field rows integer

---@class Resurrect.WorkspaceState
---@field window_states Resurrect.WindowState[]
---@field workspace string

---@class Resurrect.WindowState
---@field size Resurrect.TabState
---@field tabs Resurrect.TabState[]
---@field title string
---@field workspace string

---@class Resurrect.PaneTree
---@field alt_screen_active boolean
---@field bottom? Resurrect.PaneTree
---@field cwd string
---@field domain? string
---@field height integer
---@field is_active boolean
---@field is_zoomed boolean
---@field left integer
---@field pane? Pane
---@field process? LocalProcessInfo
---@field right? Resurrect.PaneTree
---@field text string
---@field top integer
---@field width integer

---@class Resurrect.TabState
---@field is_active boolean
---@field is_zoomed boolean
---@field pane_tree Resurrect.PaneTree
---@field title string

---@class Resurrect.RestoreOpts
---@field absolute? boolean
---@field close_open_panes? boolean
---@field close_open_tabs? boolean
---@field pane? Pane
---@field relative? boolean
---@field resize_window? boolean
---@field spawn_in_workspace? boolean
---@field tab? MuxTab
---@field window MuxWindow
local restore = {}

---@param pane_tree Resurrect.PaneTree
function restore.on_pane_restore(pane_tree) end

---@class Resurrect.FuzzyLoadOpts
---@field date_format string
---@field description string
---@field fuzzy_description string
---@field ignore_screen_width boolean
---@field ignore_tabs boolean
---@field ignore_windows boolean
---@field ignore_workspaces boolean
---@field is_fuzzy boolean
---@field min_filename_size number
---@field name_truncature string
---@field show_state_with_date boolean
---@field title string
local F_OPTS = {}

---@param label string
---@return string date
function F_OPTS.fmt_date(label) end

---@param label string
---@return string tab
function F_OPTS.fmt_tab(label) end

---@param label string
---@return string window
function F_OPTS.fmt_window(label) end

---@param label string
---@return string workspace
function F_OPTS.fmt_workspace(label) end

---@class Resurrect.FuzzyLoader
---@field default_fuzzy_load_opts Resurrect.FuzzyLoadOpts
local F = {}

---A fuzzy finder to restore saved state.
---
---@param window MuxWindow The `MuxWindow` object.
---@param pane Pane The `Pane` object.
---@param callback fun(id: string, label: string, save_state_dir: string)
---@param opts? Resurrect.FuzzyLoadOpts
function F.fuzzy_load(window, pane, callback, opts) end

---@class StateManager.PeriodicSaveOpts
---@field interval_seconds? integer
---@field save_tabs? boolean
---@field save_windows? boolean
---@field save_workspaces? boolean

---@class Resurrect.StateManager
---@field save_state_dir? string
local S = {}

---Changes the directory to save the state to.
---
---@param directory string
function S.change_state_save_dir(directory) end

---@param file_path string
function S.delete_state(file_path) end

---Reads a file with the state.
---
---@param name string
---@param type string
---@return Resurrect.WorkspaceState|Resurrect.WindowState|Resurrect.TabState state
function S.load_state(name, type) end

---Saves the stater after interval in seconds.
---
---@param opts? StateManager.PeriodicSaveOpts
function S.periodic_save(opts) end

---Callback for resurrecting workspaces on startup.
---
---@return boolean success
---@return string|nil err
function S.resurrect_on_gui_startup() end

---Save state to a file.
---
---@param state Resurrect.WorkspaceState|Resurrect.WindowState|Resurrect.TabState
---@param opt_name? string
function S.save_state(state, opt_name) end

---Merges user-supplied options with default options.
---
---@param user_opts Resurrect.EncryptionOpts
function S.set_encryption(user_opts) end

---@param max_nlines integer
function S.set_max_nlines(max_nlines) end

---Writes the current state name and type.
---
---@param name string
---@param type string
---@return boolean success
---@return string|nil err
function S.write_current_state(name, type) end

---@class Resurrect
---@field fuzzy_loader Resurrect.FuzzyLoader
---@field state_manager Resurrect.StateManager
---@field tab_state Resurrect.TabState
---@field window_state Resurrect.WindowState
---@field workspace_state Resurrect.WorkspaceState

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
