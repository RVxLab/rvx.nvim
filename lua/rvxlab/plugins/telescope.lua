return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            { "nvim-telescope/telescope-fzf-native.nvim",     build = "make" },
            { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0" },
        },
        opts = function()
            local actions = require("telescope.actions")

            return {
                defaults = {
                    mappings = {
                        i = {
                            ["<Esc>"] = actions.close, -- Remove the double esc need in Telescope
                        },
                    },
                    file_ignore_patterns = { ".git/" },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                    },
                },
            }
        end,
        init = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            local util = require("rvxlab.util")

            telescope.load_extension("fzf")
            telescope.load_extension("live_grep_args")

            require("which-key").register({
                ["<leader>f"] = { name = "[F]ind with Telescope", _ = "which_key_ignore" },
            })

            vim.keymap.set("n", "<leader>ff", builtin.find_files, {
                desc = "[F]ind files",
            })

            vim.keymap.set(
                "n",
                "<leader>fF",
                util.bind(builtin.find_files, {
                    prompt_title = "All files",
                    no_ignore = true,
                }),
                {
                    desc = "[F]ind all files",
                }
            )

            vim.keymap.set("n", "<leader>fg", telescope.extensions.live_grep_args.live_grep_args, {
                desc = "[G]rep for files using Ripgrep",
            })

            vim.keymap.set("n", "<leader>fb", builtin.buffers, {
                desc = "[B]uffer search",
            })

            vim.keymap.set("n", "<leader>fh", builtin.oldfiles, {
                desc = "[H]istory",
            })

            vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {
                desc = "Find [s]ymbols in document",
            })
        end,
    },
}
