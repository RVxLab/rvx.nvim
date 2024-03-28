return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Don't load cmp until we actually start coding
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        { "L3MON4D3/LuaSnip", version = "^2.0" },
        "onsails/lspkind.nvim",
    },
    -- Create a bound config function to load CMP config
    config = require('rvxlab.util').bind(require, 'rvxlab.config.cmp')
}
