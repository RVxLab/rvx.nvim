return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- First we add the Blade parser
        local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
        parser_configs.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade",
        }

        -- Next we load Treesitter
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "rust",
                "tsx",
                "javascript",
                "typescript",
                "vimdoc",
                "vim",
                "bash",
                "json",
                "yaml",
                "php",
                "blade",
                "html",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
    end,
    init = function()
        vim.filetype.add({
            pattern = {
                [".*%.blade%.php"] = "blade",
            },
        })
    end,
}
