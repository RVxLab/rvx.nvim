local utils = require("rvxlab.utils")

return {
    "stevearc/overseer.nvim",
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-telescope/telescope.nvim",
        "j-hui/fidget.nvim",
    },
    enabled = false,
    keys = {
        utils.lazy_key("<leader>or", function()
            -- TODO
        end, "Overseer: [R]un"),
    },
}
