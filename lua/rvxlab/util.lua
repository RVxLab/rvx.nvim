local M = {}

function M.bind(fn, ...)
    local args = { ... }

    return function()
        local unpack = table.unpack or unpack

        return fn(unpack(args))
    end
end

return M
