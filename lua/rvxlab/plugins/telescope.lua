return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            { "nvim-telescope/telescope-fzf-native.nvim",     build = "make" },
            { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0" },
        },
        -- Create a bound config function that loads the config
        config = require("rvxlab.util").bind(require, "rvxlab.config.telescope"),
    },
}
