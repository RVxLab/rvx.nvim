return {
    "j-hui/fidget.nvim",
    version = "^1.0.0",
    opts = {
        notification = {
            window = {
                winblend = 0, -- For Catppuccin integration
            },
        },
    },
    event = "VeryLazy",
    init = function()
        vim.notify = require("fidget.notification").notify
    end,
}
