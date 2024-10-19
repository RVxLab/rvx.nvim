local utils = require("rvxlab.utils")

return {
    "leath-dub/snipe.nvim",
    keys = {
        utils.lazy_key("gb", function()
            require("snipe").open_buffer_menu()
        end, "Open Snipe [b]uffer menu"),
    },
    opts = {
        ui = {
            position = "cursor",
        },
    },
}
