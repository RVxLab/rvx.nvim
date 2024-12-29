local M = {}

---Grab all keys of a table and return them
---@generic TKey
---@param tbl table<TKey, any>
---@return table<TKey>
function M.keys(tbl)
    local keys = {}

    for k, _v in pairs(tbl) do
        table.insert(keys, k)
    end

    return keys
end

---Map over a table
---@generic TKey, TValue
---@param tbl table<TKey, TValue>
---@param fn fun(value: TValue, key: TKey): TValue
---@return table<TKey, TValue>
function M.map(tbl, fn)
    local results = {}

    for k, v in pairs(tbl) do
        results[k] = fn(v, k)
    end

    return results
end

---Map over a table and
---@generic TKey, TNewKey, TValue
---@param tbl table<TKey, TValue>
---@param fn fun(value: TValue, key: TKey): TNewKey, TValue
---@return table<TNewKey, TValue>
function M.map_with_keys(tbl, fn)
    local results = {}

    for k, v in pairs(tbl) do
        local new_key, new_value = fn(v, k)
        results[new_key] = new_value
    end

    return results
end

---Grab all values of a table and return them
---@generic TValue
---@param tbl table<any, TValue>
---@return table<TValue>
function M.values(tbl)
    local values = {}

    for _k, v in pairs(tbl) do
        table.insert(values, v)
    end

    return values
end

---Create a range of numbers, inclusive
function M.range(from, to)
    local range = {}

    for i = from, to do
        table.insert(range, i)
    end

    return range
end

return M
