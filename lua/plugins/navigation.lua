return {

    -- NAVIGATION & FILES
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-neo-tree/neo-tree.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = true },
    { "stevearc/oil.nvim", config = true },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Harpoon Add" },
            { "<leader>hh", function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
                end, desc = "Harpoon Menu" },
        },
        config = function()
        require("harpoon").setup()
        end
    },
    { "mbbill/undotree" },


    -- FOLDING (UFO)
    { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async", config = true },


    -- FLASH: Restricted so it doesn't break native 'f' and 't'
    {
        "folke/flash.nvim",
        opts = { modes = { char = { enabled = false }, search = { enabled = false } } },
        keys = { { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end } },
    },

}
