local utils = require("utils")
local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add("michaelrommel/nvim-silicon")

    local theme = os.getenv("HOME") .. "/.config/bat/themes/Catppuccin Macchiato.tmTheme"

    if not vim.fn.filereadable(theme) then
        theme = "OneHalfDark"
    end

    local silicon = require("nvim-silicon")
    silicon.setup({
        font = "JetbrainsMono Nerd Font=34",
        no_window_controls = true,
        to_clipboard = true,
        theme = theme,
        language = function()
            local language = vim.bo.filetype

            if language == "blade" then
                return "html"
            end

            return language
        end,
    })

    utils.v_keymap("<leader>sc", silicon.clip, "[C]opy selected code snippet as screenshot")

    require("which-key").add({
        mode = "v",
        { "<leader>s", group = "Screenshot" },
    })
end)
