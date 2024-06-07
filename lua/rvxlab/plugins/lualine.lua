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
        })

        require("lualine").setup({
            options = {
                globalstatus = true,
                sections = {
                    lualine_c = {
                        "filename",
                        {
                            symbols.get,
                            cond = symbols.has,
                        },
                    },
                },
            },
        })
    end,
}
