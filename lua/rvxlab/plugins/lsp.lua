local utils = require("rvxlab.utils")
local lsp = require("rvxlab.lsp")

return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

        local default_config = {
            capabilities = capabilities,
            on_attach = lsp.on_attach,
            inlay_hint = {
                enable = true,
            },
        }

        local make_config = function(opts)
            return vim.tbl_deep_extend("force", default_config, opts)
        end

        local lspconfig = require("lspconfig")

        -- Set up all language servers
        -- The following are installed but should not be initialized here:
        --
        -- - TailwindCSS: Set up by tailwind-tools
        -- - Rust Analyzer: Set up by rustaceanvim
        lspconfig.ts_ls.setup(make_config({
            on_attach = function(_client, buffer)
                lsp.setup_remaps(buffer)
            end,
            filetypes = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
                "vue",
            },
            inlay_hint = {
                enable = false,
            },
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = utils.invoke(function()
                            local Job = require("plenary.job")
                            local lsp_name = "vue-language-server"

                            local output, code = Job:new({
                                command = "which",
                                args = { lsp_name },
                                env = vim.fn.environ(),
                            }):sync()

                            if code ~= 0 or output == nil then
                                return nil
                            end

                            local path = vim.fn.resolve(output[1])
                            local dirname = path:sub(0, -#lsp_name - 1)

                            -- This works with Nix, not sure about other places
                            local install_path = vim.fn.simplify(dirname .. "/../")

                            local lsp_dir = vim.fn.finddir("@vue/language-server", install_path .. "**")

                            if lsp_dir then
                                return lsp_dir
                            end

                            return nil
                        end),
                        languages = { "vue" },
                    },
                },
                preferences = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                    importModuleSpecifierPreference = "non-relative",
                },
            },
        }))
        lspconfig.volar.setup(make_config({}))
        lspconfig.lua_ls.setup(make_config({
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            "${3rd}/luv/library",
                            unpack(vim.api.nvim_get_runtime_file("", true)),
                        },
                    },
                    hint = {
                        enable = true,
                    },
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        }))
        lspconfig.bashls.setup(make_config({}))
        lspconfig.yamlls.setup(make_config({}))
        lspconfig.jsonls.setup(make_config({}))
        lspconfig.html.setup(make_config({}))
        lspconfig.cssls.setup(make_config({}))
        lspconfig.intelephense.setup(make_config({
            filetypes = { "php", "blade" },
        }))

        -- TODO: Revisit when PHPActor supports PHP 8.3
        -- lspconfig.phpactor.setup(make_config({
        --     init_options = {
        --         ["completion_worse.completor.constant.enabled"] = true,
        --         ["language_server_phpstan.enabled"] = true,
        --         ["language_server_worse_reflection.inlay_hints.enable"] = true,
        --         ["language_server_worse_reflection.inlay_hints.types"] = true,
        --     },
        -- }))
        lspconfig.gdscript.setup(make_config({}))
        lspconfig.zls.setup(make_config({}))
    end,
}
