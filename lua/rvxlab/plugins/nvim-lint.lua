local util = require("rvxlab.util")

return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            php = { "phpstan" },
            javascript = { "eslint_d", "eslint" },
            typescript = { "eslint_d", "eslint" },
            lua = { "luacheck" },
        }
    end,
    init = function()
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            desc = "Lint the current buffer",
            callback = util.pbind(require("lint").try_lint),
        })
    end,
}
