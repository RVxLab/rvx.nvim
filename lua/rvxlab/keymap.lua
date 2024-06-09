local map = require("rvxlab.utils").n_keymap

local function can_delete_buffer(buffer)
    buffer = buffer or 0

    local buftype = vim.api.nvim_get_option_value("buftype", {
        buf = buffer,
    })

    return buftype ~= "nofile"
end

-- Lazy
map("<leader>LL", ":Lazy<CR>", "Open [L]azy.nvim")

-- Buffer related
map("<leader>q", function()
    if can_delete_buffer() then
        vim.api.nvim_buf_delete(0, {})
    end
end, "Close current buffer")
map("<leader>QA", function()
    for _, i in ipairs(vim.api.nvim_list_bufs()) do
        if can_delete_buffer(i) then
            vim.api.nvim_buf_delete(i, {})
        end
    end
end, "Close all buffers")

map("<leader>Qc", function()
    local current_buffer = vim.api.nvim_get_current_buf()

    for _, i in ipairs(vim.api.nvim_list_bufs()) do
        if i ~= current_buffer and can_delete_buffer(i) then
            vim.api.nvim_buf_delete(i, {})
        end
    end
end, "Close all buffers except current")
