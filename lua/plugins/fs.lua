local utils = require("utils")

---Create a picker command for mini.pick
---@param args string
local pick = function(args)
    return string.format("<Cmd>Pick %s<CR>", args)
end

---Create an LSP picker command for mini.pick
---@param scope string
local lsp_pick = function(scope)
    return pick(string.format("lsp scope='%s'", scope))
end

return {
    {
        "stevearc/oil.nvim",
        version = "^2.0",
        keys = {
            utils.lazy_key("-", "<Cmd>Oil<CR>", "Open File Explorer"),
        },
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
            },
        },
        dependencies = {
            { "nvim-mini/mini.icons", opts = {} },
        },
        lazy = false,
    },
    {
        "nvim-mini/mini.pick",
        version = false,
        keys = {
            utils.lazy_key(utils.leader("ff"), pick("files"), "Find files"),
            utils.lazy_key(utils.leader("fs"), pick("grep_live"), "Search files"),
            utils.lazy_key(utils.leader("fS"), lsp_pick("workspace_symbol"), "Find symbols in workspace"),
            utils.lazy_key(utils.leader("fgd"), lsp_pick("definition"), "Go to definition"),
            utils.lazy_key(utils.leader("fr"), lsp_pick("references"), "Find references"),
        },
        opts = {},
        dependencies = {
            { "nvim-mini/mini.icons", opts = {} },
            "nvim-mini/mini.extra",
        },
    },
}
