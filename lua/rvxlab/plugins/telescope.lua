local utils = require("rvxlab.util")

return {
    "nvim-telescope/telescope.nvim",
    version = "~0.1",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0" },
        "nvim-telescope/telescope-ui-select.nvim",
    },
    keys = {
        utils.lazy_key("<leader>ff", function()
            require("telescope.builtin").find_files()
        end, "[F]ind files"),
        utils.lazy_key("<leader>ff", function()
            require("telescope.builtin").find_files({
                prompt_title = "All files",
                no_ignore = true,
            })
        end, "[F]ind all files"),
        utils.lazy_key("<leader>fg", function()
            require("telescope").extensions.live_grep_args.live_grep_args()
        end, "[G]rep for files"),
        utils.lazy_key("<leader>fb", function()
            require("telescope.builtin").buffers()
        end, "[F]ind buffers"),
        utils.lazy_key("<leader>fh", function()
            require("telescope.builtin").oldfiles()
        end, "Find in [h]istory"),
        utils.lazy_key("<leader>fs", function()
            require("telescope.builtin").lsp_document_symbols()
        end, "Find [s]ymbols in current document"),
    },
    opts = function()
        return {
            defaults = {
                mappings = {
                    i = {
                        ["<Esc>"] = require("telescope.actions").close, -- Remove the double esc need in Telescope
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
        telescope.load_extension("ui-select")
    end,
}
