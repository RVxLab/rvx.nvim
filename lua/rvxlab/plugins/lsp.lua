-- Everything related to Language Servers
local util = require('rvxlab.util')

return {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "folke/neodev.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = util.bound_config("rvxlab.config.lsp"),
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
            "nvim-lua/plenary.nvim",
        },
        opts = function()
            local formatting_group = vim.api.nvim_create_augroup("NoneLsFormatting", {})
            local none_ls = require("null-ls")

            return {
                debug = true,
                on_attach = function(client, buffer)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({
                            group = formatting_group,
                            buffer = buffer,
                        })

                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = formatting_group,
                            buffer = buffer,
                            callback = util.bind(vim.lsp.buf.format, {
                                async = false,
                            })
                        })
                    end
                end,
                sources = {
                    -- Lua
                    none_ls.builtins.formatting.stylua,

                    -- PHP
                    none_ls.builtins.diagnostics.phpstan,
                    none_ls.builtins.formatting.pint,

                    -- TS/JS
                    none_ls.builtins.formatting.prettierd,
                    require("none-ls.diagnostics.eslint_d"),
                },
            }
        end,
        init = function()
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {
                desc = "[F]ormat the current buffer",
            })
        end,
    },
    -- Disabled due to linting conflicts
    -- {
    --     "pmizio/typescript-tools.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     opts = {},
    -- },
}
