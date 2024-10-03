local utils = require("rvxlab.utils")

return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "echasnovski/mini.icons",
    },
    keys = {
        utils.lazy_key("<leader>cm", function()
            require("render-markdown").toggle()
        end, "Code: Toggle [M]arkdown"),
    },
    ft = { "markdown" },
    opts = {},
}
