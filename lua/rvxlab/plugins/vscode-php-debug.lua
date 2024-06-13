return {
    "xdebug/vscode-php-debug",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    ft = "php",
    build = "npm ci && npm run build",
    init = function()
        require("dap").adapters.php = {
            type = "executable",
            command = "node",
            args = {
                vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-php-debug/out/phpDebug.js"),
            },
        }
    end,
}
