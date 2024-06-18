local utils = require("rvxlab.utils")

-- Different buffer types can have different means of closing them
-- For example, Neotest buffers should be closed with the close
-- function associated with a specific buffer type
local close_strategies = {
    ["neotest-summary"] = function()
        vim.notify("Closing neotest summary")
        require("neotest").summary.close()
    end,
    ["neotest-output-panel"] = function()
        vim.notify("Closing neotest output panel")
        require("neotest").output_panel.close()
    end,
    ["oil"] = function(force)
        local oil = require("oil")

        if force then
            oil.discard_all_changes()
        end

        oil.close()
    end,
}

---@param buffer integer
---@return string
local function get_filetype_for_buffer(buffer)
    return vim.api.nvim_get_option_value("ft", {
        buf = buffer,
    })
end

---@param filetype string
---@param otherwise function
---@param opts {force: boolean|nil}|nil
local function close_buffer_by_filetype_or(filetype, otherwise, opts)
    ---@type {force: boolean}
    local options = vim.tbl_extend("keep", opts or {}, {
        force = false,
    })

    local close = close_strategies[filetype]

    if close then
        return close(options.force)
    end

    return otherwise(options.force)
end

return {
    "famiu/bufdelete.nvim",
    keys = {
        utils.lazy_key("<leader>q", function()
            local filetype = get_filetype_for_buffer(0)

            close_buffer_by_filetype_or(filetype, function()
                require("bufdelete").bufdelete(0)
            end)
        end, "Close current buffer"),

        utils.lazy_key("<leader>Qf", function()
            local filetype = get_filetype_for_buffer(0)

            close_buffer_by_filetype_or(filetype, function()
                require("bufdelete").bufdelete(0)
            end)
        end, "Force close current buffer"),

        utils.lazy_key("<leader>QA", function()
            for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
                local filetype = get_filetype_for_buffer(buffer)

                close_buffer_by_filetype_or(filetype, function()
                    require("bufdelete").bufdelete(buffer)
                end)
            end
        end, "Close all buffers"),

        utils.lazy_key("<leader>Qc", function()
            local current_buffer = vim.api.nvim_get_current_buf()

            for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
                if buffer ~= current_buffer then
                    local filetype = get_filetype_for_buffer(buffer)

                    close_buffer_by_filetype_or(filetype, function()
                        require("bufdelete").bufdelete(buffer)
                    end)
                end
            end
        end, "Close all buffers except current"),
    },
}
