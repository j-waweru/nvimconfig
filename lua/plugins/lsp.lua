return {
    -- LSP: Using the new Neovim 0.11/0.12 built-in API
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local servers = { 'clangd', 'asm_lsp', 'pyright', 'marksman', 'lua_ls', 'bashls' }

        -- The new way: Configure and Enable
        for _, lsp in ipairs(servers) do
            vim.lsp.config(lsp, {
                capabilities = capabilities
            })
            vim.lsp.enable(lsp)
            end

            -- Keep your high-visibility diagnostic settings
            vim.diagnostic.config({
                virtual_text = {
                    severity = { min = vim.diagnostic.severity.ERROR },
                    prefix = '●'
                },
                signs = { severity = { min = vim.diagnostic.severity.ERROR } },
                underline = { severity = { min = vim.diagnostic.severity.ERROR } },
                severity_sort = true,
            })

            -- Native keybinds on attach
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                end,
            })
            end
    },

}
