local utils = require("rvxlab.utils")

return {
    "luckasRanarison/tailwind-tools.nvim",
    version = "^0.3",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    -- Only load this plugin if a `tailwind.config.js` can be found in the current project
    cond = function()
        return vim.fn.findfile("tailwind.config.js", vim.loop.cwd() .. "/.;") ~= ""
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "neovim/nvim-lspconfig",
    },
    opts = {},
    init = function()
        utils.n_keymap("<leader>ftc", ":Telescope tailwind classes<CR>", "Find: Tailwind [C]lasses")
        utils.n_keymap("<leader>ftu", ":Telescope tailwind utilities<CR>", "Find: Tailwind [U]tilities")
    end,
}
