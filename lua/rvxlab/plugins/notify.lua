return {
    "rcarriga/nvim-notify",
    version = "^3.1",
    opts = true,
    init = function()
        vim.notify = require("notify")
    end,
}
