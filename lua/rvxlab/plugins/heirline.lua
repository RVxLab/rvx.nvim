return {
    "rebelot/heirline.nvim",
    enabled = false,
    dependencies = {
        "catppuccin/nvim",
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
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
