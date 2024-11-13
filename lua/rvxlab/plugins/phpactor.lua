local utils = require("rvxlab.utils")
local lsp = require("rvxlab.lsp")

return {
    "gbprod/phpactor.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
    },
    ft = { "php", "blade" },
    keys = {
        utils.lazy_key("<leader>pm", function()
            require("phpactor").rpc("context_menu", {})
        end, "Open Phpactor Context [M]enu"),
        utils.lazy_key("<leader>pn", function()
            require("phpactor").rpc("new_class", {})
        end, "Open Phpactor Context [M]enu"),
    },
    opts = {
        lspconfig = {
            enabled = false,
        },
    },
}
