return {
    -- THEME: Ayu Dark with high-visibility line numbers
    {
        "Shatur/neovim-ayu",
        config = function()
        require('ayu').setup({ mirage = false })
        vim.cmd("colorscheme ayu-dark")

        -- Explicitly set colors for visibility
        local hl = vim.api.nvim_set_hl
        hl(0, "LineNr", { fg = "#ffcc66" })
        hl(0, "LineNrAbove", { fg = "#a8a8a8" })
        hl(0, "LineNrBelow", { fg = "#a8a8a8" })
        hl(0, "CursorLineNr", { fg = "#ffcc66", bold = true })
        hl(0, "FoldColumn", { fg = "#ffcc66" }) -- Visible folding icons
        hl(0, "SignColumn", { bg = "NONE" })    -- Ensure LSP signs show up
        end
    },

    -- UI: Lualine
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
        })
        end
    },

    -- UI: Noice
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
            presets = { command_palette = true, long_message_to_split = true },
        })
        end
    },

    -- TRANSPARENCY: Configured to protect the Gutter
    {
        "xiyaowong/transparent.nvim",
        lazy = false,
        config = function()
        require("transparent").setup({
            extra_groups = {
                "NormalFloat",
                "NvimTreeNormal",
                "NeoTreeNormal",
                "NeoTreeNormalNC",
                "NeoTreeWinSeparator",
                "StatusLine",
                "StatusLineNC",
            },
            -- DO NOT clear these; keep them visible
            exclude_groups = {
                "LineNr",
                "CursorLineNr",
                "FoldColumn",
                "SignColumn",
            },
        })
        vim.cmd("TransparentEnable")
        end,
    },
}
