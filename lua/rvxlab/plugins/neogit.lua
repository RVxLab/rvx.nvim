local utils = require("rvxlab.utils")

return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    cmd = {
        "Neogit",
    },
    keys = {
        utils.lazy_key("<leader>G", function()
            require("neogit").open({
                kind = "auto",
            })
        end, "[G]it"),
    },
    config = true,
}
