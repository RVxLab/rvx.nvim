local make_footer_renderer = function()
    local startup_time = nil

    vim.defer_fn(function()
        startup_time = require("lazy").stats().startuptime
        vim.print(startup_time)
        MiniStarter.refresh()
    end, 0)

    return function()
        return startup_time and string.format("Startup took %d milliseconds", startup_time) or "Startup took"
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
