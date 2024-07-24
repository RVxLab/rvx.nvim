return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/trouble.nvim",
    },
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
                    require("rvxlab.lualine.components").filepath,
                    {
                        symbols.get,
                        cond = symbols.has,
                    },
                },
            },
        })
    end,
}
