---@meta
---@diagnostic disable:unused-local

---TODO: Make key and mods more specific

---@enum (key) CharGroup
local char_groups = {
  Activities = 1,
  AnimalsAndNature = 1,
  Flags = 1,
  FoodAndDrink = 1,
  NerdFonts = 1,
  Objects = 1,
  PeopleAndBody = 1,
  RecentlyUsed = 1,
  SmileysAndEmotion = 1,
  Symbols = 1,
  TravelAndPlaces = 1,
  UnicodeNames = 1,
}

---@enum (key) ClipboardCopyDestination
local copy_to = {
  Clipboard = 1,
  ClipboardAndPrimarySelection = 1,
  PrimarySelection = 1,
}

---@enum (key) ClipboardPasteDestination
local paste_from = {
  Clipboard = 1,
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

---@enum (key) SpawnTabDomain
local spawn_tab_domain = {
  CurrentPaneDomain = 1,
  DefaultDomain = 1,
  DomainId = 1,
  DomainName = 1,
}

---@enum (key) ScrollbackEraseMode
local scrollback_erase_mode = {
  ScrollbackAndViewport = 1,
  ScrollbackOnly = 1,
}

---@alias CopyModeParams
---|CopyModeStr
---|{ JumpBackward: { prev_char: boolean } }
---|{ JumpForward: { prev_char: boolean } }
---|{ MoveBackwardSemanticZoneOfType: "Input"|"Output"|"Prompt" }
---|{ MoveByPage: number }
---|{ MoveForwardSemanticZoneOfType: "Input"|"Output"|"Prompt" }
---|{ SetSelectionMode: SelectionMode|"SemanticZone" }

---@class ConfirmationParams
---Event callback registered via `wezterm.action_callback()`.
---The callback's function signature is `(window, pane)` where `window` and `pane`
---are the `Window` and `Pane` objects from the current pane and window, respectively.
---
---This callback is called when the user selects `Yes`.
---
---```lua
---wezterm.action.Confirmation({
---  action = wezterm.action_callback(function(window, pane)
---    --- ...
---  end),
---})
---```
---
---@field action { EmitEvent: string }
---The text to show for confirmation.
---
---You may embed escape sequences and/or use `wezterm.format()`.
---
---Defaults to: `"🛑 Really continue?"`.
---
---@field message? string
---Event callback registered via `wezterm.action_callback()`.
---The callback's function signature is `(window, pane)` where `window` and `pane`
---are the `Window` and `Pane`.
---
---This is an optional argument. If present, this callback is called
---when the user selects `No` or closes the confirmation menu.
---
---```lua
---wezterm.action.Confirmation({
---  cancel = wezterm.action_callback(function(window, pane)
---    --- ...
---  end),
---})
---```
---
---@field cancel? { EmitEvent: string }

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

---@enum (key) PaneSelectMode
local pane_select_mode = {
  Activate = 1,
  MoveToNewTab = 1,
  MoveToNewWindow = 1,
  SwapWithActive = 1,
  SwapWithActiveKeepFocus = 1,
}

---@class PaneSelectParams
---@field alphabet? string
---@field mode? PaneSelectMode
---@field show_pane_ids? boolean

---@class PromptInputLineParams
---The text to show at the top of the display area.
---You may embed escape sequences and/or use `wezterm.format()`.
---
---@field description string
---An event callback registered via `wezterm.action_callback()`.
---The callback's function signature is `(window, pane, line)` where `window` and `pane`
---are the `Window` and `Pane` objects from the current pane and window,
---and `line` is the text that the user entered.
---
---Note that `line` may be `nil` if `Escape` is hit without entering anything,
---or `CTRL-C` to cancel the input.
---
---```lua
---wezterm.action.PromptInputLine({
---  action = wezterm.action_callback(function(window, pane, line)
---    --- ...
---  end),
---})
---```
---
---@field action { EmitEvent: string }
---The text to show as the prompt.
---You may embed escape sequences and/or use `wezterm.format()`.
---
---Defaults to: `"> "`.
---
---@field prompt? string
---If provided, the initial content of the input field will be set to this value.
---The user may edit it prior to submitting the input.
---
---@field initial_value? string

---@class QuickSelectArgsParams
---If present, completely overrides the normal set of patterns
---and uses only the patterns specified.
---
---@field patterns? string[]
---If present, this alphabet is used instead of `config.quick_select_alphabet`.
---
---See:
--- - [`config.quick_select_alphabet`](lua://Config.quick_select_alphabet)
---
---@field alphabet? QuickSelectAlphabet|string
---If present, this key assignment action is performed as if by `Window:perform_action`
---when an item is selected.
---
---The normal clipboard action is NOT performed in this case.
---
---@field action? { EmitEvent: string }
---Overrides whether `action` is performed after an item is selected
---using a capital value (when paste occurs).
---
---@field skip_action_on_paste? boolean
---If present, replaces the string `"copy"` that is shown at the bottom of the overlay;
---you can use this to indicate which action will happen if you are using `action`.
---
---@field label? string
---Specifies the number of lines to search above and below the current viewport.
---The default is 1000 lines.
---
---The scope will be increased to the current viewport height if the viewport is smaller.
---
---@field scope_lines? integer

---@generic T
---@alias ActivateKeyTable fun(params: ActivateKeyTableParams): { ActivateKeyTable: ActivateKeyTableParams }
---@alias ActivatePaneByIndex fun(params: T<integer>): { ActivatePaneByIndex: T<integer> }
---@alias ActivatePaneDirection fun(params: T<PaneDirection>): { ActivatePaneDirection: T<PaneDirection> }
---@alias ActivateTab fun(params: T<integer>): { ActivateTab: T<integer> }
---@alias ActivateTabRelative fun(params: T<integer>): { ActivateTabRelative: T<integer> }
---@alias ActivateTabRelativeNoWrap fun(params: T<integer>): { ActivateTabRelativeNoWrap: T<integer> }
---@alias ActivateWindow fun(params: T<integer>): { ActivateWindow: T<integer> }
---@alias ActivateWindowRelative fun(params: T<integer>): { ActivateWindowRelative: T<integer> }
---@alias ActivateWindowRelativeNoWrap fun(params: T<integer>): { ActivateWindowRelativeNoWrap: T<integer> }
---@alias AdjustPaneSize fun(params: { [1]: PaneDirection, [2]: integer }): { AdjustPaneSize: { [1]: PaneDirection, [2]: integer } }
---@alias AttachDomain fun(domain: T<string>): { AttachDomain: T<string> }
---@alias CharSelect fun(params: CharSelectParams): { CharSelect: CharSelectParams }
---@alias ClearScrollback fun(params: ScrollbackEraseMode): { ClearScrollback: ScrollbackEraseMode }
---@alias CloseCurrentPane fun(params: { confirm: boolean }): { CloseCurrentPane: { confirm: boolean } }
---@alias CloseCurrentTab fun(params: { confirm: boolean }): { CloseCurrentTab: { confirm: boolean } }
---@alias CompleteSelection fun(params: ClipboardCopyDestination): { CompleteSelection: ClipboardCopyDestination }
---@alias CompleteSelectionOrOpenLinkAtMouseCursor fun(params: ClipboardCopyDestination): { CompleteSelectionOrOpenLinkAtMouseCursor: ClipboardCopyDestination }
---@alias Confirmation fun(params: ConfirmationParams): { Confirmation: ConfirmationParams }
---@alias CopyMode fun(params: CopyModeParams): { CopyMode: CopyModeParams }
---@alias CopyTo fun(params: ClipboardCopyDestination): { CopyTo: ClipboardCopyDestination }
---@alias DetachDomain fun(params: SpawnTabDomain): { DetachDomain: SpawnTabDomain }
---@alias EmitEvent fun(event_id: T<string>): { EmitEvent: T<string> }
---@alias ExtendSelectionToMouseCursor fun(params: SelectionMode): { ExtendSelectionToMouseCursor: SelectionMode }
---@alias InputSelector fun(params: InputSelectorParams): { InputSelector: InputSelectorParams }
---@alias MoveTab fun(index: T<integer>): { MoveTab: T<integer> }
---@alias MoveTabRelative fun(index: T<integer>): { MoveTabRelative: T<integer> }
---@alias Multiple fun(events: (Actions|KeyAssignmentLiterals)[]): { Multiple: (Actions|KeyAssignment)[] }
---@alias PaneSelect PaneSelectParams|fun(params: PaneSelectParams): { PaneSelect: PaneSelectParams }
---@alias PasteFrom fun(source: ClipboardPasteDestination): { PasteFrom: ClipboardPasteDestination }
---@alias PromptInputLine fun(params: PromptInputLineParams): { PromptInputLine: PromptInputLineParams }
---@alias QuickSelectArgs fun(params: QuickSelectArgsParams): { QuickSelectArgs: QuickSelectArgsParams }

---@generic T
---@alias Actions
---|{ ActivateKeyTable: ActivateKeyTableParams }
---|{ ActivatePaneByIndex: T<integer> }
---|{ ActivatePaneDirection: T<PaneDirection> }
---|{ ActivateTab: T<integer> }
---|{ ActivateTabRelative: T<integer> }
---|{ ActivateTabRelativeNoWrap: T<integer> }
---|{ ActivateWindow: T<integer> }
---|{ ActivateWindowRelative: T<integer> }
---|{ ActivateWindowRelativeNoWrap: T<integer> }
---|{ AdjustPaneSize: { [1]: PaneDirection, [2]: integer } }
---|{ AttachDomain: T<string> }
---|{ CharSelect: CharSelectParams }
---|{ ClearScrollback: ScrollbackEraseMode }
---|{ CloseCurrentPane: { confirm: boolean } }
---|{ CloseCurrentTab: { confirm: boolean } }
---|{ CompleteSelection: ClipboardCopyDestination }
---|{ CompleteSelectionOrOpenLinkAtMouseCursor: ClipboardCopyDestination }
---|{ Confirmation: ConfirmationParams }
---|{ CopyMode: CopyModeParams }
---|{ CopyTo: ClipboardCopyDestination }
---|{ DetachDomain: SpawnTabDomain }
---|{ EmitEvent: T<string> }
---|{ ExtendSelectionToMouseCursor: SelectionMode }
---|{ InputSelector: InputSelectorParams }
---|{ MoveTab: T<integer> }
---|{ MoveTabRelative: T<integer> }
---|{ Multiple: ({ [string]: any }|KeyAssignment)[] }
---|{ PaneSelect: PaneSelectParams }
---|{ PasteFrom: ClipboardPasteDestination }
---|{ PromptInputLine: PromptInputLineParams }
---|{ QuickSelectArgs: QuickSelectArgsParams }

---@class InputSelectorParams
---The title that will be set for the overlay pane.
---
---@field title string
---A table consisting of the potential choices.
---Each entry is itself a table with a label field and an optional id field.
---The label will be shown in the list, while the id can be a different string
---that is meaningful to your action.
---
---The label can be used together with `wezterm.format()` to produce styled text.
---
---@field choices { label: string, id: string }[]
---An event callback registered via `wezterm.action_callback()`.
---
---The callback's function signature is `(window, pane, id, label)`
---where `window` and `pane` are the `Window` and `Pane` objects
---from the current pane and window, and `id` and `label` hold
---the corresponding fields from the selected choice.
---Both will be `nil` if the overlay is cancelled without selecting anything.
---
---```lua
---wezterm.action.InputSelector({
---  action = wezterm.action_callback(function(window, pane, id, label)
---    --- ...
---  end),
---})
---```
---
---@field action { EmitEvent: string }
---A boolean that defaults to `false`.
---
---If `true`, `InputSelector` will start in its fuzzy finding mode,
---equivalent to starting the `InputSelector` and pressing `/` in the default mode.
---
---@field fuzzy? boolean

---@class CharSelectParams
---@field copy_on_select boolean
---@field copy_to ClipboardCopyDestination
---@field group? CharGroup

---@enum (key) PaneDirection
local pane_direction = {
  Up = 1,
  Down = 1,
  Left = 1,
  Right = 1,
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
---@field action? KeyAssignment

---Helper for defining key assignment actions in your configuration file.
---This is really just sugar for the underlying Lua -> Rust deserialation mapping
---that makes it a bit easier to identify where syntax errors may exist
---in your configuration file.
---
---@class KeyAssignment
---@field ActivateCommandPalette "ActivateCommandPalette"
---@field ActivateCopyMode "ActivateCopyMode"
---@field ActivateKeyTable ActivateKeyTable
---@field ActivateLastTab "ActivateLastTab"
---@field ActivatePaneByIndex ActivatePaneByIndex
---@field ActivatePaneDirection ActivatePaneDirection
---@field ActivateTab ActivateTab
---@field ActivateTabRelative ActivateTabRelative
---@field ActivateTabRelativeNoWrap ActivateTabRelativeNoWrap
---@field ActivateWindow ActivateWindow
---@field ActivateWindowRelative ActivateWindowRelative
---@field ActivateWindowRelativeNoWrap ActivateWindowRelativeNoWrap
---@field AdjustPaneSize AdjustPaneSize
---@field AttachDomain AttachDomain
---@field CharSelect CharSelect
---@field ClearKeyTableStack "ClearKeyTableStack"
---@field ClearScrollback ClearScrollback
---@field ClearSelection "ClearSelection"
---@field CloseCurrentPane CloseCurrentPane
---@field CloseCurrentTab CloseCurrentTab
---@field CompleteSelection CompleteSelection
---@field CompleteSelectionOrOpenLinkAtMouseCursor CompleteSelectionOrOpenLinkAtMouseCursor
---@field Confirmation Confirmation
---@field CopyMode CopyMode
---@field CopyTo CopyTo
---@field DecreaseFontSize "DecreaseFontSize"
---@field DetachDomain DetachDomain
---@field DisableDefaultAssignment "DisableDefaultAssignment"
---@field EmitEvent EmitEvent
---@field ExtendSelectionToMouseCursor ExtendSelectionToMouseCursor
---@field Hide "Hide"
---@field HideApplication "HideApplication"
---@field IncreaseFontSize "IncreaseFontSize"
---@field InputSelector InputSelector
---@field MoveTab MoveTab
---@field MoveTabRelative MoveTabRelative
---Performs a sequence of multiple assignments.
---
---This is useful when you want a single key press to trigger multiple actions.
---
---@field Multiple Multiple
---@field Nop "Nop"
---@field OpenLinkAtMouseCursor "OpenLinkAtMouseCursor"
---@field PaneSelect PaneSelect
---@field PasteFrom PasteFrom
---@field PopKeyTable "PopKeyTable"
---@field PromptInputLine PromptInputLine
---@field QuickSelect "QuickSelect"
---@field QuickSelectArgs QuickSelectArgs
---@field QuitApplication "QuitApplication"
---@field ReloadConfiguration "ReloadConfiguration"
---@field ResetFontAndWindowSize "ResetFontAndWindowSize"
---@field ResetFontSize "ResetFontSize"
---@field ResetTerminal "ResetTerminal"
---@field RotatePanes any
---@field ScrollByCurrentEventWheelDelta "ScrollByCurrentEventWheelDelta"
---@field ScrollByLine any
---@field ScrollByPage any
---@field ScrollToBottom "ScrollToBottom"
---@field ScrollToPrompt any
---@field ScrollToTop "ScrollToTop"
---@field Search any
---@field SelectTextAtMouseCursor any
---@field SendKey SendKey
---@field SendString string
---@field SetPaneZoomState any
---@field Show "Show"
---@field ShowDebugOverlay "ShowDebugOverlay"
---@field ShowLauncher "ShowLauncher"
---@field ShowLauncherArgs any
---@field ShowTabNavigator "ShowTabNavigator"
---@field SpawnCommandInNewTab any
---@field SpawnCommandInNewWindow any
---@field SpawnTab any
---@field SpawnWindow "SpawnWindow"
---@field SplitHorizontal any
---@field SplitPane any
---@field SplitVertical any
---@field StartWindowDrag "StartWindowDrag"
---@field SwitchToWorkspace any
---@field SwitchWorkspaceRelative any
---@field ToggleAlwaysOnBottom "ToggleAlwaysOnBottom"
---@field ToggleAlwaysOnTop "ToggleAlwaysOnTop"
---@field ToggleFullScreen "ToggleFullScreen"
---@field TogglePaneZoomState "TogglePaneZoomState"

---@enum (key) KeyAssignmentLiterals
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
  ToggleAlwaysOnBottom = 1,
  ToggleAlwaysOnTop = 1,
  ToggleFullScreen = 1,
  TogglePaneZoomState = 1,
}

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
