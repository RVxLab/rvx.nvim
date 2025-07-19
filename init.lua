-- Bootstrap Lazy.nvim
require("bootstrap")

-- General settings
require("settings")

-- Load plugins
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "catppuccin" } },
    checker = { enabled = true },
})

-- Register autocommands
require("autocmd")
