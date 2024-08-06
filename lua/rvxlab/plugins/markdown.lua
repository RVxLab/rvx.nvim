local utils = require("rvxlab.utils")

return {
    "MeanderingProgrammer/render-markdown.nvim",
    keys = {
        utils.lazy_key("<leader>cm", function()
            require("render-markdown").toggle()
        end, "Code: Toggle [M]arkdown"),
    },
    ft = { "markdown" },
    opts = {},
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
}
