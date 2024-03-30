return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        build = ":TSUpdate",
        opts = {
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
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
