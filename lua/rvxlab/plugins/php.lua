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
        cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
        keys = {
            { "<leader>la", ":Laravel artisan<cr>" },
            { "<leader>lr", ":Laravel routes<cr>" },
            { "<leader>lm", ":Laravel related<cr>" },
        },
        event = { "VeryLazy" },
        config = true,
        init = function()
            require("telescope").load_extension("laravel")
            require("which-key").register({
                ["<leader>l"] = { name = "[L]aravel", _ = "which_key_ignore" },
            })
        end,
    },
    {
        "phpactor/phpactor",
        build = "composer install --no-dev -o",
        ft = "php",
        keys = {
            { "<leader>pm", ":PhpactorContextMenu<CR>" },
            { "<leader>pn", ":PhpactorClassNew<CR>" },
        },
        init = function()
            require("which-key").register({
                ["<leader>p"] = { name = "[P]HP", _ = "which_key_ignore" },
            })
        end,
    },
}
