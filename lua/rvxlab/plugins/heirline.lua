return {
    "rebelot/heirline.nvim",
    enabled = false,
    dependencies = {
        "catppuccin/nvim",
    },
    -- enabled = false,
    event = "UiEnter",
    opts = function()
        local colors = require("rvxlab.heirline.colors")
        local spacer = require("rvxlab.heirline.components.spacer")
        local mode = require("rvxlab.heirline.components.mode")

        return {
            statusline = {
                mode,
                spacer,
            },
            opts = {
                colors = colors,
            },
        }
    end,
}
