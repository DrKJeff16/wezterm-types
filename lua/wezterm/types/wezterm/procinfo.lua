---@meta

---The `wezterm.procinfo` module exposes functions
---that allow querying information about processes
---that are running on the local system.
---
---@class Wezterm.ProcInfo
local ProcInfo = {}

---Returns the current working directory
---for the specified process ID.
---
---This function may return `nil` if it was
---unable to return the info.
---
---@param pid integer
---@return string|nil
function ProcInfo.current_working_dir_for_pid(pid) end

---Returns the path to the executable image
---for the specified process ID.
---
---This function may return `nil` if it was
---unable to return the info.
---
---@param pid integer
---@return string|nil
function ProcInfo.executable_path_for_pid(pid) end

---Returns a `LocalProcessInfo` object for
---the specified process ID.
---
---This function may return `nil` if it was
---unable to return the info.
---
---See:
--- - [`LocalProcessInfo`](lua://LocalProcessInfo)
---
---@param pid integer
---@return LocalProcessInfo|nil
function ProcInfo.get_info_for_pid(pid) end

---Returns the process ID for the current process.
---
---@return integer
function ProcInfo.pid() end
