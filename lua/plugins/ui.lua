local utils = require("utils")

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {
            background = {
                dark = "macchiato",
            },
        },
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        opts = {
            cmdline = {
                view = "cmdline",
            },
        },
    },
    {
        "nvim-mini/mini.statusline",
        opts = {},
    },
    {
        "nvim-mini/mini.starter",
        opts = {
            header = utils.bind(require, "art.header"),
        },
    },
}
