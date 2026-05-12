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
## Neovim 0.12 "God Mode" Reference Sheet

This sheet covers your full, modular configuration including the recent **LSP 0.12 API** updates and **CachyOS** specific workflow tools.

---

### **1. Navigation & UI**
*   **`<Leader> e`**: Toggle **Neo-tree** (Automatically focuses the current file).
*   **`<Leader> ff`**: **Find Files** (Fuzzy search file names).
*   **`<Leader> fg`**: **Live Grep** (Search for text/strings across the entire project).
*   **`<Leader> ss`**: **Symbol Search** (Jump to specific functions, structs, or variables in current file).
*   **`<Leader> ;`**: Open **Noice** floating command palette.
*   **`<Leader> nh`**: Clear search highlights.
*   **`-`** (Minus): Open **Oil.nvim** (Edit your folders/files like a text buffer).
*   **`Ctrl + h/j/k/l`**: Move focus between split windows.
*   **`jk` / `jj`**: Instant Escape from Insert Mode to Normal Mode.

---

### **2. Editing & Motion (The Speed Layer)**
*   **`s` (Flash)**: Type `s` + two characters to jump anywhere on the screen. (Restricted to 's' to keep native `f/t` functionality).
*   **`<Tab>`** (Inside brackets/quotes): **Tabout**. Jumps out of the closing bracket or quote instantly.
*   **`gcc`**: Comment/Uncomment the current line.
*   **`gc`**: (Visual Mode) Comment/Uncomment the highlighted block.
*   **`ysw[char]`**: **Surround** Word. (e.g., `ysw)` wraps the word in parentheses).
*   **`ds[char]`**: **Delete** Surround. (e.g., `ds"` removes surrounding quotes).
*   **`cs[old][new]`**: **Change** Surround. (e.g., `cs)]` changes `(word)` to `[word]`).

---

### **3. Intellisense & LSP**
*   **`K`**: **Hover**. Shows documentation, function signatures, or struct members.
*   **`gd`**: **Go to Definition**. Jump to where a function or variable is defined.
*   **`[d` / `]d`**: Jump to the **Previous** or **Next** Diagnostic (Error/Warning).
*   **`<Leader> ca`**: **Code Actions**. Opens a menu for quick-fixes (like adding missing includes).
*   **`<Leader> rn`**: **Smart Rename**. Renames a variable/function across the whole project.
*   **`Tab` / `S-Tab`**: Navigate the autocomplete suggestion list.
*   **`Enter`**: Confirm selection in autocomplete.

---

### **4. Workflow & Git**
*   **`<Leader> ha`**: Add current file to **Harpoon** list.
*   **`<Leader> hh`**: Toggle **Harpoon** quick-menu.
*   **`<Leader> u`**: Open **UndoTree** (Visualizes your undo history as a branching tree).
*   **`<Leader> gs`**: **Fugitive** (Git Status). Best for staging and committing.
*   **`<Leader> s`**: Global Search & Replace (Automatically populates with word under cursor).

---

### **5. System & Execution**
*   **`<Leader> r`**: **Interactive Runner**. Compiles and runs C, Python, or Bash in a split terminal.
*   **`<Leader> x`**: **Chmod +x**. Makes the current script/binary executable.
*   **`:Lazy`**: Manage, update, or debug plugins.
*   **`:checkhealth`**: Troubleshoot LSP or system provider issues.
*   **Auto-Save**: Saves your work the moment you exit Insert Mode.
*   **Auto-Format**: **Conform.nvim** cleans up your C/Python/Lua code on every save.

---

### **6. Code Folding (UFO)**
*   **`zR`**: Expand **all** folds in the file.
*   **`zM`**: Collapse **all** folds in the file.
*   **`za`**: Toggle the current fold (open/close).
*   **Gutter Numbers**: Use the `+` and `-` in the side column to see fold ranges.

---

### **7. Markdown Power-Suite**
*   **`<Leader> mp`**: **Markdown Preview**. Toggles a live browser window for the current file.
*   **In-Editor Rendering**: Headers, bolding, and checkboxes render visually in the buffer.
*   **`:RenderMarkdown toggle`**: Switches between raw Markdown and the visual layout.

---

### **Pro-Tip: Navigation Logic**
When working on large C or Assembly projects:
1.  Use **`<Leader> ss`** to find your functions.
2.  Use **`gd`** to see where a variable came from.
3.  Use **`<Leader> fg`** to find where that variable is used in other files.
4.  Use **Harpoon** (`<leader>ha`) to "pin" your main files so you never have to search for them twice.</Leader></Leader></Leader></Leader></Leader></Leader></Leader></Leader></Leader></Leader></Leader></Leader></Tab></Leader></Leader></Leader></Leader></Leader></Leader>
