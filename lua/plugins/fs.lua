local utils = require("utils")

return {
    {
        "stevearc/oil.nvim",
        version = "^2.0",
        keys = {
            utils.lazy_key("-", "<Cmd>Oil<CR>", "Open File Explorer")
        },
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },
        },
        dependencies = {
            { "echasnovski/mini.icons", opts = {} },
        },
        lazy = false,
    },
    {
        "echasnovski/mini.pick",
        version = false,
        keys = {
            utils.lazy_key("<leader>ff", "<Cmd>Pick files<CR>", "Find files"),
        },
        opts = {},
        dependencies = {
            { "echasnovski/mini.icons", opts = {} },
        },
    },
}
