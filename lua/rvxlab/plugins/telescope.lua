return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {
                desc = "[F]ind files",
            })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
                desc = "[G]rep for files using Ripgrep",
            })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {
                desc = "[B]uffer search",
            })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
                desc = "[H]elp with tags",
            })
        end,
        init = function ()
            require('which-key').register({
                ['<leader>f'] = { name = "[F]ind with Telescope", _ = "which_key_ignore" },
            })
        end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },
}

