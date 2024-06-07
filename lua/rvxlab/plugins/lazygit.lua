local utils = require("rvxlab.util")

return {
    "kdheepak/lazygit.nvim",
    keys = {
        utils.lazy_key("<leader>G", function()
            require("lazygit").lazygit()
        end, "Open Lazy[Git]"),
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
