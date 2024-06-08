local utils = require("rvxlab.util")

return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        line_numbers = false,
        max_lines = 5,
        multiline_threshold = 3,
    },
    init = function()
        utils.n_keymap("[c", function()
            require("treesitter-context").go_to_context(vim.v.count1)
        end, "Go to parent [c]ontext")
    end,
}
