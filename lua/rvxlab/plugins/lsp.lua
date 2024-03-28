-- Everything related to Language Servers

-- AutoCMD groups
local formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})

return {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "folke/neodev.nvim",
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        },
        config = require("rvxlab.util").bind(require, "rvxlab.config.lsp"),
        init = function()
            local telescope = require("telescope.builtin")

            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
                desc = "Open [D]iagnostic window",
            })

            vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, {
                desc = "Code [A]ction",
            })

            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
                desc = "Go to previous error",
            })

            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
                desc = "Go to next error",
            })

            vim.keymap.set("n", "<leader>gr", telescope.lsp_references, {
                desc = "Find [r]eferences",
            })

            vim.keymap.set("n", "<leader>gi", telescope.lsp_implementations, {
                desc = "Find [i]mplementations",
            })

            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {
                desc = "Go to [d]efinition",
            })

            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
                desc = "[R]e[n]ame symbol",
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
            "nvim-lua/plenary.nvim",
        },
        opts = function()
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
                            callback = function()
                                vim.lsp.buf.format({
                                    async = false,
                                })
                            end,
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
}
