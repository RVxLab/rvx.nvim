return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",

            -- Adapters

            "V13Axel/neotest-pest",
            "nvim-neotest/neotest-jest",
        },
        opts = function()
            return {
                adapters = {
                    require("neotest-pest"),
                    require("neotest-jest"),
                },
            }
        end,
        init = function()
            local neotest = require("neotest")
            local util = require("rvxlab.util")
            require("which-key").register({
                ["<leader>t"] = { name = "[T]ests", _ = "which_key_ignore" },
            })

            vim.keymap.set("n", "<leader>tn", neotest.run.run, {
                desc = "Test [N]earest",
            })

            vim.keymap.set("n", "<leader>tf", util.bind(neotest.run.run, vim.fn.expand("%")), {
                desc = "Test [F]ile",
            })
        end,
    },
}
