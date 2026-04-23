local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
    end
    vim.opt.rtp:prepend(lazypath)

    require("lazy").setup({
        -- Theme (Ayu Dark)
    {
        "Shatur/neovim-ayu",
        config = function()
        require('ayu').setup({ mirage = false })
        vim.cmd("colorscheme ayu-dark")

        -- Make Line Numbers highly visible
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffcc66" })       -- Greyish for active
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#a8a8a8" })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#a8a8a8" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffcc66", bold = true }) -- Gold for active
        end
    },

    -- LSP & Intellisense (0.12 Native API)
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local servers = { 'clangd', 'asm_lsp', 'pyright', 'marksman', 'lua_ls', 'bashls' }

        for _, lsp in ipairs(servers) do
            vim.lsp.config(lsp, { capabilities = capabilities })
            vim.lsp.enable(lsp)
            end

            -- ERROR DISPLAY: Shows text on screen for Errors only
            vim.diagnostic.config({
                virtual_text = {
                    severity = { min = vim.diagnostic.severity.ERROR },
                    spacing = 4,
                    prefix = '●',
                },
                signs = { severity = { min = vim.diagnostic.severity.ERROR } },
                underline = { severity = { min = vim.diagnostic.severity.ERROR } },
                update_in_insert = false,
                severity_sort = true,
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                end,
            })
            end
    },

    -- AUTO-COMPLETION & BRACKETS
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "L3MON4D3/LuaSnip", "windwp/nvim-autopairs" },
        config = function()
        local cmp = require('cmp')
        local autopairs = require("nvim-autopairs.completion.cmp")

        cmp.setup({
            snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
                  mapping = cmp.mapping.preset.insert({
                      ['<Tab>'] = cmp.mapping.select_next_item(),
                                                      ['<CR>'] = cmp.mapping.confirm({ select = true }),
                  }),
                  sources = { { name = 'nvim_lsp' } }
        })
        cmp.event:on('confirm_done', autopairs.on_confirm_done())
        end
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },

    -- CODE FOLDING (UFO)
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        config = function()
        vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    require('ufo').setup({
        provider_selector = function() return {'lsp', 'indent'} end
    })

    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    end
    },

    -- UI & Navigation
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-neo-tree/neo-tree.nvim", dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" } },
    {
        "folke/noice.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        config = function()
        require("noice").setup({
            messages = { enabled = false },
            presets = { command_palette = true },
        })
        end
    },

    -- Formatter (Conform)
    {
        "stevearc/conform.nvim",
        config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                c = { "clang-format" }
            },
        })
        end
    },
    })

    --- ==========================================================================
    --- THE FLASH FEATURE: Highlight on Yank (Copy)
    --- ==========================================================================
    -- This makes the line flash for 300ms when you yank (copy) it.
    vim.api.nvim_create_autocmd('TextYankPost', {
        desc = 'Highlight when yanking (copying) text',
                                group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
                                callback = function()
                                vim.highlight.on_yank({
                                    higroup = 'IncSearch', -- The color of the flash
                                    timeout = 300,         -- Duration in milliseconds
                                })
                                end,
    })
