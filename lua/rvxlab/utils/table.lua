local M = {}

---Grab all keys of a table and return them
---@param table table
---@return table
function M.keys(table)
    local keys = {}

    for k, _v in pairs(table) do
        keys[#table + 1] = k
    end

    return keys
end

return M
