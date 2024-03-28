-- Ensure Neodev is set up first
require("neodev").setup({})

-- Initialize Mason and LSP Config
require("mason").setup()

-- Set up Mason's LSP integration
local mason_lsp = require("mason-lspconfig")
mason_lsp.setup({ automatic_installation = true })

local cmp = require("cmp")

-- Load the default capabilities for CMP and merge the built-in LSP capabilities in
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- The on_attach function will be used to attach to whichever buffer we're working on
local function on_attach(client, buffer)
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
end

-- Set up actual LSP clients
local lsp = require("lspconfig")

-- PHP
lsp.intelephense.setup({
    on_attach,
    capabilities,
})

-- JavaScript/TypeScript
lsp.tsserver.setup({
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
    on_attach,
    capabilities,
})

-- Vue
lsp.volar.setup({
    on_attach,
    capabilities,
})

-- Rust
lsp.rust_analyzer.setup({
    on_attach,
    capabilities,
})

-- Lua
lsp.lua_ls.setup({
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        })
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            hint = {
                enable = true,
            },
        },
    },
})

-- Enable LSP Lines to get some nicer diagnostics
require("lsp_lines").setup()

-- Disable vim diagnostics since lsp_lines takes care of this now
vim.diagnostic.config({
    virtual_text = false,
})
