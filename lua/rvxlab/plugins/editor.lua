-- Everything related to the editor part
return {
    { "tpope/vim-surround" },
    { "tpope/vim-commentary" },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = true,
    },
    {
        "karb94/neoscroll.nvim",
        opts = true,
    },
    {
        "Wansmer/treesj",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        keys = function()
            return {
                { "gJ", require("treesj").join },
                { "gS", require("treesj").split },
            }
        end,
        opts = {
            use_default_keymaps = false,
        },
    },
}
