This guide will walk you through setting up a professional, modular Neovim 0.12 environment from scratch. We¡¯ll cover the system dependencies for both Arch-based (CachyOS) and Debian-based (Ubuntu) systems, the file structure, and the logic for your new power-user features.

---

## Step 1: Install System Dependencies
Before opening Neovim, your OS needs the tools to compile C code, run LSPs, and handle clipboard operations.

### **On CachyOS (Pacman/Paru)**
```bash
sudo pacman -S base-devel git unzip gcc python-pip lua-language-server npm nodejs ripgrep fd xclip clang pyright marksman
```

### **On Debian/Ubuntu (Apt)**
```bash
sudo apt update && sudo apt install -y build-essential git unzip gcc python3-pip npm nodejs ripgrep fd-find xclip clangd pyright marksman
```

---

## Step 2: Organize the File Structure
To keep the config maintainable, we use a modular layout. Create these directories and files in `~/.config/nvim/`.

```text
~/.config/nvim/
©À©¤©¤ init.lua          # The entry point
©¸©¤©¤ lua/
    ©À©¤©¤ options.lua   # Native Neovim settings
    ©À©¤©¤ plugins.lua   # Lazy.nvim and plugin configs
    ©À©¤©¤ keymaps.lua   # All shortcuts and custom logic
    ©¸©¤©¤ autocmds.lua  # Events (Auto-save, Yank flash)
```

---

## Step 3: Configure the Core Logic

### **`init.lua`**
This file simply links everything together.
```lua
require("options")
require("plugins")
require("keymaps")
require("autocmds")
```
---

## Neovim 0.12 Reference Sheet

### **Navigation & UI**
*   **`<Leader> e`**: Toggle Neo-tree (Auto-reveals current file).
*   **`<Leader> ff`**: Telescope fuzzy find.
*   **`<Leader> ;`**: Open floating command palette (Noice).
*   **`<Leader> nh`**: Clear search highlights.
*   **`-`**: Open **Oil.nvim** (Edit filesystem like a text buffer).
*   **`Ctrl + h/j/k/l`**: Move between split windows.
*   **`jk` / `jj`**: Instant Escape to Normal Mode.

### **Workflow & Git**
*   **`gcc`**: Comment/Uncomment current line.
*   **`gc`**: (Visual Mode) Comment/Uncomment selection. Supports C, Python, Bash, etc.
*   **`<Leader> ha`**: Add file to **Harpoon**.
*   **`<Leader> hh`**: Toggle Harpoon menu.
*   **`<Leader> u`**: Open **UndoTree** (Visual branching history).
*   **`<Leader> gs`**: Open **Fugitive** (Git Status).
*   **`<Leader> x`**: Make current file executable (`chmod +x`).
*   **`<Leader> s`**: Search and replace the word under cursor globally.

### **Intellisense & LSP**
*   **`K`**: Hover (Show documentation).
*   **`gd`**: Go to Definition.
*   **`<Leader> ca`**: Code Actions (Quick-fixes).
*   **`Tab / S-Tab`**: Cycle through autocomplete suggestions.

### **Code Folding (UFO)**
*   **`zR`**: Expand all folds.
*   **`zM`**: Collapse all folds.
*   **`za`**: Toggle single fold.

### **System & Run**
*   **`<Leader> r`**: Execute current file in interactive terminal (Scanf support).
*   **`:Lazy`**: Plugin manager.
*   **`:checkhealth`**: Run diagnostics.
*   **Auto-Save**: Triggered when escaping Insert mode.
*   **Auto-Format**: Conform.nvim cleans code on save.</Leader></Leader></Leader></Leader></Leader></Leader></Leader></Leader></Leader></Leader></Leader></Leader>
