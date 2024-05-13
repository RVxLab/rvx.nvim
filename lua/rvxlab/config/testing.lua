local neotest = require("neotest")
local util = require("rvxlab.util")

neotest.setup({
    adapters = {
        -- PHP
        require("neotest-pest"),

        -- JS/TS (TODO)
        require("neotest-jest")({}),

        -- Rust
        require("rustaceanvim.neotest"),
    },
})

-- Binds
require("which-key").register({
    ["<leader>t"] = { name = "[T]ests", _ = "which_key_ignore" },
})

util.n_keymap("<leader>tn", neotest.run.run, "Test [N]earest")
util.n_keymap("<keader>tf", function()
    neotest.run.run(vim.fn.expand("%"))
end, "Test [F]ile")
util.n_keymap("<leader>tl", neotest.run.run_last, "Test [L]ast Run Test")

util.n_keymap("<leader>To", neotest.output_panel.toggle, "Toggle [O]utput Panel")
util.n_keymap("<leader>Ts", neotest.summary.toggle, "Toggle [S]ummary Panel")
