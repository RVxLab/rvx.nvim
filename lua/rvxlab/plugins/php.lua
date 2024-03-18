return {
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-dotenv",
            "MunifTanjim/nui.nvim",
            "nvimtools/none-ls.nvim",
            "rcarriga/nvim-notify",
        },
        cmd = { "Laravel", "Artisan" },
        keys = {
            { "<leader>la", ":Laravel artisan<cr>" },
            { "<leader>lr", ":Laravel routes<cr>" },
            { "<leader>lm", ":Laravel related<cr>" },
        },
        event = { "VeryLazy" },
        opts = true,
        init = function()
            require("telescope").load_extension("laravel")
            require("which-key").register({
                ["<leader>l"] = { name = "[L]aravel", _ = "which_key_ignore" },
            })
        end,
    },
}
