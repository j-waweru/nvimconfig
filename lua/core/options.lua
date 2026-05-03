local opt = vim.opt

-- FOLDING SETTINGS
opt.foldcolumn = '1'    -- Show fold indicators in the gutter
opt.foldlevel = 99      -- Open most folds by default
opt.foldlevelstart = 99 -- Ensure folds are open when opening a file
opt.foldenable = true   -- Enable folding

-- Ibeam cursor
--opt.guicursor = "a:ver25"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true

-- Appearance and UI
opt.termguicolors = true
opt.wrap = false
opt.scrolloff = 999 -- Keeps cursor centered vertically
opt.splitbelow = true
opt.splitright = true

-- System Clipboard
-- Ensure you have 'wl-clipboard' installed (for Wayland) or 'xclip' (for X11)
opt.clipboard = "unnamedplus"

