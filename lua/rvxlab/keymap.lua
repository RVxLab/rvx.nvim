-- Open Lazy
vim.keymap.set("n", "<leader>LL", ":Lazy<CR>", {
    desc = "Open [L]azy.nvim",
})

-- Delete current buffer

vim.keymap.set("n", "<leader>q", ":bdelete<CR>", {
    desc = "Close current buffer",
})
