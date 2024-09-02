local utils = require("rvxlab.utils")

return {
    "stevearc/overseer.nvim",
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-telescope/telescope.nvim",
        "j-hui/fidget.nvim",
    },
    config = {
        task_list = {
            direction = "bottom",
        },
    },
    keys = {
        utils.lazy_key("<leader>or", function()
            require("overseer").run_template()
        end, "Overseer: [R]un"),
        utils.lazy_key("<leader>oo", function()
            require("overseer").open()
        end, "Overseer: [O]pen"),
        utils.lazy_key("<leader>ot", function()
            require("overseer").toggle()
        end, "Overseer: [T]oggle"),
    },
}
