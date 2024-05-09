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

local context = require("treesitter-context")

context.setup({
    line_numbers = false,
    max_lines = 5,
    multiline_threshold = 3,
})
