return {
    "airblade/vim-rooter",
    event = "VeryLazy",
    init = function()
        vim.g.rooter_patterns = { ".git", "composer.json" }
    end,
}
