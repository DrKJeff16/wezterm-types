---@meta

---An `ExecDomain` defines a local-execution multiplexer domain.
---
---In simple terms, rather than directly executing
---the requested program, an `ExecDomain` allows you
---to wrap up that command invocation by passing it
---through some other process.
---
---For example, if you wanted to make it more convenient
---to work with tabs and panes inside a docker container,
---you might want to define an `ExecDomain` that causes
---the commands to be run via `docker exec`.
---While you could just ask wezterm to explicitly spawn a command
---that runs `docker exec` you would also need to adjust the default
---key assignments for splitting panes to know about that preference.
---
---Using an `ExecDomain` allows that preference to be associated with the pane
---so that things work more intuitively.
---
---@class ExecDomain
local M = {}

---You must use the wezterm.exec_domain function to define a domain.
---
---It accepts the following parameters:
---
--- - `name`: Uniquely identifies the domain.
---         Must be different from any other multiplexer domains
--- - `fixup`: A Lua function that will be called to fixup the requested command
---          and return the revised command
--- - `label` (optional): Can be either a `string` to serve as a label in the Launcher Menu,
---                     or a lua function that will return the label
---
---See `https://wezterm.org/config/lua/ExecDomain.html` for more info.
---
---@param name string
---@param fixup fun(cmd: SpawnCommand): SpawnCommand
---@return ExecDomain new_domain
function M.exec_domain(name, fixup) end

---You must use the wezterm.exec_domain function to define a domain.
---
---It accepts the following parameters:
---
--- - `name`: Uniquely identifies the domain.
---         Must be different from any other multiplexer domains
--- - `fixup`: A Lua function that will be called to fixup the requested command
---          and return the revised command
--- - `label` (optional): Can be either a `string` to serve as a label in the Launcher Menu,
---                     or a lua function that will return the label
---
---See `https://wezterm.org/config/lua/ExecDomain.html` for more info.
---
---@param name string
---@param fixup fun(cmd: SpawnCommand): SpawnCommand
---@param label nil|string|fun(): string
---@return ExecDomain new_domain
function M.exec_domain(name, fixup, label) end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
