local lsp = require("rvxlab.lsp")

return {
    {
        "saecki/crates.nvim",
        dependencies = {
            -- Load CMP first so we can load autocompletion
            "hrsh7th/nvim-cmp",
        },
        event = { "BufRead Cargo.toml" },
        opts = {},
    },
    {
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
    },
}
