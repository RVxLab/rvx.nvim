local util = require("rvxlab.util")

local format_on_save_options = {
    timeout_ms = 500,
    lsp_fallback = true,
}

return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                php = { "pint", "php-cs-fixer" },
                javascript = { "prettierd", "prettier" },
                typescript = { "prettierd", "prettier" },
                nix = { "alejandra" },
                lua = { "stylua" },
                sh = { "shellcheck" },
            },
            format_on_save = format_on_save_options,
        },
        init = function()
            local conform = require("conform")

            local format_options = vim.tbl_deep_extend("force", format_on_save_options, {
                bufnr = 0,
            })

            util.n_keymap("<leader>gf", util.bind(conform.format, format_options), "[F]ormat the current buffer")
        end,
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                php = { "phpstan" },
                javascript = { "eslint_d", "eslint" },
                typescript = { "eslint_d", "eslint" },
            }
        end,
    },
}
