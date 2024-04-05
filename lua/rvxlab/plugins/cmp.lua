local invoke = require("rvxlab.util").invoke

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        {
            "L3MON4D3/LuaSnip",
            build = invoke(function()
                -- Build jsregexp if not on Windows and make is available
                if vim.fn.has("win32") == 1 or vim.fn.executable("make") ~= 1 then
                    return nil
                end

                return "make install_jsregexp"
            end),
        },
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
    },
    -- Create a bound config function to load CMP config
    config = require("rvxlab.util").bound_config("rvxlab.config.cmp"),
}
