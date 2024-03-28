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
                ["<leader>g"] = { name = "[G]eneral actions", _ = "which_key_ignore" },
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    {
        "echasnovski/mini.tabline",
        version = false,
        opts = true,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        init = function()
            vim.keymap.set("n", "<", vim.cmd.bprevious, {
                desc = "Select the previous buffer",
            })

            vim.keymap.set("n", ">", vim.cmd.bnext, {
                desc = "Select the next buffer",
            })
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = require('rvxlab.util').bind(require, 'rvxlab.config.nvim-tree')
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
                    { name = "Lazy",  action = "Lazy",  section = "General" },
                    { name = "Mason", action = "Mason", section = "General" },
                },
                silent = true,
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
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
}
