local M = {}

function M.setup_remaps(buffer)
    local telescope = require("telescope.builtin")

    local map = function(keymap, func, opts)
        opts = opts or {}
        opts.buffer = buffer

        if opts.desc then
            opts.desc = "LSP: " .. opts.desc
        end

        vim.keymap.set("n", keymap, func, opts)
    end

    map("<C-x>", vim.diagnostic.open_float, {
        desc = "Open [D]iagnostic window",
    })

    map("<leader>ga", vim.lsp.buf.code_action, {
        desc = "Code [A]ction",
    })

    map("[d", vim.diagnostic.goto_prev, {
        desc = "Go to previous error",
    })

    map("]d", vim.diagnostic.goto_next, {
        desc = "Go to next error",
    })

    map("<leader>gr", telescope.lsp_references, {
        desc = "Find [r]eferences",
    })

    map("<leader>gi", telescope.lsp_implementations, {
        desc = "Find [i]mplementations",
    })

    map("<leader>gd", telescope.lsp_definitions, {
        desc = "Go to [d]efinition",
    })

    map("<leader>rn", vim.lsp.buf.rename, {
        desc = "Refactor: Re[n]ame symbol",
    })

    map("<leader>it", function()
        local filter = {
            bufnr = buffer,
        }

        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(filter), filter)
    end, {
        desc = "LSP: [T]oggle hints",
    })
end

function M.on_attach(client, buffer)
    -- Enable inlay hints if the current language server supports it
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, {
            bufnr = buffer,
        })
    end

    M.setup_remaps(buffer)
end

return M
