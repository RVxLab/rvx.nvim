local lsp = require("rvxlab.lsp")

return {
    "mrcjkb/rustaceanvim",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    version = "^4",
    lazy = false, -- This plugin is already lazy
    init = function()
        vim.g.rustaceanvim = {
            server = {
                on_attach = lsp.on_attach,
            },
        }
    end,
}
