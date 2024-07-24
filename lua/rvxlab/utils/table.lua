local M = {}

---Grab all keys of a table and return them
---@generic TKey
---@param table table<TKey, any>
---@return table<TKey>
function M.keys(table)
    local keys = {}

    for k, _v in pairs(table) do
        keys[#table + 1] = k
    end

    return keys
end

---Map over a table
---@generic TKey, TValue
---@param table table<TKey, TValue>
---@param fn fun(value: TValue, key: TKey): TValue
function M.map(table, fn)
    local results = {}

    for k, v in ipairs(table) do
        results[k] = fn(v, k)
    end

    return results
end

return M
