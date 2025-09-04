---@meta

---Represents a domain that is managed by the multiplexer.
---
---@class MuxDomain
local M = {}

---Attempts to attach the domain.
---
---Attaching a domain will attempt to import the windows,
---tabs and panes from the remote system into those
---of the local GUI.
---
---Unlike the `AttachDomain` key assignment,
---calling `MuxDomain:attach()` will not implicitly spawn
---a new pane into the domain if the domain contains no panes.
---This is to provide flexibility when used in the `gui-startup` event.
---
---If the domain is already attached,
---calling this method again has no effect.
---
---@param self MuxDomain
function M:attach() end

---Attempts to detach the domain.
---
---Detaching a domain causes it to disconnect and remove
---its set of windows, tabs and panes from the local GUI.
---Detaching does not cause those panes to close;
---if or when you later attach to the domain,
---they'll still be there.
---
---Note that not every domain supports detaching,
---and will log an error to the error log/debug overlay.
---
---@param self MuxDomain
function M:detach() end

---Returns the domain ID.
---
---@param self MuxDomain
---@return integer id
function M:domain_id() end

---Returns `true` if the mux has any panes that belong
---to this domain.
---
---This can be useful when deciding whether to spawn
---additional panes after attaching to a domain.
---
---@param self MuxDomain
---@return boolean has_panes
function M:has_any_panes() end

---Returns `false` if this domain will never be able to spawn
---a new pane/tab/window, `true` otherwise.
---
---Serial ports are represented by a serial domain
---that is not spawnable.
---
---@param self MuxDomain
---@return boolean spawnable
function M:is_spawnable() end

---Computes a label describing the `name` and `state` of the domain.
---The label can change depending on the `state` of the domain.
---
---See also:
--- - [`MuxDomain:name()`](lua://MuxDomain.name)
---
---@param self MuxDomain
---@return string label
function M:label() end

---Returns the name of the domain.
---Domain names are unique; no two domains can have the same name,
---and the name is fixed for the lifetime of the domain.
---
---See also:
--- - [`MuxDomain:label()`](lua://MuxDomain.label)
---
---@param self MuxDomain
---@return string name
function M:name() end

---Returns whether the domain is attached or not.
---
---The result is a string that is either:
---
--- - `"Attached"`: the domain is attached
--- - `"Detached"`: the domain is not attached
---
---See also:
--- - [`MuxDomain:attach()`](lua://MuxDomain.attach)
--- - [`MuxDomain:detach()`](lua://MuxDomain.detach)
---
---@param self MuxDomain
---@return "Attached"|"Detached" state
function M:state() end
