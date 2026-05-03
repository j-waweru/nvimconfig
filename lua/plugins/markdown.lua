return
{

    -- MARKDOWN & FORMATTING
    { 'MeanderingProgrammer/render-markdown.nvim', opts = {} },

    { "iamcco/markdown-preview.nvim", build = "cd app && npm install", ft = "markdown" },
    {
        "stevearc/conform.nvim",
        config = function()
        require("conform").setup({
            formatters_by_ft = { lua = { "stylua" }, python = { "black" }, c = { "clang-format" } },
        })
        end
    },
}
