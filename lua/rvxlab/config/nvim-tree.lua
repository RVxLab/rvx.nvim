-- NvimTree config
local tree = require("nvim-tree.api").tree
local util = require('rvxlab.util')
require("nvim-tree").setup({
    git = {
        -- Show .gitignore'd files
        ignore = false,
    },
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
        },
    },
    view = {
        float = {
            enable = true,
        },
    },
})

-- Register entry in which-key for NvimTree
require("which-key").register({
    ["<leader>e"] = { name = "[E]xplore filesystem", _ = "which_key_ignore" },
})

vim.keymap.set('n', '<leader>ef', util.bind(tree.toggle, {
    find_file = true,
    focus = true,
}))

vim.keymap.set("n", "<leader>ee", tree.open, {
    desc = "Open tree",
})

vim.keymap.set("n", "<leader>eE", tree.close, {
    desc = "Close tree",
})

vim.keymap.set("n", "<leader>et", tree.toggle, {
    desc = "Toggle tree",
})
