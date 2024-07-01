return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    version = "^1.6.0",
    opts = {
        flavour = "macchiato",
        integrations = {
            neotest = true,
            noice = true,
            notify = true,
            lsp_trouble = true,
            which_key = true,
        },
    },
    init = function()
        vim.cmd.colorscheme("catppuccin")
    end,
}
