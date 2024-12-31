vim.api.nvim_create_user_command("RvxDumpPlugins", function(opts)
    -- Mini plugins are hard-coded here because MiniDeps.get_session doesn't pick them up
    local plugins = {
        { name = "mini.icons", url = "https://github.com/echasnovski/mini.icons" },
        { name = "mini.statusline", url = "https://github.com/echasnovski/mini.statusline" },
        { name = "mini.starter", url = "https://github.com/echasnovski/mini.starter" },
        { name = "mini.splitjoin", url = "https://github.com/echasnovski/mini.splitjoin" },
        { name = "mini.pick", url = "https://github.com/echasnovski/mini.pick" },
        { name = "mini.indentscope", url = "https://github.com/echasnovski/mini.indentscope" },
        { name = "mini.surround", url = "https://github.com/echasnovski/mini.surround" },
        { name = "mini.pairs", url = "https://github.com/echasnovski/mini.pairs" },
        { name = "mini.extra", url = "https://github.com/echasnovski/mini.extra" },
    }

    local format = opts.fargs[1] or "json"

    for _, plugin in ipairs(MiniDeps.get_session()) do
        if plugin.name ~= nil and plugin.source ~= nil then
            local found = false

            for _, current_plugin in ipairs(plugins) do
                if current_plugin.name == plugin.name then
                    found = true
                end
            end

            if not found then
                table.insert(plugins, {
                    name = plugin.name,
                    url = plugin.source,
                })
            end
        end
    end

    table.sort(plugins, function(a, b)
        return a.name:lower() < b.name:lower()
    end)

    local output = ""

    if format == "md" then
        for _, plugin in ipairs(plugins) do
            output = output .. string.format("- [%s](%s)\n", plugin.name, plugin.url)
        end
    else
        output = vim.fn.json_encode(plugins)
    end

    if vim.fn.setreg("", output) then
        vim.notify(string.format("Plugins have been copied to clipboard in %s format", format))
    end
end, {
    nargs = 1,
    complete = function()
        return {
            "json",
            "md",
        }
    end,
})
