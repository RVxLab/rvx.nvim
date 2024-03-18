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
        },
        config = function()
            -- Ensure Neodev is set up first
            require("neodev").setup({})

            -- Initialize Mason and LSP Config
            require("mason").setup()

            -- Set up Mason's LSP integration
            local mason_lsp = require("mason-lspconfig")
            mason_lsp.setup({
                ensure_installed = {
                    "rust_analyzer", -- Rust
                    "lua_ls",        -- Lua
                    "phpactor",      -- PHP
                    "tsserver",      -- JS/TS
                },
            })

            local cmp = require("cmp")

            -- Load the default capabilities for CMP and merge the built-in LSP capabilities in
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            -- Configuration per language server
            -- Each key is the name of the server
            local server_configs = {
                lua_ls = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    settings = {
                        Lua = {
                            hint = {
                                enable = true,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
            }

            local default_config = {
                capabilities = capabilities,
                on_attach = function(client, buffer)
                    -- Enable inlay hints if the current language server supports it
                    if client.server_capabilities.inlayHintProvider then
                        vim.lsp.inlay_hint.enable(buffer, true)
                    end

                    vim.keymap.set({ "n", "i" }, "<C-k>", function()
                        -- Close any nvim-cmp window that could be open
                        cmp.abort()
                        vim.lsp.buf.hover()
                    end, {
                        buffer = buffer,
                        desc = "Show information of whatever is being hovered over",
                    })
                end,
            }

            -- Set up the actual LSP integrations
            -- If a config is found in the server_config object, use that
            -- Otherwise, use the default
            mason_lsp.setup_handlers({
                function(server_name)
                    local config = vim.tbl_deep_extend("force", default_config, server_configs[server_name] or {})

                    require("lspconfig")[server_name].setup(config)
                end,
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
