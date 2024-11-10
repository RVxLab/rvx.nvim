local utils = require("rvxlab.utils")

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        utils.lazy_key("<leader>q", function()
            Snacks.bufdelete()
        end, "Close the current buffer"),
        utils.lazy_key("<leader>Qf", function()
            Snacks.bufdelete({
                force = true,
            })
        end, "Force close the current buffer"),
        utils.lazy_key("<leader>QA", function()
            Snacks.bufdelete.all()
        end, "Close all buffers"),
        utils.lazy_key("<leader>Qo", function()
            Snacks.bufdelete.other()
        end, "Close all buffers except current"),
    },
    opts = {
        bufdelete = {
            enabled = true,
        },
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
}
