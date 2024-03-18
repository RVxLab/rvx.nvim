return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        version = "^1.6.0",
        opts = {
            flavour = "frappe",
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)

            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        opts = true,
        priority = 100, -- Ensure Which Key is loaded before a lot of plugins
        init = function()
            require("which-key").register({
                ["<leader>L"] = { name = "[L]azy", _ = "which_key_ignore" },
                ["<leader>s"] = { name = "[S]urround", _ = "which_key_ignore" },
                ["<leader>g"] = { name = "[G]eneral actions", _ = "which_key_ignore" },
            })
        end,
    },
    {
        "echasnovski/mini.statusline",
        version = false,
        opts = true,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "echasnovski/mini.tabline",
        version = false,
        opts = true,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "echasnovski/mini.files",
        version = false,
        opts = true,
        config = function(_, opts)
            local files = require("mini.files")
            files.setup(opts)

            vim.keymap.set("n", "<leader>e", files.open, {
                desc = "[E]xplore filesystem",
            })
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "echasnovski/mini.starter",
        version = false,
        opts = function()
            local starter = require("mini.starter")

            return {
                header = require("art.header"),
                items = {
                    starter.sections.builtin_actions(),
                    starter.sections.telescope(),
                    starter.sections.recent_files(10, true, true),
                },
            }
        end,
    },
    {
        "rcarriga/nvim-notify",
        version = "^3.1",
        opts = true,
        init = function()
            vim.notify = require("notify")
        end,
    },
}
