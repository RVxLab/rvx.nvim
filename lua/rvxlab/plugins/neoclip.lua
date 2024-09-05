local utils = require("rvxlab.utils")

return {
    "AckslD/nvim-neoclip.lua",
    enabled = false,
    dependencies = {
        "nvim-telescope/telescope.nvim",
        { "kkharji/sqlite.lua", module = "sqlite" },
    },
    event = "TextYankPost",
    keys = {
        utils.lazy_key("<leader>fc", function()
            require("telescope").extensions.neoclip.default()
        end, "Find: [C]lipboard"),
    },
    opts = {
        enable_persistent_history = true,
    },
    init = function()
        require("telescope").load_extension("neoclip")
    end,
}
