local opt = vim.opt

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

