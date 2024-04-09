-- Import settings before we continue with the rest
-- This it so ensure have the leader key set and stuff like that
require("rvxlab.settings")

-- Initialize Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("rvxlab.plugins", {
    checker = {
        notify = false,
    },
    change_detection = {
        notify = false,
    },
})

-- Set up keybinds
require("rvxlab.keymap")

-- Set up autocmds
require("rvxlab.autocmd")
