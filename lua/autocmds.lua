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
