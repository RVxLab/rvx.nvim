local utils = require("rvxlab.utils")

return {
    "mfussenegger/nvim-dap",
    init = function()
        local dap = require("dap")
        local widgets = require("dap.ui.widgets")

        require("which-key").register("<leader>D", {
            name = "[D]ebugging",
            _ = "which_key_ignore",
        })

        require("which-key").register("<leader>Du", {
            name = "Debugging [U]I",
            _ = "which_key_ignore",
        })

        utils.n_keymap("<leader>Db", dap.toggle_breakpoint, "Toggle [b]reakpoint")
        utils.n_keymap("<leader>Dus", function()
            widgets.sidebar(widgets.scopes).open()
        end, "Open debugging [s]idebar")
        utils.n_keymap("<F5>", dap.continue, "[C]ontinue")
        utils.n_keymap("<F7>", dap.step_into, "Step into")
        utils.n_keymap("<F8>", dap.step_over, "Step over")
        utils.n_keymap("<F9>", dap.step_out, "Step out")
    end,
}
