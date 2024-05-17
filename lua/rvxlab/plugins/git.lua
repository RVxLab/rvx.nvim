-- Everything related to Git

local bind = require('rvxlab.util').bind

return {
    {
        "lewis6991/gitsigns.nvim",
        version = "~0.7",
        opts = {
            current_line_blame = true,
            yadm = {
                enable = false, -- I don't use yadm
            },
            on_attach = function (buffer)
                local gs = require('gitsigns')

                vim.keymap.set('n', '[h', bind(vim.schedule, gs.prev_hunk), {
                    desc = "Previous [H]unk",
                    buffer = buffer,
                })

                vim.keymap.set('n', ']h', bind(vim.schedule, gs.next_hunk), {
                    desc = "Next [H]unk",
                    buffer = buffer,
                })
            end,
        },
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        init = function()
            vim.keymap.set("n", "<leader>gg", require("lazygit").lazygit, {
                desc = "Open Lazy[G]it",
            })
        end,
    },
    { "tpope/vim-fugitive" },
}
