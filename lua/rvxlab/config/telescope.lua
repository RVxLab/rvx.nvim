-- Telescope config
local telescope = require("telescope")
local util = require("rvxlab.util")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local grep = require("telescope-live-grep-args.actions")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<Esc>"] = actions.close, -- Remove the double esc need in Telescope
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
                    ["<C-k>"] = grep.quote_prompt(),
                },
            },
        },
    },
})

-- Register an entry in which-key for Telescope
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

-- Load the extensions at the end
telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")
