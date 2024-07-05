local default_size = 2

return function(size)
    return {
        provider = (" "):rep(size or default_size),
    }
end
