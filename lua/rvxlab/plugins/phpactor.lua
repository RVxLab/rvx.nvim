local utils = require("rvxlab.util")
local lsp = require("rvxlab.lsp")

return {
    "gbprod/phpactor.nvim",
    build = function()
        require("phpactor.handler.update")()
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
                init_options = {
                    ["language_server_worse_reflection.inlay_hints.enable"] = true,
                },
            },
        },
    },
}
