return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
        background = {
            dark = "macchiato",
        },
    },
    config = function ()
        vim.cmd.colorscheme("catppuccin")
    end,
}
