---@meta
---@diagnostic disable:unused-local

---@enum (key) Warp.OsType
local os_types = { windows = 1, linux = 1, mac = 1, unknown = 1 }

---@enum (key) Warp.String.TruncateMode
local truncate_modes = { left = 1, middle = 1, right = 1 }

---@enum (key) Warp.Table.MergeBehavior
local merge_behaviors = { error = 1, force = 1, keep = 1 }

---@class Warp.Table.MergeOpts
---@field behavior? Warp.Table.MergeBehavior
---@field combine? boolean

---@class Warp.FileSystem.Platform
---Whether the platform is Linux.
---
---@field is_linux boolean
---Whether the platform is macOS.
---
---@field is_mac boolean
---Whether the platform is Windows.
---
---@field is_win boolean
---Operating system name.
---
---@field os Warp.OsType

---@class Warp.FileSystem
---@field target_triple string
---@field is_win boolean
---@field home string
local F = {}

---Extract base name from path.
---
---Equivalent to POSIX `basename(3)`.
---
---Returns the final component of the path.
---
---@param path string File path.
---@return string basename Final component of the path.
function F.basename(path) end

---Find git project root.
---
---Traverses up the directory tree looking for a `.git` directory.
---
---@param directory string Starting directory path.
---@return string|nil git_root Root directory of the Git repository, or `nil` if not found.
function F.find_git_dir(directory) end

---Get the current working directory from the given pane.
---
---Parses the pane's current working directory URI.
---Normalises the home directory to `~`.
---Optionally resolves the git root instead of the literal CWD.
---
---@param pane Pane WezTerm pane object.
---@param search_git_root_instead boolean If `true`, returns the Git root instead of CWD.
---@return string cwd Current working directory or the Git root.
function F.get_cwd(pane, search_git_root_instead) end

---@deprecated Use `get_cwd` and `get_hostname` separately.
---Kept for backwards compatibility; delegates to the two focused functions.
---
---@param pane Pane WezTerm pane object.
---@param search_git_root_instead boolean If `true`, returns the Git root instead of CWD.
---@return string cwd Current working directory or the Git root.
---@return string hostname Short hostname of the pane.
function F.get_cwd_hostname(pane, search_git_root_instead) end

---Get the hostname associated with the given pane.
---
---Parses the pane's current working directory URI to extract the host field.
---
---Falls back to `wezterm.hostname()` when the URI carries no host information.
---Strips any domain suffix and title-cases the result.
---
---@param pane Pane WezTerm pane object.
---@return string hostname Short hostname of the pane.
function F.get_hostname(pane) end

---Check whether a path is a directory.
---
---Uses `io.open()` to probe the path.
---Not 100% reliable on all platforms but avoids `lfs` or FFI dependencies — good enough
---for WezTerm configuration code.
---
---@param path string Path to check.
---@return boolean dir
function F.is_dir(path) end

---Get platform information.
---
---Identifies OS based on `wezterm.target_triple`.
---
---@return Warp.FileSystem.Platform platform Platform details (OS name, boolean flags).
function F.platform() end

---Read the entire contents of a small file.
---
---Returns `nil` when the file cannot be opened.
---
---@param path string File path to read.
---@return string|nil contents File contents, or `nil` on failure.
function F.read_file(path) end

---@class Warp.List.BisectOpts
---Search variant (default `"lower"`).
---
---@field bound? "lower"|"upper"
---End index, exclusive (default `#list + 1`).
---
---@field hi? integer
---Map each element before comparison.
---
---@field key? fun(val: any): any
---Start index (default `1`).
---
---@field lo? integer

---@class Warp.List
local L = {}

---Binary search for an insertion point in a sorted list.
---
---Returns the index where `val` can be inserted while keeping `list` sorted.
---
---With `bound = "lower"` (default) returns the first valid position;
---with `bound = "upper"` returns the last valid position.
---
---Behavior is undefined on unsorted lists.
---
---```lua
---local t = { 1, 2, 2, 3, 3, 3 }
---M.bisect(t, 3) -- 4 (first position)
---M.bisect(t, 3, { bound = "upper" }) -- 7 (past last)
---```
---
---@generic T
---@param list T[] Sorted list.
---@param val T Value to search for.
---@param opts? Warp.List.BisectOpts Options.
---@return integer index Insertion point.
function L.bisect(list, val, opts) end

---Compute Cartesian product of multiple lists.
---
---Collects all combinations from `cartesian_iter_copy()` into a single table.
---Each entry is an independent table that can be safely stored or mutated.
---
---@param sets any[][] List of sub-lists for the product.
---@return any[][] combinations All combinations.
function L.cartesian(sets) end

---Compute Cartesian product of multiple lists (iterator).
---
---Returns an iterator yielding each combination as a shared table.
---
---The returned table is reused between iterations; copy it if you
---need to store or mutate individual results.
---
---```lua
---for i, combo in M.cartesian_iter({ { 1, 2 }, { "a", "b" } }) do
---  print(i, combo[1], combo[2])
---end
----- 1  1  a
----- 2  1  b
----- 3  2  a
----- 4  2  b
---```
---
---@param sets any[][] List of sub-lists for the product.
---@return fun(): integer|nil, any[]|nil iterator
function L.cartesian_iter(sets) end

---Compute Cartesian product of multiple lists (copying iterator).
---
---Wraps `cartesian_iter()`, copying each yielded combination into a fresh table
---that the caller can safely store or mutate.
---
---@param sets any[][] List of sub-lists for the product.
---@return fun(): integer|nil, any[]|nil iterator
function L.cartesian_iter_copy(sets) end

---Check if a list contains a given value.
---
---Scans the array portion (`1` to `#list`) using a numeric `for`.
---Comparison uses raw equality (`==`).
---
---For general tables (hash keys, predicate matching) use:
--- - [warp.table.contains()](lua://Warp.Table.contains).
---
---@generic T
---@param list  T[] List to search.
---@param value T   Value to find.
---@return boolean `true` if `list` contains `value`.
function L.contains(list, value) end

---Append elements from one list into another in-place.
---
---Inserts elements from `src` (from index `start` to `finish`, inclusive)
---at the end of `dst`. Mutates and returns `dst`.
---
---@generic T: table
---@param dst T Destination list (modified in-place).
---@param src table Source list.
---@param start? integer First index in `src` (default `1`).
---@param finish? integer Last index in `src` (default `#src`).
---@return T dst The destination list.
function L.extend(dst, src, start, finish) end

---Append elements from one list into another, skipping duplicates.
---
---For each item in `src`, scans `dst` and appends the item only when it is not already present.
---Comparison uses raw equality (`==`). Mutates and returns `dst`.
---
---```lua
---M.extend_unique({ 1, 2, 3 }, { 3, 4, 5 })
----- { 1, 2, 3, 4, 5 }
---```
---
---@generic T: table
---@param dst T Destination list (modified in-place).
---@param src any[] Source list.
---@return T dst The destination list.
function L.extend_unique(dst, src) end

---Find the first element matching a predicate.
---
---Scans the array portion (`1` to `#list`) and returns the first element
---for which `fn` returns a truthy value, along with its index.
---
---Returns `nil` if no match is found.
---
---@generic T
---@param list T[] List to search.
---@param fn fun(v: T): any Predicate function.
---@return T|nil value First matching element, or `nil`.
---@return integer|nil index Index of the match, or `nil`.
function L.find(list, fn) end

---Flatten a nested list.
---
---Recursively flattens sub-lists up to `depth` levels deep.
---When `depth` is `nil`, flattens completely.
---
---@generic T
---@param list any[] List to flatten.
---@param depth? integer Maximum nesting depth (default: unlimited).
---@return T[] flat New flattened list.
function L.flatten(list, depth) end

---Reverse list elements in-place.
---
---Swaps elements from both ends toward the center.
---Only the array portion (`1` to `#list`) is affected; hash keys are untouched.
---
---@generic T
---@param list T[] List to reverse.
---@return T[] list The same list, reversed.
function L.reverse(list) end

---Create a sub-list copy.
---
---Returns a new list containing elements from `start` to `finish` (inclusive).
---Does not modify the original list.
---
---@generic T
---@param list T[] Source list.
---@param start? integer First index (default `1`).
---@param finish? integer Last index (default `#list`).
---@return T[] slice New list with the selected elements.
function L.slice(list, start, finish) end

---Remove duplicate values from a list in-place.
---Only the first occurrence of each value is kept.
---
---When `key` is provided it is called for each element to compute a hash key for
---uniqueness comparison. If `key` returns `nil` for a value, that value
---is always considered unique.
---
---```lua
---M.unique({ 1, 2, 2, 3, 1 })
----- { 1, 2, 3 }
---
---M.unique(
---  { { id = 1 }, { id = 2 }, { id = 1 } },
---  function(x) return x.id end
---)
----- { { id = 1 }, { id = 2 } }
---```
---
---@generic T
---@param list T[] List to deduplicate (modified in-place).
---@param key? fun(x: T): any Optional uniqueness key function.
---@return T[] list The same list, deduplicated.
function L.unique(list, key) end

---Zip parallel lists into a list of tuples.
---
---Combines elements at the same index from each input list.
---Stops at the length of the shortest list.
---
---@param ... any[][] Lists to zip.
---@return any[][] tuples List of tuples.
function L.zip(...) end

---@class Warp.Maths
local MT = {}

---Clamp a number to the range [`minimum`, `maximum`].
---
---Returns `minimum` when `number` is below the range, `maximum` when above,
---or `number` itself when already within bounds.
---
---@param number number Value to clamp.
---@param minimum number Lower bound (inclusive).
---@param maximum number Upper bound (inclusive).
---@return number result Clamped value.
function MT.clamp(number, minimum, maximum) end

---Round a number to the nearest integer (half-to-even).
---
---Uses an IEEE 754 double-precision trick: adding then subtracting a magic constant
---forces the floating-point unit to round to the nearest representable integer.
---Ties are broken by rounding to the nearest **even** integer (banker's rounding),
---e.g. `0.5` → `0`, `1.5` → `2`, `2.5` → `2`.
---
---Only accurate for numbers whose absolute value is less than `2^51` (`2251799813685248`).
---
---@param number number Number to round.
---@return integer result Nearest integer (half-to-even).
function MT.round(number) end

---Round a number to the nearest given multiple (half-to-even).
---
---Divides by `multiple`, rounds the quotient using the same IEEE 754 half-to-even trick
---as `Warp.Maths.round()`, then multiplies back.
---
---@param number number Number to round.
---@param multiple integer Target multiple (must be non-zero).
---@return integer result Nearest multiple of `multiple`.
function MT.round_to(number, multiple) end

---@class Warp.Path
---Whether the current platform is Windows.
---
---@field is_win boolean
---Platform-specific path separator (`\` on Windows, `/` elsewhere).
---
---@field separator string
local P = {}

---Concatenate path components.
---
---Joins arguments using the platform-specific path separator.
---
---@param ... string Path components to join.
---@return string path Joined path string.
function P.concat(...) end

---Return the parent directory of a path.
---
---@param path string File or directory path.
---@return string dirname Parent directory, or `.` if none.
function P.dirname(path) end

---Expand `~` prefix to the user home directory.
---
---Requires the filesystem module to resolve the home path. Only expands a leading `~`
---followed by `/`, `\`, or end-of-string.
---
---@param path string File or directory path.
---@return string expanded Path with `~` replaced by the home directory.
function P.expand(path) end

---Return the file extension including the leading dot.
---
---Returns an empty string when no extension is found.
---
---@param path string File path.
---@return string extension Extension (e.g. `.lua`), or `""`.
function P.extension(path) end

---Check whether a path is absolute.
---
---@param path string File or directory path.
---@return boolean absolute
function P.is_absolute(path) end

---Abbreviate path by shortening intermediate components to specified length.
---
---@param path string File or directory path.
---@param len integer Number of characters to keep per component.
---@return string shortened Abbreviated path.
function P.shorten(path, len) end

---Shorten a path to fit within a visible column budget.
---
---Abbreviates intermediate directory components, and if the last component
---still doesn't fit, then it middle-truncates it.
---
---Preserves the general path shape for readability.
---
---@param path string File or directory path.
---@param max_len integer Maximum visible column width.
---@return string shortened Abbreviated path.
function P.shorten_to(path, max_len) end

---Normalize a path.
---
---Collapses `.`, `..`, and repeated separators.
---Converts backslashes to forward slashes.
---Preserves a leading `~` and trailing separator only when the path is root (`/`).
---
---@param path string File or directory path.
---@return string normalized Normalized path.
function P.normalize(path) end

---@class Warp.String.SplitOpts
---If `true`, treat `sep` as plain text.
---
---@field plain? boolean
---If `true`, trim empty edge segments.
---
---@field trimempty? boolean

---@class Warp.String
---Empty string constant.
---
---@field empty ""
---Single space constant.
---
---@field space " "
local S = {}

---@alias Warp.String.Padding integer|{ left: integer|nil, right: integer|nil }

---Alias for `wezterm.column_width`.
---
---@param s string
---@return integer width
function S.col_width(s) end

---Check whether `s` ends with the given suffix.
---
---@param s string Input string.
---@param suffix string Suffix to test.
---@return boolean ends
function S.ends_with(s, suffix) end

---Return whether `s` already fits within `budget` visible columns.
---
---@param s string
---@param budget integer
---@return boolean fits
function S.fits(s, budget) end

---Iterate over substrings separated by pattern.
---
---Returns an iterator yielding substrings from input `s`, separated by `sep`.
---
---@param s string Input string to split.
---@param sep string Separator pattern.
---@param opts? Warp.String.SplitOpts Optional splitting behavior.
---@return fun(): string|nil iterator
function S.gsplit(s, sep, opts) end

---Left-justify `s` to a total visible width.
---
---Pads on the right so the result is at least `total_width` columns wide.
---If `s` already meets or exceeds the width, it is returned unchanged.
---
---@param s string Input string.
---@param total_width integer Desired total column width.
---@param ch? string Padding character (default `" "`).
---@return string str
function S.ljust(s, total_width, ch) end

---Pad string on both sides.
---
---Converts input to string if necessary and adds
---whitespace to both sides. Adds a single whitespace by
---default but respects `nil` values when `padding` is a
---table (e.g. `{ left = 1, right = nil }` won't add any
---right padding).
---
---@param s string|any Input value to pad.
---@param padding? Warp.String.Padding Spaces to add per side. Defaults to `1`.
---@param ch? string Char to use when padding. Defaults to `" "`
---@return string padded Resulting padded string.
function S.pad(s, padding, ch) end

---Pad string on left side.
---
---@param s any Input value to pad.
---@param padding? integer Spaces to add. Defaults to `1`
---@param ch? string Char to use when padding. Defaults to `" "`
---@return string padded Resulting left-padded string.
function S.padl(s, padding, ch) end

---Pad string on right side.
---
---@param s any Input value to pad.
---@param padding? integer Spaces to add. Defaults to `1`
---@param ch? string Char to use when padding. Defaults to `" "`
---@return string padded Resulting right-padded string.
function S.padr(s, padding, ch) end

---Right-justify `s` to a total visible width.
---
---Pads on the left so the result is at least `total_width` columns wide.
---If `s` already meets or exceeds the width, it is returned unchanged.
---
---@param s string Input string.
---@param total_width integer Desired total column width.
---@param ch? string Padding character (default `" "`).
---@return string str
function S.rjust(s, total_width, ch) end

---Split string into list of substrings.
---
---Uses `warp.string.gsplit()` internally.
---
---@param s string Input string to split.
---@param sep string Separator pattern.
---@param opts? Warp.String.SplitOpts Optional splitting behavior.
---@return string[] parts List of substrings.
function S.split(s, sep, opts) end

---Check whether `s` starts with the given prefix.
---
---@param s string Input string.
---@param prefix string Prefix to test.
---@return boolean starts
function S.starts_with(s, prefix) end

---Strip ANSI/VT escape sequences from a string.
---
---@param s string Raw rendered string, may contain ANSI codes.
---@return string s String with ANSI sequences removed.
function S.strip_ansi(s) end

---Remove leading and trailing whitespace.
---
---@param s string Input string.
---@return string trimmed Trimmed string.
function S.trim(s) end

---Truncate `s` to fit within `budget` columns using the specified strategy.
---
---@param mode Warp.String.TruncateMode Truncation strategy.
---@param s string Input string.
---@param budget integer Total columns available.
---@return string truncated Truncated string.
function S.truncate(mode, s, budget) end

---Truncate from the **left**, prepending an ellipsis.
---
---`"plasma-csd-generator.rebupk"` → `"…ator.rebupk"`
---
---@param s string Input string.
---@param budget integer Total columns available (including the ellipsis).
---@return string truncated Truncated string.
function S.truncate_left(s, budget) end

---Truncate from the **middle**, keeping both ends readable.
---The left side gets the extra column when the budget is odd.
---
---`"plasma-csd-generator.rebupk"` → `"plasma-c…rebupk"`
---
---@param s string Input string.
---@param budget integer Total columns available (including the ellipsis).
---@return string truncated Truncated string.
function S.truncate_middle(s, budget) end

---Truncate from the **right**, appending an ellipsis.
---
---`"plasma-csd-generator.rebupk"` → `"plasma-csd-gen…"`
---
---@param s string Input string.
---@param budget integer Total columns available (including the ellipsis).
---@return string truncated Truncated string.
function S.truncate_right(s, budget) end

---Calculate visible string width.
---
---Strips any ANSI escape sequences (otherwise they would contribute to the width)
---and then calls the WezTerm internal `column_width()` function.
---
---@param s string Input string.
---@return integer column_width Visible column width.
function S.width(s) end

---@class Warp.Table
local T = {}

---Check if a table contains a given value.
---
---Scans all values via `pairs()`. Comparison uses raw equality (`==`).
---
---When `opts.predicate` is `true`, `value` is treated as a predicate function that receives
---each table value and should return `true` for a match.
---
---Use `warp.list.contains()` for a faster check on list-like tables.
---
---@param tbl table Table to search.
---@param value any Value to find, or predicate.
---@param opts? { predicate?: boolean } Options.
---@return boolean contains `true` if `tbl` contains a matching value.
function T.contains(tbl, value, opts) end

---Shallow copy of a table.
---
---Creates a new table with the same key-value pairs.
---
---Nested tables are not cloned — they share the same reference.
---Non-table values are returned as-is. Metatables are not copied.
---
---@param obj any Value to copy. Non-tables are returned as-is.
---@return any copy Shallow copy if table, otherwise the original.
function T.copy(obj) end

---Count all entries in a table.
---
---Returns the total number of key-value pairs (array and hash).
---
---For list-like tables the result equals `#tbl`; for mixed or hash tables it includes all keys.
---
---@param tbl table Table to count.
---@return integer count Number of entries.
function T.count(tbl) end

---Deep compare two values for equality.
---
---Tables are compared recursively: two tables are equal when they have
---the same set of keys and every corresponding pair of values is deeply equal.
---Reference-equal values (`a == b`) short-circuit immediately, which also respects
---any `__eq()` metamethod. All other types are compared with `==`.
---
---@param a any First value.
---@param b any Second value.
---@return boolean equals `true` if the values are deeply equal.
function T.deep_equal(a, b) end

---Recursively merge two or more tables.
---
---Behaves like `warp.table.extend()` but recursively merges values that are non-list tables.
---List-like tables and non-table values are overwritten according to `behavior`, not merged.
---This is useful for combining nested configuration tables where lists should be treated
---as atomic values.
---
---@param behavior Warp.Table.MergeBehavior Conflict strategy.
---@param ... table Two or more tables to merge.
---@return table merged Recursively merged table.
function T.deep_extend(behavior, ...) end

---Deep copy of a table.
---
---Recursively copies all nested tables, producing a fully independent clone.
---Metatables are preserved on every level. Non-table values are returned as-is.
---
---When `noref` is `false` (default) each table is copied at most once and circular references
---are handled — all references to the same source table point to one copy.
---When `noref` is `true` every occurrence produces a new copy, which is faster for tables with
---many unique sub-tables but will loop infinitely on cyclic structures.
---
---@param obj any Value to deep copy. Non-tables returned as-is.
---@param noref? boolean Skip reference tracking when `true`.
---@return any copy Deep copy if table, otherwise the original.
function T.deepcopy(obj, noref) end

---Merge two or more tables.
---
---Returns a new table built by iterating every key-value pair from each source table in order.
---
---The `behavior` parameter controls what happens when a key appears in more than one table:
---
---- `"error"` — raise an error.
---- `"keep"` — use the value from the leftmost table.
---- `"force"` — use the value from the rightmost table.
---
---@param behavior Warp.Table.MergeBehavior Conflict strategy.
---@param ... table Two or more tables to merge.
---@return table merged Merged table.
function T.extend(behavior, ...) end

---Filter a table using a predicate function.
---
---Creates a new list containing only the values for which `fn` returns a truthy value.
---Keys are discarded — the result is always a flat list.
---
---Iteration follows `pairs()` order (not guaranteed to be stable).
---
---@generic V
---@param tbl table<any, V> Table to filter.
---@param fn fun(value: V): boolean Predicate function.
---@return V[] result Filtered values.
function T.filter(tbl, fn) end

---Index into a table via successive keys.
---
---Traverses nested tables by indexing with each key in order.
---
---Returns `nil` if any intermediate key is missing or leads to a non-table value
---before the final key.
---
---```lua
---M.get({ key = { nested = true } }, "key", "nested")
----- true
---M.get({ key = {} }, "key", "nested")
----- nil
---```
---
---@param tbl table Table to index.
---@param ... any Keys to traverse (one or more).
---@return any|nil value Nested value, or `nil` if not found.
function T.get(tbl, ...) end

---Swap keys and values of a table.
---
---Creates a new table where each value becomes a key and its former key becomes the value.
---When multiple keys share the same value, one of them wins arbitrarily.
---
---@generic K, V
---@param tbl table<K, V> Table to invert.
---@return table<V, K> inverted Inverted table.
function T.invert(tbl) end

---Check if a table is indexed only by integers.
---
---Returns `true` when every key in `tbl` is an integer (positive, negative, or zero),
---even if there are gaps.
---An empty table (`{}`) is considered a valid array.
---
---Returns `false` for non-table values.
---
---Use `warp.table.islist()` to test for a contiguous 1-based sequence.
---
---@param tbl any Value to check.
---@return boolean array
function T.isarray(tbl) end

---Check if a table has no entries (array or hash).
---
---Returns `true` when `tbl` is `nil` or `next(tbl)` is `nil`, meaning no array
---or hash-map keys exist.
---
---@param tbl table|nil Table to check.
---@return boolean blank
function T.isblank(tbl) end

---Check if a list has no array elements.
---
---Returns `true` when `tbl` is `nil` or its length is `0`.
---
---Hash-only entries are ignored; use `warp.table.isblank()` to test for a completely empty table.
---
---@param tbl table|nil List to check.
---@return boolean empty
function T.isempty(tbl) end

---Check if a table is a contiguous integer-indexed list.
---
---Returns `true` when every key in `tbl` is a consecutive integer from `1` to `#tbl`
---with no gaps or extra hash keys.
---An empty table (`{}`) is considered a valid list.
---
---Returns `false` for non-table values.
---
---@param tbl any Value to check.
---@return boolean list
function T.islist(tbl) end

---Return all keys of a table.
---
---Creates a new list containing every key from `tbl`.
---
---The order is not guaranteed (follows `pairs()` traversal).
---Works on both list-like and hash tables.
---
---@generic K
---@param tbl table<K, any> Table to extract keys from.
---@return K[] keys List of all keys.
function T.keys(tbl) end

---Apply a function to every value of a table.
---
---Creates a new table where each value is the result of calling `fn` on
---the corresponding value in `tbl`. Keys are preserved.
---
---Iteration follows `pairs()` order (not guaranteed to be stable).
---
---@generic K, V
---@param tbl table<K, V> Table to transform.
---@param fn fun(value: V): any Mapping function.
---@return table<K, any> result Transformed table.
function T.map(tbl, fn) end

---In-place deep merge of tables.
---
---Recursively merges key-value pairs from each source table into `tbl`, modifying it directly.
---Non-list sub-tables are merged recursively; list-like tables and non-table values are
---overwritten according to `behavior`.
---
---When `opts.combine` is `true`, list-like incoming values are appended to existing list values
---(skipping duplicates) instead of overwriting them.
---
---`opts` can be a behavior string shorthand (`"error"`, `"keep"`, or `"force"`), or a table:
---
---- `behavior` — `"error"` | `"keep"` | `"force"` (default `"keep"`).
---- `combine` — append list values instead of overwriting.
---
---@param opts Warp.Table.MergeOpts|Warp.Table.MergeBehavior Options or behavior string.
---@param tbl table Base table to merge into (modified in-place).
---@param ... table One or more source tables.
---@return table tbl The base table.
function T.merge(opts, tbl, ...) end

---Fold a table into a single value.
---
---Iterates all entries via `pairs()` and accumulates a result by calling `fn(acc, value, key)`
---for each entry.
---
---The order is not guaranteed (follows `pairs()` traversal).
---
---@generic V, R
---@param tbl table<any, V> Table to reduce.
---@param fn fun(acc: R, value: V, key: any): R Reducer.
---@param init R Initial accumulator.
---@return R result Final accumulated value.
function T.reduce(tbl, fn, init) end

---Iterate key-value pairs in sorted key order.
---
---Returns an iterator suitable for `for`-`in` loops.
---
---Keys are collected, sorted with `table.sort()`, and yielded in ascending order.
---
---Only works correctly when all keys are of the same comparable type
---(typically strings or numbers).
---
---@generic K, V
---@param tbl table<K, V> Table to iterate.
---@return fun(): K|nil, V|nil iterator Sorted key-value iterator.
function T.spairs(tbl) end

---Return all values of a table.
---
---Creates a new list containing every value from `tbl`.
---
---The order is not guaranteed (follows `pairs()` traversal).
---Works for both list-like and hash tables.
---
---@generic V
---@param tbl table<any, V> Table to extract values from.
---@return V[] values List of all values.
function T.values(tbl) end

---Public API surface for the Warp plugin.
---
---@class Warp
---Filesystem helpers.
---
---@field filesystem Warp.FileSystem
---List (sequence) utilities.
---
---@field list Warp.List
---Math helpers.
---
---@field maths Warp.Maths
---Path manipulation helpers.
---
---@field path Warp.Path
---String utilities.
---
---@field string Warp.String
---General table utilities.
---
---@field table Warp.Table

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
