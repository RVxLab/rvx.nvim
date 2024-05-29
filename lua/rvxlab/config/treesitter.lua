local util = require("rvxlab.util")

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

-- Now we initialize any addons
local context = require("treesitter-context")

context.setup({
    line_numbers = false,
    max_lines = 5,
    multiline_threshold = 3,
})

util.n_keymap("[c", function()
    context.go_to_context(vim.v.count1)
end, "Go to parent [c]ontext")
