local key = vim.keymap.set
vim.g.mapleader = " "

-- NEW: Symbol Finder (Requested)
key("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>")

-- NEW: Markdown Preview (Requested)
key("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>")

-- Search & Replace (Word under cursor)
key("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Run Code (C, Python, Bash)
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

-- Core Nav
key('n', '<leader>e', '<cmd>Neotree toggle reveal<cr>')
key('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
key('n', '<leader>;', ':')
key('n', '<leader>nh', ':nohlsearch<CR>')
key('n', '<C-h>', '<C-w>h')
key('n', '<C-j>', '<C-w>j')
key('n', '<C-k>', '<C-w>k')
key('n', '<C-l>', '<C-w>l')

-- Chmod
key("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- Escape from Insert mode using jk or jj
key("i", "jk", "<Esc>", { desc = "Escape to Normal Mode" })
--key("i", "jj", "<Esc>", { desc = "Escape to Normal Mode" })

-- Also useful: Escape from Terminal mode
--key("t", "jk", [[<C-\><C-n>]], { desc = "Escape Terminal" })


-- Escape Terminal
key('t', '<Esc><Esc>', [[<C-\><C-n>]])
