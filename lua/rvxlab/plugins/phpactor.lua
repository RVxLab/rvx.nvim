local utils = require("rvxlab.utils")

return {
    "gbprod/phpactor.nvim",
    enabled = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
    },
    ft = { "php", "blade" },
    keys = {
        utils.lazy_key("<leader>pm", function()
            require("phpactor").rpc("context_menu", {})
        end, "Open Phpactor Context [M]enu"),
        utils.lazy_key("<leader>pnc", function()
            require("phpactor").rpc("new_class", {})
        end, "[N]ew PHP Class"),
    },
    opts = {
        lspconfig = {
            enabled = false,
        },
    },
}
