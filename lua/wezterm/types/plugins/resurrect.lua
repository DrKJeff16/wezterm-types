---@meta
---@diagnostic disable:unused-local

---@class Resurrect.EncryptionOpts
---@field enable boolean
---@field method string
---@field private_key? string
---@field public_key? string
local E = {}

---@param file_path string
---@param lines string
function E.encrypt(file_path, lines) end

---@param file_path string
---@return string stdout
function E.decrypt(file_path) end

---@class Resurrect.TabSize
---@field rows integer
---@field cols integer
---@field pixel_width integer
---@field pixel_height integer
---@field dpi integer

---@class Resurrect.WorkspaceState
---@field workspace string
---@field window_states Resurrect.WindowState[]

---@class Resurrect.WindowState
---@field title string
---@field tabs Resurrect.TabState[]
---@field workspace string
---@field size Resurrect.TabState

---@class Resurrect.PaneTree
---@field left integer
---@field top integer
---@field height integer
---@field width integer
---@field bottom? Resurrect.PaneTree
---@field right? Resurrect.PaneTree
---@field text string
---@field cwd string
---@field domain? string
---@field process? LocalProcessInfo
---@field pane? Pane
---@field is_active boolean
---@field is_zoomed boolean
---@field alt_screen_active boolean

---@class Resurrect.TabState
---@field title string
---@field pane_tree Resurrect.PaneTree
---@field is_active boolean
---@field is_zoomed boolean

---@class Resurrect.RestoreOpts
---@field spawn_in_workspace? boolean
---@field relative? boolean
---@field absolute? boolean
---@field close_open_tabs? boolean
---@field close_open_panes? boolean
---@field pane? Pane
---@field tab? MuxTab
---@field window MuxWindow
---@field resize_window? boolean
local restore = {}

---@param pane_tree Resurrect.PaneTree
function restore.on_pane_restore(pane_tree) end

---@class Resurrect.FuzzyLoadOpts
---@field title string
---@field description string
---@field fuzzy_description string
---@field is_fuzzy boolean
---@field ignore_workspaces boolean
---@field ignore_tabs boolean
---@field ignore_windows boolean
---@field show_state_with_date boolean
---@field date_format string
---@field ignore_screen_width boolean
---@field name_truncature string
---@field min_filename_size number
local F_OPTS = {}

---@param label string
---@return string window
function F_OPTS.fmt_window(label) end

---@param label string
---@return string workspace
function F_OPTS.fmt_workspace(label) end

---@param label string
---@return string tab
function F_OPTS.fmt_tab(label) end

---@param label string
---@return string date
function F_OPTS.fmt_date(label) end

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
---@field save_workspaces? boolean
---@field save_windows? boolean
---@field save_tabs? boolean

---@class Resurrect.StateManager
---@field save_state_dir? string
local S = {}

---save state to a file
---@param state Resurrect.WorkspaceState|Resurrect.WindowState|Resurrect.TabState
---@param opt_name? string
function S.save_state(state, opt_name) end

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

---Writes the current state name and type.
---
---@param name string
---@param type string
---@return boolean success
---@return string|nil err
function S.write_current_state(name, type) end

---Callback for resurrecting workspaces on startup.
---
---@return boolean success
---@return string|nil err
function S.resurrect_on_gui_startup() end

---@param file_path string
function S.delete_state(file_path) end

---Merges user-supplied options with default options.
---
---@param user_opts Resurrect.EncryptionOpts
function S.set_encryption(user_opts) end

---Changes the directory to save the state to.
---
---@param directory string
function S.change_state_save_dir(directory) end

---@param max_nlines integer
function S.set_max_nlines(max_nlines) end

---@class Resurrect
---@field workspace_state Resurrect.WorkspaceState
---@field tab_state Resurrect.TabState
---@field window_state Resurrect.WindowState
---@field fuzzy_loader Resurrect.FuzzyLoader
---@field state_manager Resurrect.StateManager

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
