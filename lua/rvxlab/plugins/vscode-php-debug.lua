return {
    "xdebug/vscode-php-debug",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    ft = "php",
    build = "npm ci && npm run build",
    init = function()
        local dap = require("dap")
        dap.adapters.php = {
            type = "executable",
            command = "node",
            args = {
                vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-php-debug/out/phpDebug.js"),
            },
        }

        dap.configurations.php = {
            {
                type = "php",
                request = "launch",
                name = "Listen for xDebug",
                port = 9003,
            },
        }
    end,
}
