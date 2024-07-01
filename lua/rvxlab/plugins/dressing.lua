return {
    "stevearc/dressing.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = {
        select = {
            backend = {
                "telescope",
                "nui",
                "builtin",
            },
        },
    },
}
