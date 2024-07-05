return {
    "ricardoramirezr/blade-nav.nvim",
    ft = { "blade", "php" },
    cond = function()
        local artisan_path = vim.fn.findfile("artisan", ";.")
        return artisan_path ~= "" and vim.fn.filereadable(artisan_path)
    end,
}
