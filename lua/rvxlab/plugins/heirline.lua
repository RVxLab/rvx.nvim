return {
    "rebelot/heirline.nvim",
    enabled = false,
    dependencies = {
        "catppuccin/nvim",
        "lewis6991/gitsigns.nvim",
        "echasnovski/mini.icons",
    },
    -- enabled = false,
    event = "UiEnter",
    opts = function()
        local colors = require("rvxlab.heirline.colors")
        local components = require("rvxlab.heirline.components")

        return {
            statusline = {
                components.mode,
                components.spacer(),
                components.git,
            },
            opts = {
                colors = colors,
            },
        }
    end,
}
