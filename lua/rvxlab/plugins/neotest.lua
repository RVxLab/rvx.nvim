local utils = require("rvxlab.util")

return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",

            -- Adapters
            "V13Axel/neotest-pest", -- PestPHP
            "nvim-neotest/neotest-jest", -- Jest
            "mrcjkb/rustaceanvim",
        },
        keys = {
            utils.lazy_key("<leader>tn", function()
                require("neotest").run.run()
            end, "Run [n]earest test"),
            utils.lazy_key("<leader>tf", function()
                require("neotest").run.run(vim.fn.expand("%"))
            end, "Run tests in current [f]ile"),
            utils.lazy_key("<leader>tl", function()
                require("neotest").run.run_last()
            end, "Run [l]ast run test"),
            utils.lazy_key("<leader>td", function()
                require("neotest").run.run({
                    strategy = "dap",
                })
            end, "[D]ebug nearest test"),
            utils.lazy_key("<leader>tuo", function()
                require("neotest").output_panel.toggle()
            end, "Toggle [o]utput panel"),
            utils.lazy_key("<leader>tus", function()
                require("neotest").summary.toggle()
            end, "Toggle [s]ummary panel"),
        },
        opts = function()
            return {
                adapters = {
                    require("neotest-pest"),
                    require("neotest-jest")({}),
                    require("rustaceanvim.neotest"),
                },
            }
        end,
    },
}
