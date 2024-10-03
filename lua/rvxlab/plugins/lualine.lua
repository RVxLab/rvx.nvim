return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "echasnovski/mini.icons",
        "folke/trouble.nvim",
    },
    enabled = false,
    config = function()
        local trouble = require("trouble")

        local symbols = trouble.statusline({
            mode = "lsp_document_symbols",
            groups = {},
            title = false,
            filter = { range = true },
            format = "{kind_icon}{symbol.name:Normal}",
            hl_group = "lualine_c_normal", -- Ensure the background of the trouble component matches the rest
        })

        require("lualine").setup({
            options = {
                theme = "catppuccin",
                globalstatus = true,
            },
            sections = {
                lualine_c = {
                    {
                        symbols.get,
                        cond = symbols.has,
                    },
                },
            },
        })
    end,
}
