---@meta
---@diagnostic disable:unused-local

---TODO: Make key and mods more specific

---@enum (key) CharSelect
local charselect = {
  RecentlyUsed = 1,
  SmileysAndEmotion = 1,
  PeopleAndBody = 1,
  AnimalsAndNature = 1,
  FoodAndDrink = 1,
  TravelAndPlaces = 1,
  Activities = 1,
  Objects = 1,
  Symbols = 1,
  Flags = 1,
  NerdFonts = 1,
  UnicodeNames = 1,
}

---@enum (key) CopyTo
local copy_to = {
  Clipboard = 1,
  ClipboardAndPrimarySelection = 1,
  PrimarySelection = 1,
}

---@enum (key) CopyModeStr
local copy_mode = {
  AcceptPattern = 1,
  ClearPattern = 1,
  ClearSelectionMode = 1,
  Close = 1,
  CycleMatchType = 1,
  EditPattern = 1,
  JumpReverse = 1,
  MoveBackwardSemanticZone = 1,
  MoveBackwardWord = 1,
  MoveBackwardWordEnd = 1,
  MoveDown = 1,
  MoveForwardSemanticZone = 1,
  MoveForwardWord = 1,
  MoveForwardWordEnd = 1,
  MoveLeft = 1,
  MoveRight = 1,
  MoveToEndOfLineContent = 1,
  MoveToScrollbackBottom = 1,
  MoveToScrollbackTop = 1,
  MoveToSelectionOtherEnd = 1,
  MoveToSelectionOtherEndHoriz = 1,
  MoveToStartOfLine = 1,
  MoveToStartOfLineContent = 1,
  MoveToStartOfNextLine = 1,
  MoveToViewportBottom = 1,
  MoveToViewportMiddle = 1,
  MoveToViewportTop = 1,
  MoveUp = 1,
  NextMatch = 1,
  NextMatchPage = 1,
  PageDown = 1,
  PageUp = 1,
  PriorMatch = 1,
  PriorMatchPage = 1,
  ScrollToBottom = 1,
}

---@alias CopyMode
---|CopyModeStr
---|{ JumpBackward: { prev_char: boolean } }
---|{ JumpForward: { prev_char: boolean } }
---|{ MoveBackwardSemanticZoneOfType: "Input"|"Output"|"Prompt" }
---|{ MoveByPage: number }
---|{ MoveForwardSemanticZoneOfType: "Input"|"Output"|"Prompt" }
---|{ SetSelectionMode: SelectionMode|"SemanticZone" }

---@alias SendKey Key

---Activates a named key table.
---
---@class ActivateKeyTableParams
---The name of the table to activate.
---
---The name must match up to an entry in the `config.key_tables` configuration.
---
---See:
--- - [`config.key_tables`](lua://Config.key_tables)
---
---@field name string
---An optional duration expressed in milliseconds. If specified, then the activation
---will automatically expire and pop itself from the key table stack once that duration elapses.
---
---If omitted, this activation will not expire due to time.
---
---@field timeout_milliseconds? integer
---An optional boolean that controls whether the activation will pop itself
---after a single additional key press.
---
---The default if left unspecified is `true`.
---
---When set to `false`, pressing a key will not automatically pop the activation
---and you will need to use either a timeout or an explicit key assignment
---that triggers `PopKeyTable` to cancel the activation.
---
---@field one_shot? boolean
---An optional boolean.
---Defaults to `false` if unspecified.
---
---If set to `true` then it will behave as though `PopKeyTable` was triggered
---before pushing this new activation on the stack.
---This is most useful for key assignments in a table that was activated
---with `one_shot` set to `false`.
---
---@field replace_current? boolean
---An optional boolean.
---Defaults to `false` if unspecified.
---
---If set to `true` then a key press that doesn't match any entries
---in the named key table will implicitly pop this entry from the stack.
---This can be used together with `timeout_milliseconds`.
---
---@field until_unknown? boolean
---An optional boolean.
---Defaults to `false` if unspecified.
---
---If set to `true` then a key press that doesn't match any entries
---in the named key table will halt any further key table stack matching,
---allowing only key assignments that are defined in the current key table activation to match.
---
---**Use with care**: If you haven't defined an explicit `PopKeyTable` assignment
---in the key table you may lock yourself out of the keyboard
---and will need to reload the configuration file
---(e.g. by re-saving it) to get back in.
---
---@field prevent_fallback? boolean

---@alias ActivateKeyTable fun(params: ActivateKeyTableParams)

---@enum (key) KeyAssignment
local key_assignment = {
  ActivateCommandPalette = 1,
  ActivateCopyMode = 1,
  ActivateKeyTable = 1,
  ActivateLastTab = 1,
  ActivatePaneByIndex = 1,
  ActivatePaneDirection = 1,
  ActivateTab = 1,
  ActivateTabRelative = 1,
  ActivateTabRelativeNoWrap = 1,
  ActivateWindow = 1,
  ActivateWindowRelative = 1,
  ActivateWindowRelativeNoWrap = 1,
  AdjustPaneSize = 1,
  AttachDomain = 1,
  CharSelect = 1,
  ClearKeyTableStack = 1,
  ClearScrollback = 1,
  ClearSelection = 1,
  CloseCurrentPane = 1,
  CloseCurrentTab = 1,
  CompleteSelection = 1,
  CompleteSelectionOrOpenLinkAtMouseCursor = 1,
  Copy = 1,
  CopyMode = 1,
  CopyTo = 1,
  DecreaseFontSize = 1,
  DetachDomain = 1,
  DisableDefaultAssignment = 1,
  EmitEvent = 1,
  ExtendSelectionToMouseCursor = 1,
  Hide = 1,
  HideApplication = 1,
  IncreaseFontSize = 1,
  InputSelector = 1,
  MoveTab = 1,
  MoveTabRelative = 1,
  Multiple = 1,
  Nop = 1,
  OpenLinkAtMouseCursor = 1,
  PaneSelect = 1,
  Paste = 1,
  PasteFrom = 1,
  PastePrimarySelection = 1,
  PopKeyTable = 1,
  PromptInputLine = 1,
  QuickSelect = 1,
  QuickSelectArgs = 1,
  QuitApplication = 1,
  ReloadConfiguration = 1,
  ResetFontAndWindowSize = 1,
  ResetFontSize = 1,
  ResetTerminal = 1,
  RotatePanes = 1,
  ScrollByCurrentEventWheelDelta = 1,
  ScrollByLine = 1,
  ScrollByPage = 1,
  ScrollToBottom = 1,
  ScrollToPrompt = 1,
  ScrollToTop = 1,
  Search = 1,
  SelectTextAtMouseCursor = 1,
  SendKey = 1,
  SendString = 1,
  SetPaneZoomState = 1,
  Show = 1,
  ShowDebugOverlay = 1,
  ShowLauncher = 1,
  ShowLauncherArgs = 1,
  ShowTabNavigator = 1,
  SpawnCommandInNewTab = 1,
  SpawnCommandInNewWindow = 1,
  SpawnTab = 1,
  SpawnWindow = 1,
  SplitHorizontal = 1,
  SplitPane = 1,
  SplitVertical = 1,
  StartWindowDrag = 1,
  SwitchToWorkspace = 1,
  SwitchWorkspaceRelative = 1,
  ToggleFullScreen = 1,
  TogglePaneZoomState = 1,
}

---@class Key
---A single unicode character, like 'A' or 'a'. Pay attention to the case of the text that you use
---and the state of the SHIFT modifier, as this matters whether 'A' or 'a' is matched.
---
---Alternatively you can use on the following keycode identifiers, although note that not all of
---these are meaningful on all platforms:
---
--- - `Add`
--- - `Alt`
--- - `ApplicationDownArrow`
--- - `ApplicationLeftArrow`
--- - `ApplicationRightArrow`
--- - `ApplicationUpArrow`
--- - `Applications`
--- - `Backspace`
--- - `BrowserBack`
--- - `BrowserFavorites`
--- - `BrowserForward`
--- - `BrowserHome`
--- - `BrowserRefresh`
--- - `BrowserSearch`
--- - `BrowserStop`
--- - `Cancel`
--- - `CapsLock`
--- - `Clear`
--- - `Control`
--- - `Decimal`
--- - `Delete`
--- - `Divide`
--- - `DownArrow`
--- - `End`
--- - `Enter`
--- - `Escape`
--- - `Execute`
--- - `F1`
--- - `F2`
--- - `F3`
--- - `F4`
--- - `F5`
--- - `F6`
--- - `F7`
--- - `F8`
--- - `F9`
--- - `F10`
--- - `F11`
--- - `F12`
--- - `F13`
--- - `F14`
--- - `F15`
--- - `F16`
--- - `F17`
--- - `F18`
--- - `F19`
--- - `F20`
--- - `F21`
--- - `F22`
--- - `F23`
--- - `F24`
--- - `Help`
--- - `Home`
--- - `Hyper`
--- - `Insert`
--- - `LeftAlt`
--- - `LeftArrow`
--- - `LeftControl`
--- - `LeftMenu`
--- - `LeftShift`
--- - `LeftWindows`
--- - `MediaNextTrack`
--- - `MediaPlayPause`
--- - `MediaPrevTrack`
--- - `MediaStop`
--- - `Menu`
--- - `Meta`
--- - `Multiply`
--- - `NumLock`
--- - `Numpad0`
--- - `Numpad1`
--- - `Numpad2`
--- - `Numpad3`
--- - `Numpad4`
--- - `Numpad5`
--- - `Numpad6`
--- - `Numpad7`
--- - `Numpad8`
--- - `Numpad9`
--- - `PageDown`
--- - `PageUp`
--- - `Pause`
--- - `Print`
--- - `PrintScreen`
--- - `RightAlt`
--- - `RightArrow`
--- - `RightControl`
--- - `RightMenu`
--- - `RightShift`
--- - `RightWindows`
--- - `ScrollLock`
--- - `Select`
--- - `Separator`
--- - `Shift`
--- - `Sleep`
--- - `Subtract`
--- - `Super`
--- - `Tab`
--- - `UpArrow`
--- - `VoidSymbol`
--- - `VolumeDown`
--- - `VolumeMute`
--- - `VolumeUp`
---
---The key value can refer either to the physical position of a key on an ANSI US keyboard or to the
---post-keyboard-layout-mapped value produced by a key press.
---
---You can explicitly assign using the physical position by adding a phys: prefix to the value, for
---example: `key="phys:A"`. This will match key presses for the key that would be in the position of
---the A key on an ANSI US keyboard.
---
---You can explicitly assign the mapped key by adding a mapped:
---prefix to the value, for example: key="mapped:a" will match a
---key press where the OS keyboard layout produces a, regardless of
---its physical position.
---
---If you omit an explicit prefix, wezterm will assume phys: and use the physical position of the
---specified key.
---
---The default key assignments listed above use `phys:`. In previous releases there was no physical
---position support and those assignments were all `mapped:`.
---
---When upgrading from earlier releases, if you had `{key="N", mods="CMD", ..}` in your config, you
---will need to change it to either `{key="N", mods="CMD|SHIFT", ..}` or `{ key="mapped:N",
---mods="CMD", ..}` in order to continue to respect the SHIFT modifier.
---
---The `key_map_preference` option controls how keys without an explicit `phys:` or `mapped:` prefix
---are treated. If `key_map_preference = "Mapped"` (the default), then `mapped:` is assumed. If
---`key_map_preference = "Physical"` then `phys:` is assumed.
---
---The default key assignments will respect `key_map_preference`.
---
---In some cases, wezterm may not know how to represent a key event in either its phys: or mapped:
---forms. In that case, you may wish to define an assignment in terms of the underlying operating
---system key code, using a `raw: prefix`.
---
---Similar in concept to the `phys:` mapping described above, the `raw:` mapping is independent of
---the OS keyboard layout. Raw codes are hardware and windowing system dependent, so there is no
---portable way to list which key does what.
---
---To discover these values, you can set `debug_key_events = true` and press the keys of interest.
---
---You can specify a raw key value of 123 by using `key="raw:123"` in your config rather than one of
---the other key values.
---
---@field key string
---Possible Modifier labels are:
---
--- - `SUPER`, `CMD`, `WIN`: These are all equivalent: on macOS the `Command` key,
---                  on Windows the `WIN`,
---                  on Linux this can also be the `Super` or `Hyper` key.
---                  Left and right are equivalent
--- - `CTRL`: The control key.
---         Left and right are equivalent
--- - `SHIFT`: The shift key.
---          Left and right are equivalent
--- - `ALT`, `OPT`, `META`: These are all equivalent.
---                  on macOS the Option key, on
---                  other systems the Alt or Meta key.
---                  Left and right are equivalent
--- - `LEADER`: A special modal modifier state managed by WezTerm
--- - `VoidSymbol`: This keycode is emitted in special cases where
---               the original function of the key has been removed.
---               Such as in Linux and using `setxkbmap -option caps:none`.
---
---The `CapsLock` will no longer function as before in all applications,
---instead emitting `VoidSymbol`.
---You can also combine modifiers using the `|` symbol, like `"CMD|CTRL"`.
---
---@field mods? string
---@field action? KeyAssignment|Action

---@class ActionClass
---@field ActivateCommandPalette any
---@field ActivateCopyMode any
---@field ActivateKeyTable any
---@field ActivateLastTab any
---@field ActivatePaneByIndex any
---@field ActivatePaneDirection any
---@field ActivateTab any
---@field ActivateTabRelative any
---@field ActivateTabRelativeNoWrap any
---@field ActivateWindow any
---@field ActivateWindowRelative any
---@field ActivateWindowRelativeNoWrap any
---@field AdjustPaneSize any
---@field AttachDomain any
---@field CharSelect any
---@field ClearKeyTableStack any
---@field ClearScrollback any
---@field ClearSelection any
---@field CloseCurrentPane any
---@field CloseCurrentTab any
---@field CompleteSelection any
---@field CompleteSelectionOrOpenLinkAtMouseCursor any
---@field Copy any
---@field CopyMode CopyMode
---@field CopyTo CopyTo
---@field DecreaseFontSize any
---@field DetachDomain any
---@field DisableDefaultAssignment any
---@field EmitEvent any
---@field ExtendSelectionToMouseCursor any
---@field Hide any
---@field HideApplication any
---@field IncreaseFontSize any
---@field InputSelector any
---@field MoveTab any
---@field MoveTabRelative any
---Performs a sequence of multiple assignments.
---
---This is useful when you want a single key press to trigger multiple actions.
---
---@field Multiple ActionClass[]|ActionFuncClass[]
---@field Nop any
---@field OpenLinkAtMouseCursor any
---@field PaneSelect any
---@field Paste any
---@field PasteFrom any
---@field PastePrimarySelection any
---@field PopKeyTable any
---@field PromptInputLine any
---@field QuickSelect any
---@field QuickSelectArgs any
---@field QuitApplication any
---@field ReloadConfiguration any
---@field ResetFontAndWindowSize any
---@field ResetFontSize any
---@field ResetTerminal any
---@field RotatePanes any
---@field ScrollByCurrentEventWheelDelta any
---@field ScrollByLine any
---@field ScrollByPage any
---@field ScrollToBottom any
---@field ScrollToPrompt any
---@field ScrollToTop any
---@field Search any
---@field SelectTextAtMouseCursor any
---@field SendKey SendKey
---@field SendString string
---@field SetPaneZoomState any
---@field Show any
---@field ShowDebugOverlay any
---@field ShowLauncher any
---@field ShowLauncherArgs any
---@field ShowTabNavigator any
---@field SpawnCommandInNewTab any
---@field SpawnCommandInNewWindow any
---@field SpawnTab any
---@field SpawnWindow any
---@field SplitHorizontal any
---@field SplitPane any
---@field SplitVertical any
---@field StartWindowDrag any
---@field SwitchToWorkspace any
---@field SwitchWorkspaceRelative any
---@field ToggleFullScreen any
---@field TogglePaneZoomState any

---@alias KeyAssignFunction fun(param: any): Action

---Can also be called as function like older versions of wezterm did.
---
---@class ActionFuncClass
---@field ActivateCommandPalette KeyAssignFunction
---@field ActivateCopyMode KeyAssignFunction
---@field ActivateKeyTable ActivateKeyTable
---@field ActivateLastTab KeyAssignFunction
---@field ActivatePaneByIndex KeyAssignFunction
---@field ActivatePaneDirection KeyAssignFunction
---@field ActivateTab KeyAssignFunction
---@field ActivateTabRelative KeyAssignFunction
---@field ActivateTabRelativeNoWrap KeyAssignFunction
---@field ActivateWindow KeyAssignFunction
---@field ActivateWindowRelative KeyAssignFunction
---@field ActivateWindowRelativeNoWrap KeyAssignFunction
---@field AdjustPaneSize KeyAssignFunction
---@field AttachDomain KeyAssignFunction
---@field CharSelect KeyAssignFunction
---@field ClearKeyTableStack KeyAssignFunction
---@field ClearScrollback KeyAssignFunction
---@field ClearSelection KeyAssignFunction
---@field CloseCurrentPane KeyAssignFunction
---@field CloseCurrentTab KeyAssignFunction
---@field CompleteSelection KeyAssignFunction
---@field CompleteSelectionOrOpenLinkAtMouseCursor KeyAssignFunction
---@field Copy KeyAssignFunction
---@field DecreaseFontSize KeyAssignFunction
---@field DetachDomain KeyAssignFunction
---@field DisableDefaultAssignment KeyAssignFunction
---@field EmitEvent KeyAssignFunction
---@field ExtendSelectionToMouseCursor KeyAssignFunction
---@field Hide KeyAssignFunction
---@field HideApplication KeyAssignFunction
---@field IncreaseFontSize KeyAssignFunction
---@field InputSelector KeyAssignFunction
---@field MoveTab KeyAssignFunction
---@field MoveTabRelative KeyAssignFunction
---@field OpenLinkAtMouseCursor KeyAssignFunction
---@field PaneSelect KeyAssignFunction
---@field Paste KeyAssignFunction
---@field PasteFrom KeyAssignFunction
---@field PastePrimarySelection KeyAssignFunction
---@field PopKeyTable KeyAssignFunction
---@field PromptInputLine KeyAssignFunction
---@field QuickSelect KeyAssignFunction
---@field QuickSelectArgs KeyAssignFunction
---@field QuitApplication KeyAssignFunction
---@field ReloadConfiguration KeyAssignFunction
---@field ResetFontAndWindowSize KeyAssignFunction
---@field ResetFontSize KeyAssignFunction
---@field ResetTerminal KeyAssignFunction
---@field RotatePanes KeyAssignFunction
---@field ScrollByCurrentEventWheelDelta KeyAssignFunction
---@field ScrollByLine KeyAssignFunction
---@field ScrollByPage KeyAssignFunction
---@field ScrollToBottom KeyAssignFunction
---@field ScrollToPrompt KeyAssignFunction
---@field ScrollToTop KeyAssignFunction
---@field Search KeyAssignFunction
---@field SetPaneZoomState KeyAssignFunction
---@field Show KeyAssignFunction
---@field ShowDebugOverlay KeyAssignFunction
---@field ShowLauncher KeyAssignFunction
---@field ShowLauncherArgs KeyAssignFunction
---@field ShowTabNavigator KeyAssignFunction
---@field SpawnCommandInNewTab KeyAssignFunction
---@field SpawnCommandInNewWindow KeyAssignFunction
---@field SpawnTab KeyAssignFunction
---@field SpawnWindow KeyAssignFunction
---@field SplitHorizontal KeyAssignFunction
---@field SplitPane KeyAssignFunction
---@field SplitVertical KeyAssignFunction
---@field StartWindowDrag KeyAssignFunction
---@field SwitchToWorkspace KeyAssignFunction
---@field SwitchWorkspaceRelative KeyAssignFunction
---@field ToggleFullScreen KeyAssignFunction
---@field TogglePaneZoomState KeyAssignFunction
local ActionFunc = {}

---Causes the key press to have no effect; it behaves as though those keys were not pressed.
---
---If instead of this you want the key presses to pass through to the terminal,
---look at [`DisableDefaultAssignment`](https://wezterm.org/config/lua/keyassignment/DisableDefaultAssignment.html).
---
---@return Action nop
function ActionFunc.Nop() end

---@param s "Line"|"Word"|"Cell"|"Block"|"SemanticZone"
---@return Action select_text_at_mouse_cursor
function ActionFunc.SelectTextAtMouseCursor(s) end

---@param s string
---@return Action send_string
function ActionFunc.SendString(s) end

---@param param SendKey
---@return Action send_key
function ActionFunc.SendKey(param) end

---@param act CopyMode
---@return Action copy_mode
function ActionFunc.CopyMode(act) end

---@param destination CopyTo
---@return Action copy_to
function ActionFunc.CopyTo(destination) end

---Performs a sequence of multiple assignments.
---
---This is useful when you want a single key press to trigger multiple actions.
---
---@param action ActionClass[]
function ActionFunc.Multiple(action) end

---Performs a sequence of multiple assignments.
---
---This is useful when you want a single key press to trigger multiple actions.
---
---@param action ActionFuncClass[]
function ActionFunc.Multiple(action) end

---Helper for defining key assignment actions in your configuration file.
---This is really just sugar for the underlying Lua -> Rust deserialation mapping
---that makes it a bit easier to identify where syntax errors may exist
---in your configuration file
---@alias Action ActionFuncClass|ActionClass

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
