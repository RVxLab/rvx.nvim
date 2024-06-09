local utils = require("rvxlab.utils")

return {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
        utils.lazy_key("gJ", function()
            require("treesj").join()
        end, "[J]oin a multiline structure to a single line"),
        utils.lazy_key("gS", function()
            require("treesj").split()
        end, "[S]plit a single-lined structure to multiple lines"),
    },
    opts = {
        use_default_keymaps = false,
    },
}
