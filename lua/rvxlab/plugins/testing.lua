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
            "rouge8/neotest-rust",
        },
        config = require("rvxlab.util").bound_config("rvxlab.config.testing"),
    },
}
