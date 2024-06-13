local utils = require("rvxlab.utils")

return {
    "mfussenegger/nvim-dap",
    init = function()
        local dap = require("dap")

        utils.n_keymap("<leader>db", dap.toggle_breakpoint, "Toggle [b]reakpoint")
        utils.n_keymap("<F5>", dap.continue, "[C]ontinue")
        utils.n_keymap("<F7>", dap.step_into, "Step into")
        utils.n_keymap("<F8>", dap.step_over, "Step over")
        utils.n_keymap("<F9>", dap.step_out, "Step out")
    end,
}
