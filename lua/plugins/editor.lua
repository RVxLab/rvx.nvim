return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        opts = {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        },
    },
    {
        "saghen/blink.indent",
        --- @module 'blink.indent'
        --- @type blink.indent.Config
        opts = {},
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                bash = { "shellcheck" },
                lua = { "stylua" },
            },
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 500,
            },
        },
    },
    {
        "nvim-mini/mini.surround",
        opts = {},
    },
    {
        "nvim-mini/mini.splitjoin",
        opts = {},
    },
    {
        "nvim-mini/mini.comment",
        opts = {},
    },
}
