local utils = require("rvxlab.util")
local lsp = require("rvxlab.lsp")

return {
    "gbprod/phpactor.nvim",
    build = function()
        require("phpactor.handler.update")()
    end,
    cond = function()
        return vim.fn.executable("php") == 1 and vim.fn.executable("composer") == 1
    end,
    ft = "php",
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
            options = {
                on_attach = lsp.on_attach,
            },
        },
    },
}
