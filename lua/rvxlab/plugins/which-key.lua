return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = true,
    priority = 100, -- Ensure Which Key is loaded before a lot of plugins
    init = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>L"] = { name = "[L]azy" },
            ["<leader>g"] = { name = "[G]eneral actions" },
            ["<leader>Q"] = { name = "[Q]uit buffers" },
            ["<leader>r"] = { name = "[R]ename" },
            ["["] = { name = "+Previous" },
            ["]"] = { name = "+Next" },
            ["<leader>x"] = { name = "Trouble" },
            ["<leader>t"] = {
                name = "[T]ests",
                u = {
                    name = "Test [U]I elements",
                },
            },
            ["<leader>p"] = { name = "[P]HP" },
            ["<leader>l"] = { name = "[L]aravel" },
            ["<leader>f"] = { name = "[F]ind files" },
            ["<leader>d"] = { name = "[D]ebugging" },
            ["<leader>h"] = { name = "Git: [H]unk" },
        })

        wk.register({
            ["<leader>s"] = { name = "Screenshot" },
        }, {
            mode = "v",
        })
    end,
}
