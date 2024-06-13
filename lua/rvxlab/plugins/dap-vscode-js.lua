return {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    opts = {
        debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
        adapters = { "pwa-node" },
    },
}
