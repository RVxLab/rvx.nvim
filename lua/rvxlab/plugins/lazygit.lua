local utils = require("rvxlab.utils")

return {
    "kdheepak/lazygit.nvim",
    enabled = false,
    keys = {
        utils.lazy_key("<leader>G", function()
            require("lazygit").lazygit()
        end, "Open Lazy[Git]"),
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
