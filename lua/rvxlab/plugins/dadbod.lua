local utils = require("rvxlab.utils")

return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        "tpope/vim-dadbod",
        { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
    },
    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
    },
    init = function()
        vim.g.db_ui_use_nerd_fonts = 1

        local dadbob_json = vim.fn.findfile(".dadbod.json")

        if dadbob_json ~= "" then
            local file_path = vim.loop.cwd() .. "/" .. dadbob_json

            local file, err = io.open(file_path, "r")

            if file then
                local contents = file:read("*a")
                file:close()
                local data = vim.json.decode(contents)

                local databases = utils.map(data, function(value, key)
                    return {
                        name = key,
                        url = value,
                    }
                end)

                vim.g.dbs = utils.values(databases)
            else
                vim.notify_once(tostring(err), vim.log.levels.ERROR)
            end
        end
    end,
}
