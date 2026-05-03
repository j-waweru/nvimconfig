return {
    -- THEME: Ayu Dark with your specific line number highlights
    {
        "Shatur/neovim-ayu",
        config = function()
        require('ayu').setup({ mirage = false })
        vim.cmd("colorscheme ayu-dark")
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffcc66" })
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#a8a8a8" })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#a8a8a8" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffcc66", bold = true })
        end
    },
    -- UI: Lualine with your specific separators
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

    -- UI: Noice with your custom command bar icons and presets
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

}
