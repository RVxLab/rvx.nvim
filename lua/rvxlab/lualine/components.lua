local utils = require("rvxlab.utils")

local M = {}

M.filepath = function()
    local path = vim.fn.expand("%:p")
    local path_parts = utils.string_split(path, "/")
    local start = math.max(#path_parts - 2, 0)
    local parts = { utils.unpack(path_parts, start, #path_parts) }

    ---comment
    ---@param value string
    ---@param index integer
    ---@return string
    local mapping_fn = function(value, index)
        if index == #parts then
            return value
        else
            return value:sub(1, 3)
        end
    end

    local mapped_parts = utils.map(parts, mapping_fn)

    return utils.string_join(mapped_parts, "/")
end

return M
