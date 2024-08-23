return {
    "ggandor/leap.nvim",
    dependencies = {
        "tpope/vim-repeat",
    },
    lazy = false, -- Leap should not be lazily loaded
    config = true,
    init = function()
        require("leap").create_default_mappings()
    end,
}
