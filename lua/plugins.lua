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
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffcc66" })
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#a8a8a8" })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#a8a8a8" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffcc66", bold = true })
        end
    },

    -- SLEEK STATUS LINE
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
        require('lualine').setup({
            options = {
                theme = 'ayu_dark',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                globalstatus = true,
            },
            sections = {
                lualine_x = {'encoding', 'fileformat', 'filetype'},
            }
        })
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

    -- AUTO-COMPLETION
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

    -- BRACKETS & WEB TAG AUTO-COMPLETE
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = function()
        require('nvim-ts-autotag').setup()
        end
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
    end
    },

    -- FILE NAVIGATION & EXPLORER
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
        config = function()
        require("neo-tree").setup({
            filesystem = {
                follow_current_file = { enabled = true, leave_dirs_open = true },
                use_libuv_file_watcher = true,
            },
        })
        end
    },

    -- THE "OIL" PLUGIN: Edit the filesystem like a buffer
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
        require("oil").setup()
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end,
    },

    -- EDITABLE COMMAND BAR (Noice)
    {
        "folke/noice.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        config = function()
        require("noice").setup({
            cmdline = {
                view = "cmdline_popup",
                format = {
                    cmdline = { pattern = "^:", icon = "", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                },
            },
            messages = { enabled = true },
            popupmenu = { enabled = true },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
            },
        })
        end
    },
    -- COMMENTING: gcc to comment a line, gc in visual mode to comment a block
    {
        'numToStr/Comment.nvim',
        config = function()
        require('Comment').setup()
        end
    },

    -- HARPOON: Quick file switching
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
        require("harpoon").setup()
        end
    },

    -- UNDOTREE: Visualizing your undo history
    { "mbbill/undotree" },

    -- FUGITIVE: The best Git wrapper for Vim
    { "tpope/vim-fugitive" },

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
