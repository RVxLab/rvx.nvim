local utils = require("rvxlab.utils")

return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        utils.lazy_key("<leader>ref", function()
            require("refactoring").refactor("Extract Function")
        end, "Refactor: Extract [F]unction", { mode = "x" }),

        utils.lazy_key("<leader>rif", function()
            require("refactoring").refactor("Inline Function")
        end, "Refactor: Inline [F]unction"),

        utils.lazy_key("<leader>rev", function()
            require("refactoring").refactor("Extract Variable")
        end, "Refactor: Extract [V]ariable", { mode = "x" }),

        utils.lazy_key("<leader>riv", function()
            require("refactoring").refactor("Inline Variable")
        end, "Refactor: Inline [V]ariable", { mode = { "n", "x" } }),

        utils.lazy_key("<leader>rr", function()
            require("telescope").extensions.refactoring.refactors()
        end, "Refactor: Select", { mode = { "n", "x" } }),
    },
    init = function()
        require("telescope").load_extension("refactoring")
    end,
}
