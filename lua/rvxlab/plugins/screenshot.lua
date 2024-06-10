local utils = require("rvxlab.utils")

return {
    "michaelrommel/nvim-silicon",
    cmd = "Silicon",
    keys = {
        utils.lazy_key(
            "<leader>sc",
            function()
                require("nvim-silicon").clip()
            end,
            "[C]opy selected code snippet to clipboard as image",
            {
                mode = "v",
            }
        ),
    },
    opts = function()
        return {
            font = "JetbrainsMono Nerd Font=34",
            no_window_controls = true,
            to_clipboard = true,
            theme = "OneHalfDark",
        }
    end,
}
