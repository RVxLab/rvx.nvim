-- Ensure Neodev is set up before LSPConfig
require("neodev").setup({})

-- Initialize Mason and LSP Config
require("mason").setup()
local mason_lsp = require("mason-lspconfig")
mason_lsp.setup({ automatic_installation = true })

local function setup_remaps(buffer)
    local telescope = require("telescope.builtin")

    local map = function(keymap, func, opts)
        opts = opts or {}
        opts.buffer = buffer

        if opts.desc then
            opts.desc = "LSP: " .. opts.desc
        end

        vim.keymap.set('n', keymap, func, opts)
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

    -- TypeScript
    tsserver = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = nil, -- Installed in node_modules, value here doesn't matter
                languages = {
                    "javascript",
                    "typescript",
                    "vue",
                },
            },
        },
        filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "vue",
        },
    },
    volar = {},

    -- Rust
    rust_analyzer = {},

    -- Lua
    lua_la = {
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
                }
            },
        },
    },
}

-- Set up the actual servers
require('mason-lspconfig').setup_handlers({
    function(server)
        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

        local server_config = vim.tbl_deep_extend('keep', servers[server] or {}, {
            capabilities = capabilities,
            on_attach = default_on_attach,
            inlay_hint = {
                enable = true,
            },
        })

        require('lspconfig')[server].setup(server_config)
    end,
})
