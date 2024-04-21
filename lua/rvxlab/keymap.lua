local map = require("rvxlab.util").n_keymap

-- Lazy
map("<leader>LL", ":Lazy<CR>", "Open [L]azy.nvim")

-- Buffer related
map("<leader>q", ":bdelete<CR>", "Close current buffer")
map("<leader>QA", function()
    for _, i in ipairs(vim.api.nvim_list_bufs()) do
        vim.api.nvim_buf_delete(i, {})
    end
end, "Close all buffers")

map("<leader>Qc", function()
    local current_buffer = vim.api.nvim_get_current_buf()

    for _, i in ipairs(vim.api.nvim_list_bufs()) do
        if i ~= current_buffer then
            vim.api.nvim_buf_delete(i, {})
        end
    end
end, "Close all buffers except current")
