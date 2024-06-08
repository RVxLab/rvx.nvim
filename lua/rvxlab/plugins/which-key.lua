return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = true,
    priority = 100, -- Ensure Which Key is loaded before a lot of plugins
    init = function()
        require("which-key").register({
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
        })
    end,
}
