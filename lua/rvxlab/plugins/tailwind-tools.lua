return {
    "luckasRanarison/tailwind-tools.nvim",
    event = {
        "BufReadPre *.html,*.css,*.blade.php,*.tsx",
        "BufNewFile *.html,*.css,*.blade.php,*.tsx",
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
}
