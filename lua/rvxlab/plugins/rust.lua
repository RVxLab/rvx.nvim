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
        version = "^4",
        lazy = false, -- This plugin is already lazy
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    on_attach = function(_client, buffer)
                        lsp.setup_remaps(buffer)
                    end,
                },
            }
        end,
    },
}
