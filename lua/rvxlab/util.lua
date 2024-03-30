local M = {}

function M.bind(fn, ...)
    local args = { ... }

    return function()
        local unpack = table.unpack or unpack

        return fn(unpack(args))
    end
end

function M.bound_config(config_path)
    return M.bind(require, config_path)
end

return M
