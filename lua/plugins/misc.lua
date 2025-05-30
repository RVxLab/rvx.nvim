local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("jessarcher/vim-heritage")

    add("tpope/vim-eunuch")

    add("airblade/vim-rooter")
    vim.g.rooter_patterns = {
        "package.json",
        "composer.json",
        ".git",
    }

    add("folke/ts-comments.nvim")
    require("ts-comments").setup({
        lang = {
            blade = "{{-- %s --}}",
        },
    })

    add("folke/todo-comments.nvim")
    require("todo-comments").setup()

    add("nvim-lua/plenary.nvim")
end)
