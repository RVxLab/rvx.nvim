local utils = require("rvxlab.utils")

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "echasnovski/mini.icons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0" },
    },
    keys = {
        utils.lazy_key("<leader>ff", function()
            require("telescope.builtin").find_files()
        end, "Find: [F]iles"),
        utils.lazy_key("<leader>fF", function()
            require("telescope.builtin").find_files({
                prompt_title = "All files",
                no_ignore = true,
            })
        end, "Find: All [F]iles"),
        utils.lazy_key("<leader>fs", function()
            require("telescope").extensions.live_grep_args.live_grep_args()
        end, "Find: [S]earch"),
        utils.lazy_key("<leader>fb", function()
            require("telescope.builtin").buffers()
        end, "Find: [B]uffers"),
        utils.lazy_key("<leader>fgf", function()
            require("telescope.builtin").git_files()
        end, "Find: Git [F]iles"),
        utils.lazy_key("<leader>fgc", function()
            require("telescope.builtin").git_commits()
        end, "Find: Git [C]ommits"),
        utils.lazy_key("<leader>fgb", function()
            require("telescope.builtin").git_branches()
        end, "Find: Git [B]rances"),
        utils.lazy_key("<leader>fgs", function()
            require("telescope.builtin").git_status()
        end, "Find: Git [S]tatus"),
    },
    opts = function()
        local actions = require("telescope.actions")

        return {
            defaults = {
                mappings = {
                    i = {
                        ["<Esc>"] = actions.close, -- Remove the double esc need in Telescope
                        ["<C-t>"] = actions.cycle_history_next,
                        ["<C-r>"] = actions.cycle_history_prev,
                    },
                },
                -- Even if ignored files are included, I don't want to see what's in the .git folder
                file_ignore_patterns = { ".git/" },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                oldfiles = {
                    prompt_title = "History",
                },
            },
            extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                        },
                    },
                },
            },
        }
    end,
    init = function()
        local telescope = require("telescope")

        telescope.load_extension("fzf")
        telescope.load_extension("live_grep_args")
    end,
}
