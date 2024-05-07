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
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
})

require("treesitter-context").setup({})
