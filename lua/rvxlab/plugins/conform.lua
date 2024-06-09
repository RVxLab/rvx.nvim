local utils = require("rvxlab.util")
local format_on_save_options = {
    timeout_ms = 500,
    lsp_fallback = true,
}

return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            php = { "pint", "php-cs-fixer" },
            javascript = { "prettierd", "prettier" },
            typescript = { "prettierd", "prettier" },
            blade = { "prettierd", "prettier" },
            nix = { "alejandra" },
            lua = { "stylua" },
            sh = { "shellcheck" },
        },
        format_on_save = format_on_save_options,
    },
    keys = {
        utils.lazy_key("<leader>gf", function()
            local options = vim.tbl_deep_extend("force", format_on_save_options, {
                bufnr = 0,
            })

            require("conform").format(options)
        end, "[F]ormat the current buffer"),
    },
}
