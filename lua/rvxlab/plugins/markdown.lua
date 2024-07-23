local utils = require("rvxlab.utils")

return {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    name = "render-markdown",
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
