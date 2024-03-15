return {
    {
        "lewis6991/gitsigns.nvim",
        version = "~0.7",
        opts = {
            current_line_blame = true,
            yadm = {
                enable = false, -- I don't use yadm
            },
        },
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        init = function()
            vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", {
                desc = "Open Lazy[G]it",
            })
        end,
    },
}
