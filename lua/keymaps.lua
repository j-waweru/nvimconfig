local key = vim.keymap.set
vim.g.mapleader = " "

-- ==========================================================================
-- CUSTOM UTILITIES
-- ==========================================================================

-- SEARCH & REPLACE: Grabs the word under cursor and populates the replace command
-- This leaves your cursor ready to type the new word.
key("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace word under cursor" })

-- CHMOD +X: Quickly make a script executable (great for your bash work)
key("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

-- ==========================================================================
-- PLUGIN KEYMAPS
-- ==========================================================================

-- UNDOTREE
key("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })

-- FUGITIVE (Git)
key("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status" })

-- HARPOON (Harpoon 2 logic)
local harpoon = require("harpoon")
key("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })
key("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Menu" })

-- Quick jump to marked files 1-4
key("n", "<leader>1", function() harpoon:list():select(1) end)
key("n", "<leader>2", function() harpoon:list():select(2) end)
key("n", "<leader>3", function() harpoon:list():select(3) end)
key("n", "<leader>4", function() harpoon:list():select(4) end)

-- ==========================================================================
-- EXISTING NAVIGATION & TOOLS
-- ==========================================================================

key('n', '<C-h>', '<C-w>h')
key('n', '<C-j>', '<C-w>j')
key('n', '<C-k>', '<C-w>k')
key('n', '<C-l>', '<C-w>l')

key('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
key('n', '<leader>e', '<cmd>Neotree toggle reveal<cr>')
key('n', '<leader>;', ':')
key('n', '<leader>nh', ':nohlsearch<CR>')
key('n', '<Leader>a', 'A;<Esc>')

-- Run code in an interactive terminal split
key('n', '<leader>r', function()
local ft = vim.bo.filetype
local cmd = ""
if ft == "python" then cmd = "python3 " .. vim.fn.expand("%")
    elseif ft == "c" then cmd = "gcc " .. vim.fn.expand("%") .. " -o out && ./out"
        elseif ft == "sh" then cmd = "bash " .. vim.fn.expand("%")
            elseif ft == "lua" then vim.cmd("source %") return end

                if cmd ~= "" then
                    vim.cmd("split | term " .. cmd)
                    vim.cmd("resize 10")
                    vim.cmd("startinsert")
                    end
                    end)

key('t', '<Esc><Esc>', [[<C-\><C-n>]])

-- Auto-save + Format
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
    require("conform").format({ bufnr = 0 })
    vim.cmd("silent! write")
    end,
})
