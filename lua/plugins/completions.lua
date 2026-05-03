return {

    -- COMPLETION & EDITING TOOLS (Originals + Tabout + Surround)
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "L3MON4D3/LuaSnip", "windwp/nvim-autopairs" },
        config = function()
        local cmp = require('cmp')
        cmp.setup({
            snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
                  mapping = cmp.mapping.preset.insert({
                      ['<Tab>'] = cmp.mapping.select_next_item(),
                                                      ['<CR>'] = cmp.mapping.confirm({ select = true }),
                  }),
                  sources = { { name = 'nvim_lsp' } }
        })
        end
    },
    { "windwp/nvim-autopairs", config = true },
    { "windwp/nvim-ts-autotag", config = true },
    { "kylechui/nvim-surround", config = true },
    { "abecodes/tabout.nvim", config = true },
    { "numToStr/Comment.nvim", config = true },


}
