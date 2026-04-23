vim.g.mapleader = " "
local key = vim.keymap.set



-- Navigation
key('n', '<C-h>', '<C-w>h')
key('n', '<C-j>', '<C-w>j')
key('n', '<C-k>', '<C-w>k')
key('n', '<C-l>', '<C-w>l')
-- Show full error detail in a floating window
key('n', '<leader>d', vim.diagnostic.open_float)

-- Jump between errors
key('n', '[d', vim.diagnostic.goto_prev)
key('n', ']d', vim.diagnostic.goto_next)

-- Tools
key('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
key('n', '<leader>e', '<cmd>Neotree toggle<cr>')

-- Run code
key('n', '<leader>r', function()
local ft = vim.bo.filetype
if ft == "python" then vim.cmd("!python3 %")
    elseif ft == "lua" then vim.cmd("source %")
        elseif ft == "c" then vim.cmd("!gcc % -o out && ./out")
            elseif ft == "sh" then vim.cmd("!bash %")
                end
                end)

-- Auto-save + Format
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
    require("conform").format({ bufnr = 0 })
    vim.cmd("silent! write")
    end,
})
