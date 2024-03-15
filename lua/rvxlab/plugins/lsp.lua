-- Everything related to Language Servers
return {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "folke/neodev.nvim",
        },
        config = function()
            -- Ensure Neodev is set up first
            require("neodev").setup({})

            -- Initialize Mason and LSP Config
            require("mason").setup()

            local mason_lsp = require("mason-lspconfig")
            mason_lsp.setup({
                ensure_installed = {
                    "rust_analyzer", -- Rust
                    "lua_ls", -- Lua
                    "phpactor", -- PHP
                    "tsserver", -- JS/TS
                },
            })

            local capabilities =
                require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            mason_lsp.setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        settings = {
                            Lua = {
                                completion = {
                                    callSnippet = "Replace",
                                },
                            },
                        },
                    })
                end,
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = function()
            local none_ls = require("null-ls")

            return {
                sources = {
                    none_ls.builtins.formatting.stylua,
                },
            }
        end,
        init = function()
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {
                desc = "[F]ormat the current buffer",
            })
        end,
    },
}
