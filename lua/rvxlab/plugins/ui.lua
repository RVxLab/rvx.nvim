return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        version = "^1.6.0",
        opts = {
            flavour = "frappe",
        },
        init = function()
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
                ["<leader>Q"] = { name = "[Q]uit buffers", _ = "which_key_ignore" },
                ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "folke/trouble.nvim",
        },
        config = require("rvxlab.util").bound_config("rvxlab.config.lualine"),
    },
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            view_options = {
                show_hidden = true,
            },
        },
        init = function()
            local oil = require("oil")
            vim.keymap.set("n", "-", oil.open_float, {
                desc = "Open Oil",
            })
        end,
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
                    { name = "Lazy", action = "Lazy", section = "General" },
                    { name = "Mason", action = "Mason", section = "General" },
                    { name = "Explore Filesystem", action = "Oil", section = "General" },
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
        enabled = false,
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    {
        "folke/trouble.nvim",
        branch = "dev",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
        opts = {},
        init = function()
            require("which-key").register({
                ["<leader>x"] = { name = "Trouble", _ = "which_key_ignore" },
            })
        end,
    },
    {
        "levouh/tint.nvim",
        opts = {},
    },
}
