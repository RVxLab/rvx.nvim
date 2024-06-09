local utils = require("rvxlab.utils")

return {
    "lewis6991/gitsigns.nvim",
    version = "~0.7",
    opts = {
        current_line_blame = true,
        yadm = {
            enable = false, -- I don't use yadm
        },
        on_attach = function(buffer)
            local gs = require("gitsigns")

            utils.n_keymap("[h", utils.bind(vim.schedule, gs.prev_hunk), "Previous [H]unk", {
                buffer = buffer,
            })

            utils.n_keymap("]h", utils.bind(vim.schedule, gs.next_hunk), "Next [H]unk", {
                buffer = buffer,
            })
        end,
    },
}
