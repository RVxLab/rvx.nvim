local footer_format = [[
Startup time:    %dms
Memory used:     %dMB
Plugins:         %d
]]

local make_footer_renderer = function()
    local startup_time_ms = 0
    local plugin_count = 0

    vim.defer_fn(function()
        local lazy = require("lazy")
        startup_time_ms = lazy.stats().startuptime
        plugin_count = #lazy.plugins()
        MiniStarter.refresh()
    end, 0)

    return function()
        local memory_usage_mb = vim.uv.getrusage().maxrss / 1024

        return string.format(footer_format, startup_time_ms, memory_usage_mb, plugin_count)
    end
end

return {
    "echasnovski/mini.starter",
    version = false,
    opts = function()
        local starter = require("mini.starter")

        return {
            header = require("art.header"),
            items = {
                { name = "Search for files", action = "Telescope find_files", section = "Filesystem" },
                { name = "Browse files", action = "Oil", section = "Filesystem" },
                { name = "Manage plugins", action = "Lazy", section = "Editor" },
                { name = "Manage language servers", action = "Mason", section = "Editor" },
                starter.sections.recent_files(3, true, true),
            },
            silent = true,
            footer = make_footer_renderer(),
        }
    end,
}
