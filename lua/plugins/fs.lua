local utils = require("utils")

return {
    {
        "stevearc/oil.nvim",
        version = "^2.0",
        keys = {
            utils.lazy_key("-", "<Cmd>Oil<CR>", "Open File Explorer"),
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
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
            },
        },
        dependencies = {
            { "nvim-mini/mini.icons", opts = {} },
        },
        lazy = false,
    },
    {
        "nvim-mini/mini.pick",
        version = false,
        keys = {
            utils.lazy_key("<leader>ff", "<Cmd>Pick files<CR>", "Find files"),
            utils.lazy_key("<leader>fs", "<Cmd>Pick grep_live<CR>", "Search files"),
        },
        opts = {},
        dependencies = {
            { "nvim-mini/mini.icons", opts = {} },
        },
    },
}
