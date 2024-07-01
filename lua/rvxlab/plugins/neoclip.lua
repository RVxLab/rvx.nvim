local utils = require("rvxlab.utils")

return {
    "AckslD/nvim-neoclip.lua",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "TextYankPost",
    keys = {
        utils.lazy_key("<leader>fc", function()
            require("telescope").extensions.neoclip.default()
        end, "Find: [C]lipboard"),
    },
    opts = {},
    init = function()
        require("telescope").load_extension("neoclip")
    end,
}
