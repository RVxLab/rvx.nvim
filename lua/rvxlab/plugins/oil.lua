local utils = require("rvxlab.utils")

return {
    "stevearc/oil.nvim",
    -- Latest commit for 0.11 broke 0.10, locking until fixed
    -- https://github.com/stevearc/oil.nvim/pull/411
    commit = "96368e13e9b1aaacc570e4825b8787307f0d05e1",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
    },
}
