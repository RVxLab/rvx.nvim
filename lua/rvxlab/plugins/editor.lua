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
}
