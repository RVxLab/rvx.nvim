local utils = require("rvxlab.utils")

return {
    "lewis6991/gitsigns.nvim",
    version = "~0.9",
    opts = {
        current_line_blame = true,
        on_attach = function(buffer)
            local gs = require("gitsigns")

            utils.n_keymap("[h", gs.prev_hunk, "Previous [H]unk", {
                buffer = buffer,
            })

            utils.n_keymap("]h", gs.next_hunk, "Next [H]unk", {
                buffer = buffer,
            })

            utils.n_keymap("<leader>hp", gs.preview_hunk, "[P]review hunk", {
                buffer = buffer,
            })

            utils.n_keymap("<leader>hP", gs.preview_hunk_inline, "[P]review hunk inline", {
                buffer = buffer,
            })

            utils.n_keymap("<leader>hR", gs.reset_hunk, "[R]eset hunk", {
                buffer = buffer,
            })

            utils.n_keymap("<leader>hs", gs.stage_hunk, "[S]tage hunk", {
                buffer = buffer,
            })
        end,
    },
}
