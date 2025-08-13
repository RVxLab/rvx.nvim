local utils = require("utils");

return {
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,
        keys = {
            utils.lazy_key("<leader>gg", function () Snacks.lazygit() end, "Open LazyGit"),
        },
    }
}
