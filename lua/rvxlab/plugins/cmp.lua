return {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        { "L3MON4D3/LuaSnip", version = "^2.0" },
        "onsails/lspkind.nvim",
    },
    -- Create a bound config function to load CMP config
    config = require("rvxlab.util").bound_config("rvxlab.config.cmp"),
}
