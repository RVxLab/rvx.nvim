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

---Bind a function with default arguments for later use, calling with pcall
---See also [Currying](https://javascript.info/currying-partials)
function M.pbind(fn, ...)
    local args = { ... }

    return function()
        return pcall(fn, unpack(args))
    end
end

---Bind require to load a config file
---@param config_path_or_name string
function M.bound_config(config_path_or_name)
    if config_path_or_name:find(".", 1, true) == nil then
        config_path_or_name = string.format("rvxlab.config.%s", config_path_or_name)
    end

    return M.bind(require, config_path_or_name)
end

---Immediately invoke the function with the given arguments, if any
---
---See [IIFE on MDN](https://developer.mozilla.org/en-US/docs/Glossary/IIFE) for info
function M.invoke(fn, ...)
    return fn(...)
end

---Return all keys of the table and return then
---@param table table
---@return table
function M.keys(table)
    local keys = {}

    for k, _v in pairs(table) do
        keys[#table + 1] = k
    end

    return keys
end

---Shortcut for a normal mode keymapping
---@param mapping string
---@param action function
---@param description string|nil
---@param opts table|nil
function M.n_keymap(mapping, action, description, opts)
    opts = vim.tbl_extend("keep", opts or {}, {
        desc = description,
        silent = true,
    })

    vim.keymap.set("n", mapping, action, opts)
end

---Check if a string starts with a given substring
---@param haystack string
---@param needle string
function M.string_starts_with(haystack, needle)
    return haystack:sub(1, #needle) == needle
end

return M
