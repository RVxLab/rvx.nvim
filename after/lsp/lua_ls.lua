return {
    settings = {
        Lua = {
            runtime = {
                -- LuaJIT because of Neovim
                version = "LuaJIT",
            },
            diagnostics = {
                global = { "vim" },
            },
            telemetry = {
                enabled = false,
            },
        },
    },
}
