return {
    "airblade/vim-rooter",
    event = "VeryLazy",
    init = function()
        vim.g.rooter_patterns = {
            "package.json",
            "composer.json",
            "Cargo.toml",
            ".git",
        }
    end,
}
