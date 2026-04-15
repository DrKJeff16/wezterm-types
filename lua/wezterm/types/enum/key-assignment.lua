---@meta
---@diagnostic disable:unused-local

---Mirrors `KeyAssignment`-related types in wezterm upstream:
---https://github.com/wezterm/wezterm/blob/main/config/src/keyassignment.rs
---

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
  ShortCodes = 1,
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
  JumpAgain = 1,
  JumpReverse = 1,
  MoveBackwardSemanticZone = 1,
  MoveBackwardWord = 1,
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
}

---@enum (key) ScrollbackEraseMode
local scrollback_erase_mode = {
  ScrollbackAndViewport = 1,
  ScrollbackOnly = 1,
}

---@enum (key) SetWindowLevelParams
local set_window_level = {
  AlwaysOnBottom = 1,
  AlwaysOnTop = 1,
  Normal = 1,
}

---@alias SpawnTabDomain
---|"CurrentPaneDomain"
---|"DefaultDomain"
---|{ DomainId: integer }
---|{ DomainName: string }

---@alias CopyModeParams
---|CopyModeStr
---|{ JumpBackward: { prev_char: boolean } }
---|{ JumpForward: { prev_char: boolean } }
---|{ MoveBackwardZoneOfType: "Input"|"Output"|"Prompt" }
---|{ MoveByPage: number }
---|{ MoveForwardZoneOfType: "Input"|"Output"|"Prompt" }
---|{ SetSelectionMode: SelectionMode }

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

---Activates a named key table.
---
---@class ActivateKeyTableParams
---The name of the table to activate.
---
---The name must match up to an entry in the `config.key_tables` configuration.
---
---For more information, see:
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

---@enum (key) RotationDirection
local rotation_direction = {
  Clockwise = 1,
  CounterClockwise = 1,
}

---@enum (key) LauncherArgsFlags
local launcher_args_flags = {
  COMMANDS = 1,
  DOMAINS = 1,
  FUZZY = 1,
  KEY_ASSIGNMENTS = 1,
  LAUNCH_MENU_ITEMS = 1,
  TABS = 1,
  WORKSPACES = 1,

  ["COMMANDS|DOMAINS"] = 1,
  ["COMMANDS|FUZZY"] = 1,
  ["COMMANDS|KEY_ASSIGNMENTS"] = 1,
  ["COMMANDS|LAUNCH_MENU_ITEMS"] = 1,
  ["COMMANDS|TABS"] = 1,
  ["COMMANDS|WORKSPACES"] = 1,
  ["DOMAINS|COMMANDS"] = 1,
  ["DOMAINS|FUZZY"] = 1,
  ["DOMAINS|KEY_ASSIGNMENTS"] = 1,
  ["DOMAINS|LAUNCH_MENU_ITEMS"] = 1,
  ["DOMAINS|TABS"] = 1,
  ["DOMAINS|WORKSPACES"] = 1,
  ["FUZZY|COMMANDS"] = 1,
  ["FUZZY|DOMAINS"] = 1,
  ["FUZZY|KEY_ASSIGNMENTS"] = 1,
  ["FUZZY|LAUNCH_MENU_ITEMS"] = 1,
  ["FUZZY|TABS"] = 1,
  ["FUZZY|WORKSPACES"] = 1,
  ["KEY_ASSIGNMENTS|COMMANDS"] = 1,
  ["KEY_ASSIGNMENTS|DOMAINS"] = 1,
  ["KEY_ASSIGNMENTS|FUZZY"] = 1,
  ["KEY_ASSIGNMENTS|LAUNCH_MENU_ITEMS"] = 1,
  ["KEY_ASSIGNMENTS|TABS"] = 1,
  ["KEY_ASSIGNMENTS|WORKSPACES"] = 1,
  ["LAUNCH_MENU_ITEMS|COMMANDS"] = 1,
  ["LAUNCH_MENU_ITEMS|DOMAINS"] = 1,
  ["LAUNCH_MENU_ITEMS|FUZZY"] = 1,
  ["LAUNCH_MENU_ITEMS|KEY_ASSIGNMENTS"] = 1,
  ["LAUNCH_MENU_ITEMS|TABS"] = 1,
  ["LAUNCH_MENU_ITEMS|WORKSPACES"] = 1,
  ["TABS|COMMANDS"] = 1,
  ["TABS|DOMAINS"] = 1,
  ["TABS|FUZZY"] = 1,
  ["TABS|KEY_ASSIGNMENTS"] = 1,
  ["TABS|LAUNCH_MENU_ITEMS"] = 1,
  ["TABS|WORKSPACES"] = 1,
  ["WORKSPACES|COMMANDS"] = 1,
  ["WORKSPACES|DOMAINS"] = 1,
  ["WORKSPACES|FUZZY"] = 1,
  ["WORKSPACES|KEY_ASSIGNMENTS"] = 1,
  ["WORKSPACES|LAUNCH_MENU_ITEMS"] = 1,
  ["WORKSPACES|TABS"] = 1,

  -- ["COMMANDS|DOMAINS|FUZZY"] = 1,
  -- ["COMMANDS|DOMAINS|KEY_ASSIGNMENTS"] = 1,
  -- ["COMMANDS|DOMAINS|LAUNCH_MENU_ITEMS"] = 1,
  -- ["COMMANDS|DOMAINS|TABS"] = 1,
  -- ["COMMANDS|DOMAINS|WORKSPACES"] = 1,
  -- ["COMMANDS|FUZZY|KEY_ASSIGNMENTS"] = 1,
  -- ["COMMANDS|FUZZY|LAUNCH_MENU_ITEMS"] = 1,
  -- ["COMMANDS|FUZZY|TABS"] = 1,
  -- ["COMMANDS|FUZZY|WORKSPACES"] = 1,
  -- ["COMMANDS|KEY_ASSIGNMENTS|DOMAINS"] = 1,
  -- ["COMMANDS|KEY_ASSIGNMENTS|FUZZY"] = 1,
  -- ["COMMANDS|KEY_ASSIGNMENTS|LAUNCH_MENU_ITEMS"] = 1,
  -- ["COMMANDS|KEY_ASSIGNMENTS|TABS"] = 1,
  -- ["COMMANDS|KEY_ASSIGNMENTS|WORKSPACES"] = 1,
  -- ["COMMANDS|LAUNCH_MENU_ITEMS|DOMAINS"] = 1,
  -- ["COMMANDS|LAUNCH_MENU_ITEMS|FUZZY"] = 1,
  -- ["COMMANDS|LAUNCH_MENU_ITEMS|KEY_ASSIGNMENTS"] = 1,
  -- ["COMMANDS|LAUNCH_MENU_ITEMS|TABS"] = 1,
  -- ["COMMANDS|LAUNCH_MENU_ITEMS|WORKSPACES"] = 1,
  -- ["COMMANDS|TABS|DOMAINS"] = 1,
  -- ["COMMANDS|TABS|FUZZY"] = 1,
  -- ["COMMANDS|TABS|KEY_ASSIGNMENTS"] = 1,
  -- ["COMMANDS|TABS|LAUNCH_MENU_ITEMS"] = 1,
  -- ["COMMANDS|TABS|WORKSPACES"] = 1,
  -- ["COMMANDS|WORKSPACES|DOMAINS"] = 1,
  -- ["COMMANDS|WORKSPACES|FUZZY"] = 1,
  -- ["COMMANDS|WORKSPACES|KEY_ASSIGNMENTS"] = 1,
  -- ["COMMANDS|WORKSPACES|LAUNCH_MENU_ITEMS"] = 1,
  -- ["COMMANDS|WORKSPACES|TABS"] = 1,
  -- ["DOMAINS|COMMANDS|FUZZY"] = 1,
  -- ["DOMAINS|COMMANDS|KEY_ASSIGNMENTS"] = 1,
  -- ["DOMAINS|COMMANDS|LAUNCH_MENU_ITEMS"] = 1,
  -- ["DOMAINS|COMMANDS|TABS"] = 1,
  -- ["DOMAINS|COMMANDS|WORKSPACES"] = 1,
  -- ["DOMAINS|FUZZY|COMMANDS"] = 1,
  -- ["DOMAINS|FUZZY|KEY_ASSIGNMENTS"] = 1,
  -- ["DOMAINS|FUZZY|LAUNCH_MENU_ITEMS"] = 1,
  -- ["DOMAINS|FUZZY|TABS"] = 1,
  -- ["DOMAINS|FUZZY|WORKSPACES"] = 1,
  -- ["DOMAINS|KEY_ASSIGNMENTS|COMMANDS"] = 1,
  -- ["DOMAINS|KEY_ASSIGNMENTS|FUZZY"] = 1,
  -- ["DOMAINS|KEY_ASSIGNMENTS|LAUNCH_MENU_ITEMS"] = 1,
  -- ["DOMAINS|KEY_ASSIGNMENTS|TABS"] = 1,
  -- ["DOMAINS|KEY_ASSIGNMENTS|WORKSPACES"] = 1,
  -- ["DOMAINS|LAUNCH_MENU_ITEMS|COMMANDS"] = 1,
  -- ["DOMAINS|LAUNCH_MENU_ITEMS|FUZZY"] = 1,
  -- ["DOMAINS|LAUNCH_MENU_ITEMS|KEY_ASSIGNMENTS"] = 1,
  -- ["DOMAINS|LAUNCH_MENU_ITEMS|TABS"] = 1,
  -- ["DOMAINS|LAUNCH_MENU_ITEMS|WORKSPACES"] = 1,
  -- ["DOMAINS|TABS|COMMANDS"] = 1,
  -- ["DOMAINS|TABS|FUZZY"] = 1,
  -- ["DOMAINS|TABS|KEY_ASSIGNMENTS"] = 1,
  -- ["DOMAINS|TABS|LAUNCH_MENU_ITEMS"] = 1,
  -- ["DOMAINS|TABS|WORKSPACES"] = 1,
  -- ["DOMAINS|WORKSPACES|COMMANDS"] = 1,
  -- ["DOMAINS|WORKSPACES|FUZZY"] = 1,
  -- ["DOMAINS|WORKSPACES|KEY_ASSIGNMENTS"] = 1,
  -- ["DOMAINS|WORKSPACES|LAUNCH_MENU_ITEMS"] = 1,
  -- ["DOMAINS|WORKSPACES|TABS"] = 1,
  -- ["FUZZY|COMMANDS|DOMAINS"] = 1,
  -- ["FUZZY|COMMANDS|KEY_ASSIGNMENTS"] = 1,
  -- ["FUZZY|COMMANDS|LAUNCH_MENU_ITEMS"] = 1,
  -- ["FUZZY|COMMANDS|TABS"] = 1,
  -- ["FUZZY|COMMANDS|WORKSPACES"] = 1,
  -- ["FUZZY|DOMAINS|COMMANDS"] = 1,
  -- ["FUZZY|DOMAINS|KEY_ASSIGNMENTS"] = 1,
  -- ["FUZZY|DOMAINS|LAUNCH_MENU_ITEMS"] = 1,
  -- ["FUZZY|DOMAINS|TABS"] = 1,
  -- ["FUZZY|DOMAINS|WORKSPACES"] = 1,
  -- ["FUZZY|KEY_ASSIGNMENTS|COMMANDS"] = 1,
  -- ["FUZZY|KEY_ASSIGNMENTS|DOMAINS"] = 1,
  -- ["FUZZY|KEY_ASSIGNMENTS|LAUNCH_MENU_ITEMS"] = 1,
  -- ["FUZZY|KEY_ASSIGNMENTS|TABS"] = 1,
  -- ["FUZZY|KEY_ASSIGNMENTS|WORKSPACES"] = 1,
  -- ["FUZZY|LAUNCH_MENU_ITEMS|COMMANDS"] = 1,
  -- ["FUZZY|LAUNCH_MENU_ITEMS|DOMAINS"] = 1,
  -- ["FUZZY|LAUNCH_MENU_ITEMS|KEY_ASSIGNMENTS"] = 1,
  -- ["FUZZY|LAUNCH_MENU_ITEMS|TABS"] = 1,
  -- ["FUZZY|LAUNCH_MENU_ITEMS|WORKSPACES"] = 1,
  -- ["FUZZY|TABS|COMMANDS"] = 1,
  -- ["FUZZY|TABS|DOMAINS"] = 1,
  -- ["FUZZY|TABS|KEY_ASSIGNMENTS"] = 1,
  -- ["FUZZY|TABS|LAUNCH_MENU_ITEMS"] = 1,
  -- ["FUZZY|TABS|WORKSPACES"] = 1,
  -- ["FUZZY|WORKSPACES|COMMANDS"] = 1,
  -- ["FUZZY|WORKSPACES|DOMAINS"] = 1,
  -- ["FUZZY|WORKSPACES|KEY_ASSIGNMENTS"] = 1,
  -- ["FUZZY|WORKSPACES|LAUNCH_MENU_ITEMS"] = 1,
  -- ["FUZZY|WORKSPACES|TABS"] = 1,
  -- ["KEY_ASSIGNMENTS|COMMANDS|DOMAINS"] = 1,
  -- ["KEY_ASSIGNMENTS|COMMANDS|FUZZY"] = 1,
  -- ["KEY_ASSIGNMENTS|COMMANDS|LAUNCH_MENU_ITEMS"] = 1,
  -- ["KEY_ASSIGNMENTS|COMMANDS|TABS"] = 1,
  -- ["KEY_ASSIGNMENTS|COMMANDS|WORKSPACES"] = 1,
  -- ["LAUNCH_MENU_ITEMS|COMMANDS|DOMAINS"] = 1,
  -- ["LAUNCH_MENU_ITEMS|COMMANDS|FUZZY"] = 1,
  -- ["LAUNCH_MENU_ITEMS|COMMANDS|KEY_ASSIGNMENTS"] = 1,
  -- ["LAUNCH_MENU_ITEMS|COMMANDS|TABS"] = 1,
  -- ["LAUNCH_MENU_ITEMS|COMMANDS|WORKSPACES"] = 1,
  -- ["TABS|COMMANDS|DOMAINS"] = 1,
  -- ["TABS|COMMANDS|FUZZY"] = 1,
  -- ["TABS|COMMANDS|KEY_ASSIGNMENTS"] = 1,
  -- ["TABS|COMMANDS|LAUNCH_MENU_ITEMS"] = 1,
  -- ["TABS|COMMANDS|WORKSPACES"] = 1,
  -- ["WORKSPACES|COMMANDS|DOMAINS"] = 1,
  -- ["WORKSPACES|COMMANDS|FUZZY"] = 1,
  -- ["WORKSPACES|COMMANDS|KEY_ASSIGNMENTS"] = 1,
  -- ["WORKSPACES|COMMANDS|LAUNCH_MENU_ITEMS"] = 1,
  -- ["WORKSPACES|COMMANDS|TABS"] = 1,
}

---@class PaneSelectParams
---@field alphabet? QuickSelectAlphabet|string
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
---@field action? Action
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

---@alias SearchParams
---|{ Regex: string }
---|{ CaseSensitiveString: string }
---|{ CaseInSensitiveString: string }

---@class CopyTextToParams
---@field text string
---@field destination ClipboardCopyDestination

---@class ShowLauncherArgsParams
---The set of flags that specifies what to show in the launcher.
---
---The flags can be joined together using a `|` character,
---so `"TABS|DOMAINS"` is an example of a set of flags that will
---include both tabs and domains in the list.
---
---@field flags LauncherArgsFlags|string
---The title to show in the tab while the launcher is active.
---
---@field title? string
---A string to display when in the default mode.
---
---Defaults to: `"Select an item and press Enter=launch Esc=cancel /=filter"`.
---
---@field help_text? string
---A string to display when in fuzzy finding mode.
---
---Defaults to: `"Fuzzy matching: "`.
---
---@field fuzzy_help_text? string
---A string of unique characters.
---
---The characters in the string are used to calculate one or two key press shortcuts
---that can be used to quickly choose from the Launcher when in the default mode.
---
---Defaults to the same value as `config.launcher_alphabet` (`"1234567890abcdefghilmnopqrstuvwxyz"`).
---
---See:
--- - [`config.launcher_alphabet`](lua://Config.launcher_alphabet)
---
---@field alphabet? QuickSelectAlphabet|string

---@class SplitPaneParams
---Specifies where the new pane will end up.
---This field is required.
---
---@field direction PaneDirection
---Controls the size of the new pane.
---
---Can be either:
--- - `{ Cells = 10 }` (i.e. 10 cells)
--- - `{ Percent = 50 }` (i.e. 50% of the available space)
---
---If omitted, `{ Percent = 50 }` is the default.
---
---@field size? { Cells: integer }|{ Percent: integer }
---The `SpawnCommand` specifying what program to launch into the new pane.
---
---If omitted, `config.default_prog` will be used.
---
---For more information, see:
--- - [`SpawnCommand`](lua://SpawnCommand)
--- - [`config.default_prog`](lua://Config.default_prog)
---
---@field command? SpawnCommand
---If set to true, rather than splitting the active pane, the split will be made
---at the root of the tab and effectively split the entire tab
---across the fullest possible extent.
---
---The default is `false`.
---
---@field top_level? boolean

---@class SwitchToWorkspaceParams
---The name of the workspace.
---
---If omitted, a randomly generated name will be chosen.
---
---@field name? string
---A `SpawnCommand` describing the command that should be started in the workspace
---if it doesn't already exist.
---
---If omitted, the default program will be spawned in the newly created workspace.
---
---For more information, see:
--- - [`SpawnCommand`](lua://SpawnCommand)
---
---@field spawn? SpawnCommand

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
---@alias CharSelect { CharSelect: CharSelectParams }|fun(params: CharSelectParams): { CharSelect: CharSelectParams }
---@alias ClearScrollback fun(params: ScrollbackEraseMode): { ClearScrollback: ScrollbackEraseMode }
---@alias CloseCurrentPane fun(params: { confirm: boolean }): { CloseCurrentPane: { confirm: boolean } }
---@alias CloseCurrentTab fun(params: { confirm: boolean }): { CloseCurrentTab: { confirm: boolean } }
---@alias CompleteSelection fun(params: ClipboardCopyDestination): { CompleteSelection: ClipboardCopyDestination }
---@alias CompleteSelectionOrOpenLinkAtMouseCursor fun(params: ClipboardCopyDestination): { CompleteSelectionOrOpenLinkAtMouseCursor: ClipboardCopyDestination }
---@alias Confirmation fun(params: ConfirmationParams): { Confirmation: ConfirmationParams }
---@alias CopyMode fun(params: CopyModeParams): { CopyMode: CopyModeParams }
---@alias CopyTo fun(params: ClipboardCopyDestination): { CopyTo: ClipboardCopyDestination }
---@alias CopyTextTo fun(params: CopyTextToParams): { CopyTextTo: CopyTextToParams }
---@alias DetachDomain fun(params: SpawnTabDomain): { DetachDomain: SpawnTabDomain }
---@alias EmitEvent fun(event_id: T<string>): { EmitEvent: T<string> }
---@alias ExtendSelectionToMouseCursor fun(params: SelectionMode): { ExtendSelectionToMouseCursor: SelectionMode }
---@alias InputSelector fun(params: InputSelectorParams): { InputSelector: InputSelectorParams }
---@alias MoveTab fun(index: T<integer>): { MoveTab: T<integer> }
---@alias MoveTabRelative fun(index: T<integer>): { MoveTabRelative: T<integer> }
---@alias Multiple { Multiple: Action[] }|fun(events: Action[]): { Multiple: Action[] }
---@alias OpenUri fun(uri: T<string>): { OpenUri: T<string> }
---@alias PaneSelect { PaneSelect: PaneSelectParams }|fun(params: PaneSelectParams): { PaneSelect: PaneSelectParams }
---@alias PasteFrom fun(source: ClipboardPasteDestination): { PasteFrom: ClipboardPasteDestination }
---@alias PromptInputLine fun(params: PromptInputLineParams): { PromptInputLine: PromptInputLineParams }
---@alias QuickSelectArgs { QuickSelectArgs: QuickSelectArgsParams }|fun(params: QuickSelectArgsParams): { QuickSelectArgs: QuickSelectArgsParams }
---@alias RotatePanes fun(params: RotationDirection): { RotatePanes: RotationDirection }
---@alias ScrollByLine fun(amount: T<integer>): { ScrollByLine: T<integer> }
---@alias ScrollByPage fun(amount: T<number>): { ScrollByPage: T<number> }
---@alias ScrollToPrompt fun(amount: T<integer>): { ScrollToPrompt: T<integer> }
---@alias Search fun(params: "CurrentSelectionOrEmptyString"|SearchParams): { Search: "CurrentSelectionOrEmptyString"|SearchParams }
---@alias SelectTextAtMouseCursor fun(params: SelectionMode): { SelectTextAtMouseCursor: SelectionMode }
---@alias SendKey fun(params: SendKeyParams): { SendKey: SendKeyParams }
---@alias SendString fun(params: T<string>): { SendString: T<string> }
---@alias SetPaneZoomState fun(state: boolean): { SetPaneZoomState: boolean }
---@alias SetWindowLevel fun(level: SetWindowLevelParams): { SetWindowLevel: SetWindowLevelParams }
---@alias ShowLauncherArgs fun(params: ShowLauncherArgsParams): { ShowLauncherArgs: ShowLauncherArgsParams }
---@alias SpawnCommandInNewTab { SpawnCommandInNewTab: SpawnCommand }|fun(params: SpawnCommand): { SpawnCommandInNewTab: SpawnCommand }
---@alias SpawnCommandInNewWindow { SpawnCommandInNewWindow: SpawnCommand }|fun(params: SpawnCommand): { SpawnCommandInNewWindow: SpawnCommand }
---@alias SpawnTabAction fun(params: SpawnTabDomain): { SpawnTab: SpawnTabDomain }
---@alias SplitHorizontal { SplitHorizontal: SpawnCommand }|fun(params: SpawnCommand): { SplitHorizontal: SpawnCommand }
---@alias SplitPane fun(params: SplitPaneParams): { SplitPane: SplitPaneParams }
---@alias SplitVertical { SplitVertical: SpawnCommand }|fun(params: SpawnCommand): { SplitVertical: SpawnCommand }
---@alias SwitchToWorkspace { SwitchToWorkspace: SwitchToWorkspaceParams }|fun(params: SwitchToWorkspaceParams): { SwitchToWorkspace: SwitchToWorkspaceParams }
---@alias SwitchWorkspaceRelative fun(params: T<integer>): { SwitchWorkspaceRelative: T<integer> }

---@alias Actions
---|{ ActivateKeyTable: ActivateKeyTableParams }
---|{ ActivatePaneByIndex: integer }
---|{ ActivatePaneDirection: PaneDirection }
---|{ ActivateTab: integer }
---|{ ActivateTabRelative: integer }
---|{ ActivateTabRelativeNoWrap: integer }
---|{ ActivateWindow: integer }
---|{ ActivateWindowRelative: integer }
---|{ ActivateWindowRelativeNoWrap: integer }
---|{ AdjustPaneSize: { [1]: PaneDirection, [2]: integer } }
---|{ AttachDomain: string }
---|{ CharSelect: CharSelectParams }
---|{ ClearScrollback: ScrollbackEraseMode }
---|{ CloseCurrentPane: { confirm: boolean } }
---|{ CloseCurrentTab: { confirm: boolean } }
---|{ CompleteSelection: ClipboardCopyDestination }
---|{ CompleteSelectionOrOpenLinkAtMouseCursor: ClipboardCopyDestination }
---|{ Confirmation: ConfirmationParams }
---|{ CopyMode: CopyModeParams }
---|{ CopyTo: ClipboardCopyDestination }
---|{ CopyTextTo: CopyTextToParams }
---|{ DetachDomain: SpawnTabDomain }
---|{ EmitEvent: string }
---|{ ExtendSelectionToMouseCursor: SelectionMode }
---|{ InputSelector: InputSelectorParams }
---|{ MoveTab: integer }
---|{ MoveTabRelative: integer }
---|{ Multiple: Action[] }
---|{ OpenUri: string }
---|{ PaneSelect: PaneSelectParams }
---|{ PasteFrom: ClipboardPasteDestination }
---|{ PromptInputLine: PromptInputLineParams }
---|{ QuickSelectArgs: QuickSelectArgsParams }
---|{ RotatePanes: RotationDirection }
---|{ ScrollByLine: integer }
---|{ ScrollByPage: number }
---|{ ScrollToPrompt: integer }
---|{ Search: "CurrentSelectionOrEmptyString"|SearchParams }
---|{ SelectTextAtMouseCursor: SelectionMode }
---|{ SendKey: SendKeyParams }
---|{ SendString: string }
---|{ SetPaneZoomState: boolean }
---|{ SetWindowLevel: SetWindowLevelParams }
---|{ ShowLauncherArgs: ShowLauncherArgsParams }
---|{ SpawnCommandInNewTab: SpawnCommand }
---|{ SpawnCommandInNewWindow: SpawnCommand }
---|{ SpawnTab: SpawnTabDomain }
---|{ SplitHorizontal: SpawnCommand }
---|{ SplitPane: SplitPaneParams }
---|{ SplitVertical: SpawnCommand }
---|{ SwitchToWorkspace: SwitchToWorkspaceParams }
---|{ SwitchWorkspaceRelative: integer }

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
---@field CopyTextTo CopyTextTo
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
---@field OpenUri OpenUri
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
---@field RotatePanes RotatePanes
---@field ScrollByCurrentEventWheelDelta "ScrollByCurrentEventWheelDelta"
---@field ScrollByLine ScrollByLine
---@field ScrollByPage ScrollByPage
---@field ScrollToBottom "ScrollToBottom"
---@field ScrollToPrompt ScrollToPrompt
---@field ScrollToTop "ScrollToTop"
---@field Search Search
---@field SelectTextAtMouseCursor SelectTextAtMouseCursor
---@field SendKey SendKey
---@field SendString SendString
---@field SetPaneZoomState SetPaneZoomState
---@field SetWindowLevel SetWindowLevel
---@field Show "Show"
---@field ShowDebugOverlay "ShowDebugOverlay"
---@field ShowLauncher "ShowLauncher"
---@field ShowLauncherArgs ShowLauncherArgs
---@field ShowTabNavigator "ShowTabNavigator"
---@field SpawnCommandInNewTab SpawnCommandInNewTab
---@field SpawnCommandInNewWindow SpawnCommandInNewWindow
---@field SpawnTab SpawnTabAction
---@field SpawnWindow "SpawnWindow"
---@field SplitHorizontal SplitHorizontal
---@field SplitPane SplitPane
---@field SplitVertical SplitVertical
---@field StartWindowDrag "StartWindowDrag"
---@field SwitchToWorkspace SwitchToWorkspace
---@field SwitchWorkspaceRelative SwitchWorkspaceRelative
---@field ToggleAlwaysOnBottom "ToggleAlwaysOnBottom"
---@field ToggleAlwaysOnTop "ToggleAlwaysOnTop"
---@field ToggleFullScreen "ToggleFullScreen"
---@field TogglePaneZoomState "TogglePaneZoomState"

---@enum (key) KeyAssignmentLiterals
local key_assignment = {
  ActivateCommandPalette = 1,
  ActivateCopyMode = 1,
  ActivateLastTab = 1,
  ClearKeyTableStack = 1,
  ClearSelection = 1,
  DecreaseFontSize = 1,
  DisableDefaultAssignment = 1,
  Hide = 1,
  HideApplication = 1,
  IncreaseFontSize = 1,
  Nop = 1,
  OpenLinkAtMouseCursor = 1,
  PopKeyTable = 1,
  QuickSelect = 1,
  QuitApplication = 1,
  ReloadConfiguration = 1,
  ResetFontAndWindowSize = 1,
  ResetFontSize = 1,
  ResetTerminal = 1,
  ScrollByCurrentEventWheelDelta = 1,
  ScrollToBottom = 1,
  ScrollToTop = 1,
  Show = 1,
  ShowDebugOverlay = 1,
  ShowLauncher = 1,
  ShowTabNavigator = 1,
  SpawnWindow = 1,
  StartWindowDrag = 1,
  ToggleAlwaysOnBottom = 1,
  ToggleAlwaysOnTop = 1,
  ToggleFullScreen = 1,
  TogglePaneZoomState = 1,
}

---@alias Action (Actions|KeyAssignmentLiterals|CharSelect|Multiple|PaneSelect|QuickSelectArgs|SpawnCommandInNewTab|SpawnCommandInNewWindow|SplitHorizontal|SplitVertical|SwitchToWorkspace)

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
---A string of unique characters.
---
---@field alphabet? QuickSelectAlphabet|string
---A string to display when in the default mode.
---
---@field description? string
---A string to display when in fuzzy finding mode.
---
---@field fuzzy_description? string

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
  Next = 1,
  Prev = 1,
}

---@class SendKeyParams
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

---@class Key: SendKeyParams
---@field action? Action

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
