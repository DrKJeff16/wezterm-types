---@meta
---@diagnostic disable:unused-local

---@enum (key) LocalProcessStatus
local local_process_status = {
  Dead = 1,
  Idle = 1,
  LockBlocked = 1,
  Parked = 1,
  Run = 1,
  Sleep = 1,
  Stop = 1,
  Tracing = 1,
  Unknown = 1,
  Wakekill = 1,
  Waking = 1,
  Zombie = 1,
}

---Represents a process running on the local machine.
---
---@class LocalProcessInfo
---A table holding the argument array for the process.
---
---@field argv string[]
---A table keyed by child process id and whose values are themselves.
---`LocalProcessInfo` objects that describe the child processes.
---
---@field children LocalProcessInfo[]
---The current working directory for the process (may be empty).
---
---@field cwd string|""
---the full path to the executable image for the process (may be empty).
---
---@field executable string|""
---A short name for the process.
---
---Due to platform limitations, this may be inaccurate and/or truncated;
---you should look at the `executable` or `argv` fields instead of this one.
---
---@field name string
---The process identifier (`PID`).
---
---@field pid integer
---The parent process identifier.
---
---@field ppid integer
---A string holding the status of the process.
---
---Possible values are:
--- - `"Idle"`
--- - `"Run"`
--- - `"Sleep"`
--- - `"Stop"`
--- - `"Zombie"`
--- - `"Tracing"`
--- - `"Dead"`
--- - `"Wakekill"`
--- - `"Waking"`
--- - `"Parked"`
--- - `"LockBlocked"`
--- - `"Unknown"`
---
---@field status LocalProcessStatus

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
