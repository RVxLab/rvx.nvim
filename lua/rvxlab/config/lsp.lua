local util = require("rvxlab.util")

local function setup_remaps(buffer)
    local telescope = require("telescope.builtin")

    local map = function(keymap, func, opts)
        opts = opts or {}
        opts.buffer = buffer

        if opts.desc then
            opts.desc = "LSP: " .. opts.desc
        end

        vim.keymap.set("n", keymap, func, opts)
    end

    map("<leader>d", vim.diagnostic.open_float, {
        desc = "Open [D]iagnostic window",
    })

    map("<leader>ga", vim.lsp.buf.code_action, {
        desc = "Code [A]ction",
    })

    map("[d", vim.diagnostic.goto_prev, {
        desc = "Go to previous error",
    })

    map("]d", vim.diagnostic.goto_next, {
        desc = "Go to next error",
    })

    map("<leader>gr", telescope.lsp_references, {
        desc = "Find [r]eferences",
    })

    map("<leader>gi", telescope.lsp_implementations, {
        desc = "Find [i]mplementations",
    })

    map("<leader>gd", vim.lsp.buf.definition, {
        desc = "Go to [d]efinition",
    })

    map("<leader>rn", vim.lsp.buf.rename, {
        desc = "[R]e[n]ame symbol",
    })
end

local function default_on_attach(client, buffer)
    -- Enable inlay hints if the current language server supports it
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(buffer, true)
    end

    setup_remaps(buffer)
end

-- Server configs
local servers = {
    -- PHP
    intelephense = {},
    -- Disable most features on PHPActor since Intelephense handles them, otherwise it becomes very conflict-ey
    phpactor = {
        on_attach = function(client)
            client.server_capabilities.completionProvider = false
            client.server_capabilities.hoverProvider = false
            client.server_capabilities.implementationProvider = false
            client.server_capabilities.referencesProvider = false
            client.server_capabilities.renameProvider = false
            client.server_capabilities.selectionRangeProvider = false
            client.server_capabilities.signatureHelpProvider = false
            client.server_capabilities.typeDefinitionProvider = false
            client.server_capabilities.workspaceSymbolProvider = false
            client.server_capabilities.definitionProvider = false
            client.server_capabilities.documentHighlightProvider = false
            client.server_capabilities.documentSymbolProvider = false
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end,
        init_options = {
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
        },
        handlers = {
            ["textDocument/publishDiagnostics"] = function() end,
        },
    },

    -- TypeScript
    tsserver = function()
        return {
            filetypes = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
                "vue",
            },
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = util.invoke(function()
                            local registry = require("mason-registry")
                            local plugin_path = registry.get_package("vue-language-server"):get_install_path()
                            return plugin_path .. "/node_modules/@vue/language-server"
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
        }
    end,
    volar = {},

    -- Rust
    rust_analyzer = {},

    -- Lua
    lua_ls = {
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
    },

    -- Bash
    bashls = {},

    -- Yaml
    yamlls = {},

    -- JSON
    jsonls = {},

    -- Tailwind
    tailwindcss = {},
}

-- Tools
local tools = {
    "eslint_d",
    "prettierd",
    "stylua",
    "shellcheck",
}

-- Set up the actual servers

local util = require("rvxlab.util")

-- Ensure Neodev is set up before LSPConfig
require("neodev").setup({})

-- Initialize Mason and LSP Config
require("mason").setup()

local mason_lsp = require("mason-lspconfig")
mason_lsp.setup({ ensure_installed = util.keys(servers) })
mason_lsp.setup_handlers({
    function(server)
        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

        local extra_config = servers[server] or {}

        if type(extra_config) == "function" then
            extra_config = extra_config()
        end

        local server_config = vim.tbl_deep_extend("keep", extra_config, {
            capabilities = capabilities,
            on_attach = default_on_attach,
            inlay_hint = {
                enable = true,
            },
        })

        require("lspconfig")[server].setup(server_config)
    end,
})

require("mason-tool-installer").setup({ ensure_installed = tools })
