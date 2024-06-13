return {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = {
        "mfussenegger/nvim-dap",
        {
            "microsoft/vscode-js-debug",
            build = "npm ci --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
        },
    },
    ft = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
    },
    opts = {
        debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
        adapters = { "pwa-node" },
    },
}
