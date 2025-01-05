local utils = require("utils")
local add, later = MiniDeps.add, MiniDeps.later

later(function()
    add({
        source = "saghen/blink.cmp",
        depends = {
            "rafamadriz/friendly-snippets",
            "folke/lazydev.nvim",
            "echasnovski/mini.icons",
        },
        checkout = "v0.9.2", -- Version is needed for download
    })

    require("lazydev").setup({
        library = {
            -- Only load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    })

    local keymap = vim.tbl_extend(
        "keep",
        {
            preset = "enter",
        },
        utils.map_with_keys(utils.range(1, 5), function(value)
            local key = string.format("<C-%d>", value)
            local fn = function(cmp)
                cmp.accept({ index = value })
            end

            return key, { fn }
        end)
    )

    require("blink.cmp").setup({
        keymap = keymap,
        completion = {
            list = {
                selection = "manual",
            },
            menu = {
                draw = {
                    columns = {
                        { "kind_icon", "kind", gap = 1 },
                        { "label", "label_description", gap = 1 },
                    },
                    components = {
                        kind_icon = {
                            ellipsis = false,
                            text = function(ctx)
                                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                return kind_icon
                            end,
                        },
                    },
                },
            },
            documentation = {
                auto_show = true,
            },
            ghost_text = {
                enabled = true,
            },
        },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
                lsp = {
                    score_offset = 90,
                },
                snippets = {
                    score_offset = 80,
                },
            },
        },
        signature = {
            enabled = true,
        },
    })
end)
