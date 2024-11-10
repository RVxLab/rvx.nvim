local utils = require("rvxlab.utils")
local lsp = require("rvxlab.lsp")

return {
    "gbprod/phpactor.nvim",
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
        install = {
            bin = "phpactor",
        },
        lspconfig = {
            options = {
                on_attach = lsp.on_attach,
                version = "phpactor --version",
                filetypes = { "php", "blade" },
                init_options = {
                    ["completion_worse.completor.constant.enabled"] = true,
                    ["completion_worse.experimantal"] = true,
                    ["language_server_phpstan.enabled"] = true,
                    -- ["language_server_worse_reflection.inlay_hints.enable"] = true,
                    -- ["language_server_worse_reflection.inlay_hints.types"] = true,
                },
            },
        },
    },
}
