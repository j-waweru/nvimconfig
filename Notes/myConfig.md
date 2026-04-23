Neovim 0.12 Reference Sheet
Navigation & UI
<Leader> e: Toggle Neo-tree (File Explorer).

<Leader> ff: Telescope fuzzy find (Search files).

:: Open floating command palette (Noice).

Ctrl + h/j/k/l: Move between split windows (Left, Down, Up, Right).

Intellisense & LSP
K (Shift + k): Hover. Shows documentation/type info for the code under the cursor.

gd: Go to Definition. Jumps to where the function or variable is defined.

<Leader> ca: Code Actions. Opens a list of quick-fixes for errors.

Ctrl + Space: Force open the Autocomplete menu.

Tab / S-Tab: Cycle forward/backward through suggestions.

Enter: Confirm selection and auto-complete brackets.

Code Folding (UFO)
zR: Open All folds. Expand the entire file.

zM: Close All folds. Collapse all functions/classes to a single line.

za: Toggle the fold at the current cursor position.

Language Specifics (Run Code)
<Leader> r: Execute current file.

C: Compiles with gcc and runs ./out.

Python: Runs with python3.

Bash: Runs with bash.

System Commands
:Lazy: Manage/Update plugins.

:LspInfo: Check if the language server is attached to your file.

:TSInstall [lang]: Install native 0.12 highlighting for a specific language (e.g., :TSInstall c).

:checkhealth: Run a full diagnostic if something feels broken.

Native 0.12 Features
Auto-Save: Triggered on InsertLeave (escaping Insert mode).

Auto-Format: Code is cleaned up automatically via Conform when you save.

Errors Only: No yellow warnings; only red highlights for actual syntax errors.
