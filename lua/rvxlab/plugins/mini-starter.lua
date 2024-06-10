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

        return string.format(
            "Startup time:\t%dms\nMemory used:\t%dMB\nPlugins:\t\t%d",
            startup_time_ms,
            memory_usage_mb,
            plugin_count
        )
    end
end

return {
    "echasnovski/mini.starter",
    version = false,
    opts = function()
        local starter = require("mini.starter")

        return {
            header = require("art.header"),
            -- TODO: Clean these up and add more stuff
            items = {
                starter.sections.builtin_actions(),
                starter.sections.telescope(),
                starter.sections.recent_files(10, true, true),
                { name = "Lazy", action = "Lazy", section = "General" },
                { name = "Mason", action = "Mason", section = "General" },
                { name = "Explore Filesystem", action = "Oil", section = "General" },
            },
            silent = true,
            footer = make_footer_renderer(),
        }
    end,
}
