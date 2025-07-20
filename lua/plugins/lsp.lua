return {
    "mason-org/mason-lspconfig.nvim",
    version = "^2.0",
    dependencies = {
        { "mason-org/mason.nvim", version = "^2.0", opts = {} },
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
    },
    opts = {
        ensure_installed = {
            -- Bash/Shell
            "bashls",

            -- HTML
            "html",

            -- JavaScript/TypeScript
            "vtsls",
            "vue_ls",

            -- Lua
            "lua_ls",

            -- PHP
            "intelephense",

            -- Rust
            "rust_analyzer",

            -- Zig
            "zls",
        },
    },
}
