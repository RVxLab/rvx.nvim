return {
    "saecki/crates.nvim",
    dependencies = {
        -- Load CMP first so we can load autocompletion
        "hrsh7th/nvim-cmp",
    },
    ft = {
        "rs",
        "toml",
    },
    opts = {
        completion = {
            cmp = {
                enabled = true,
            },
            crates = {
                enabled = true,
            },
        },
    },
}
