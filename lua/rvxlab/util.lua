local M = {}
local unpack = table.unpack or unpack

---Bind a function with default arguments for later use
---See also [Currying](https://javascript.info/currying-partials)
function M.bind(fn, ...)
    local args = { ... }

    return function()
        return fn(unpack(args))
    end
end

---Bind require to load a config file
function M.bound_config(config_path)
    return M.bind(require, config_path)
end

---Immediately invoke the function with the given arguments, if any
---
---See [IIFE on MDN](https://developer.mozilla.org/en-US/docs/Glossary/IIFE) for info
function M.invoke(fn, ...)
    return fn(...)
end

---Return all keys of the table and return then
---@param table table
function M.keys(table)
    local keys = {}

    for k, _v in pairs(table) do
        keys[#table + 1] = k
    end

    return keys
end

return M
