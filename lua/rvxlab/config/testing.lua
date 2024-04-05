local neotest = require('neotest')
local util = require('rvxlab.util')

neotest.setup({
    adapters = {
        -- PHP
        require('neotest-pest'),

        -- JS/TS (TODO)
        require('neotest-jest')({}),
    },
})

-- Binds
require("which-key").register({
    ["<leader>t"] = { name = "[T]ests", _ = "which_key_ignore" },
})

vim.keymap.set("n", "<leader>tn", neotest.run.run, {
    desc = "Test [N]earest",
})

vim.keymap.set("n", "<leader>tf", util.bind(neotest.run.run, vim.fn.expand("%")), {
    desc = "Test [F]ile",
})

vim.keymap.set("n", "<leader>to", neotest.output.open, {
    desc = "[O]pen output panel"
})
