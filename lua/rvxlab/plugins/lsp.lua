-- Everything related to Language Servers
return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "folke/neodev.nvim",
    },
    config = function ()
        vim.lsp.set_log_level('debug')

        -- Ensure Neodev is set up first
        require('neodev').setup()

        -- Initialize Mason and LSP Config
        require('mason').setup()

        local mason_lsp = require('mason-lspconfig')
        mason_lsp.setup({
            ensure_installed = {
                "rust_analyzer", -- Rust
                "lua_ls", -- Lua
                "phpactor", -- PHP
                "tsserver", -- JS/TS
            },
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

        mason_lsp.setup_handlers({
            function (server_name)
                require('lspconfig')[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ['lua_ls'] = function ()
                require('lspconfig').lua_ls.setup({})
            end,
        })

    end,
}

