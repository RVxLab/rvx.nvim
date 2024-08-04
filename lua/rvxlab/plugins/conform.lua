local utils = require("rvxlab.utils")
local format_on_save_options = {
    timeout_ms = 500,
    lsp_fallback = true,
}

local prettier_opts = {
    "prettierd",
    "prettier",
    stop_after_first = true,
}

return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    event = { "BufWritePre" },
    keys = {
        utils.lazy_key("<leader>gf", function()
            local options = vim.tbl_deep_extend("force", format_on_save_options, {
                async = true,
                callback = function(err)
                    if err ~= nil then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end,
            })

            require("conform").format(options)
        end, "[F]ormat the current buffer"),
    },
    opts = {
        formatters_by_ft = {
            php = { "pint", "php-cs-fixer" },
            javascript = prettier_opts,
            typescript = prettier_opts,
            typescriptreact = prettier_opts,
            blade = prettier_opts,
            nix = { "alejandra" },
            lua = { "stylua" },
            sh = { "shellcheck" },
        },
        format_on_save = format_on_save_options,
    },
}
