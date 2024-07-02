return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = true,
    priority = 100, -- Ensure Which Key is loaded before a lot of plugins
    init = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>g"] = { name = "[G]o to" },
            ["<leader>Q"] = { name = "[Q]uit buffers" },
            ["["] = { name = "Previous" },
            ["]"] = { name = "Next" },
            ["<leader>x"] = { name = "Trouble" },
            ["<leader>t"] = {
                name = "[T]ests",
                u = {
                    name = "Test [U]I elements",
                },
            },
            ["<leader>p"] = { name = "[P]HP" },
            ["<leader>l"] = { name = "[L]aravel" },
            ["<leader>f"] = { name = "[F]ind" },
            ["<leader>d"] = { name = "[D]ebugging" },
            ["<leader>h"] = { name = "Git: [H]unk" },
            ["<leader>i"] = { name = "[I]nlay Hints" },
            ["<leader>r"] = {
                name = "[R]efactor",
                i = { name = "Refactor: [I]nline" },
            },
            ["<leader>o"] = { name = "[O]verseer" },
        })

        wk.register({
            ["<leader>s"] = { name = "Screenshot" },
            ["<leader>r"] = {
                name = "[R]efactor",
                e = { name = "Refactor: [E]xtract" },
                i = { name = "Refactor: [I]nline" },
            },
        }, {
            mode = "v",
        })
    end,
}
