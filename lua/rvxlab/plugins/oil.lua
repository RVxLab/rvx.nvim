local utils = require("rvxlab.utils")

return {
    "stevearc/oil.nvim",
    dependencies = { "echasnovski/mini.icons" },
    keys = {
        utils.lazy_key("-", function()
            require("oil").open_float()
        end, "Open Oil"),
    },
    cmd = {
        "Oil",
    },
    opts = {
        view_options = {
            show_hidden = true,
        },
        columns = {
            "icon",
            "permissions",
            "size",
        },
    },
}
