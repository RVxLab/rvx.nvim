local add, later = MiniDeps.add, MiniDeps.later
local utils = require("utils")

later(function()
    add("stevearc/overseer.nvim")

    local overseer = require("overseer")

    overseer.setup()

    utils.n_keymap("<leader>or", overseer.run_template, "[R]un a task")
    utils.n_keymap("<leader>ot", overseer.toggle, "[T]oggle Overseer's UI")

    require("which-key").add({
        mode = "n",
        { "<leader>o", group = "Overseer" },
    })
end)
