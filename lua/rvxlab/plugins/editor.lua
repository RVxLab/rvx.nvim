-- Everything related to the editor part
return {
    {
        "echasnovski/mini.surround",
        version = false,
        opts = true,
        init = function()
            require("which-key").register({
                ["<leader>s"] = { name = "[S]urround", _ = "which_key_ignore" },
            })
        end,
    },
    {
        "echasnovski/mini.comment",
        version = false,
        opts = true,
    },
    {
        "echasnovski/mini.pairs",
        version = false,
        opts = true,
    },
    {
        "karb94/neoscroll.nvim",
        opts = true,
    },
}
