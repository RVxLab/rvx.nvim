local utils = require("rvxlab.utils")

return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "echasnovski/mini.icons",
    },
    keys = {
        utils.lazy_key("<leader>cs", function()
            require("aerial").toggle()
        end, "Code: [S]tructure"),
    },
    event = {
        "BufRead",
    },
    opts = {
        -- Make sure Aerial opens on the left edge
        layout = {
            placement = "edge",
            default_direction = "left",
        },
        autojump = true,
        close_on_select = true,
    },
}
