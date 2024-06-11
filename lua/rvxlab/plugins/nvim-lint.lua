local utils = require("rvxlab.utils")

return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            php = { "phpstan" },
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            lua = { "luacheck" },
        }
    end,
    init = function()
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            desc = "Lint the current buffer",
            callback = utils.pbind(require("lint").try_lint),
        })
    end,
}
