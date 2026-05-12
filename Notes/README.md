---

# Neovim 0.12 "God Mode" Setup & Reference

This guide covers setting up a professional, modular Neovim environment. It is designed to be portable between **CachyOS** and **Ubuntu**.

## Step 1: Install System Dependencies

Your OS needs these tools for compilers, LSPs, and Treesitter automation.

### **On Ubuntu / Debian (Apt)**

```bash
sudo apt update && sudo apt install -y build-essential git unzip gcc g++ make python3-pip npm nodejs ripgrep fd-find xclip clangd pyright marksman pkg-config libssl-dev
# CRITICAL: Install the Treesitter CLI so parsers install automatically
sudo npm install -g tree-sitter-cli

```

### **On CachyOS (Pacman)**

```bash
sudo pacman -S base-devel git unzip gcc python-pip npm nodejs ripgrep fd xclip clang pyright marksman
# CRITICAL: Install the Treesitter CLI
sudo npm install -g tree-sitter-cli

```

---

## Step 2: Keymap Reference Sheet

### **1. Navigation & UI**

* **`<Leader> e`**: Toggle **Neo-tree** (File explorer).
* **`<Leader> ff` / `<Leader> fg**`: **Find Files** or **Live Grep** (Text search).
* **`<Leader> ss`**: **Symbol Search** (Jump to functions/structs in current file).
* **`-`** (Minus): Open **Oil.nvim** (Edit folders like a text buffer).
* **`jk`**: Instant Escape to Normal Mode.
* **Gutter**: Clean VSCode-style. No fold numbers, just clickable icons (``, ``).

### **2. Editing & Motion**

* **`s` (Flash)**: Type `s` + 2 chars to jump anywhere. (Native `f/t` preserved).
* **`<Tab>`**: **Tabout**. Jumps out of brackets `()` `[]` `{}` or quotes `""` instantly.
* **`ysw[char]`**: **Surround** Word (e.g., `ysw)` wraps word in parens).
* **`ds[char]`**: **Delete** Surround.
* **`gcc`**: Comment/Uncomment line.

### **3. Intellisense & LSP (0.12 Native)**

* **`K`**: **Hover**. Documentation and function signatures.
* **`gd`**: **Go to Definition**.
* **`<Leader> ca`**: **Code Actions** (Quick-fixes).
* **`<Leader> rn`**: **Smart Rename** (Project-wide).
* **`Tab` / `S-Tab**`: Navigate autocomplete (Tabout takes over if menu is closed).
* **`<Leader> q`**: **Actions** (Shows diagnostics using trouble.nvim).

### **4. Workflow & System**

* **`<Leader> gs`**: **Fugitive** (Git Status/Staging).
* **`<Leader> u`**: **UndoTree** (Visual undo history).
* **`<Leader> ha/hh`**: **Harpoon** Add/Menu (Quick-switch between files).
* **Auto-Save/Format**: Saves on `InsertLeave`. **Conform.nvim** cleans code on every save.

---
