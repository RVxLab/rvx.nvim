return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    version = "^1.6.0",
    opts = {
        flavour = "frappe",
    },
    init = function()
        vim.cmd.colorscheme("catppuccin")
    end,
}
