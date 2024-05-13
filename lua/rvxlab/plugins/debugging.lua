local util = require("rvxlab.util")

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

        util.n_keymap("<leader>Db", dap.toggle_breakpoint, "Toggle [b]reakpoint")
        util.n_keymap("<leader>Dus", function()
            widgets.sidebar(widgets.scopes).open()
        end, "Open debugging [s]idebar")
        util.n_keymap("<F5>", dap.continue, "[C]ontinue")
        util.n_keymap("<F7>", dap.step_into, "Step into")
        util.n_keymap("<F8>", dap.step_over, "Step over")
        util.n_keymap("<F9>", dap.step_out, "Step out")
    end,
}
