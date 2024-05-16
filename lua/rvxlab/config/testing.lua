local neotest = require("neotest")
local util = require("rvxlab.util")
local which_key = require("which-key")

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
which_key.register({
    ["<leader>t"] = { name = "[T]ests", _ = "which_key_ignore" },
})

which_key.register({
    ["<leader>tu"] = { name = "Test [U]I", _ = "which_key_ignore" },
})

util.n_keymap("<leader>tn", neotest.run.run, "Test [N]earest")
util.n_keymap("<leader>tf", function()
    neotest.run.run(vim.fn.expand("%"))
end, "Test [F]ile")
util.n_keymap("<leader>tl", neotest.run.run_last, "Test [L]ast Run Test")
util.n_keymap("<leader>td", util.bind(neotest.run.run, { strategy = "dap" }), "[D]ebug nearest test")

util.n_keymap("<leader>tuo", neotest.output_panel.toggle, "Toggle [O]utput Panel")
util.n_keymap("<leader>tus", neotest.summary.toggle, "Toggle [S]ummary Panel")
