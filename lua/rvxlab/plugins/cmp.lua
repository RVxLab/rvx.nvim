local invoke = require("rvxlab.util").invoke

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        {
            "L3MON4D3/LuaSnip",
            build = invoke(function()
                -- Build jsregexp if not on Windows and make is available
                if vim.fn.has("win32") == 1 or vim.fn.executable("make") ~= 1 then
                    return nil
                end

                return "make install_jsregexp"
            end),
        },
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
    },
    opts = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        require("luasnip.loaders.from_snipmate").lazy_load()
        luasnip.config.setup({})

        local doc_scroll_delta = 4

        return {
            preselect = false,
            snippet = {
                expand = function(args)
                    -- Expand snippets using the available LSP if possible
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            formatting = {
                format = lspkind.cmp_format(),
            },
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-d>"] = cmp.mapping.open_docs(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-,>"] = cmp.mapping.scroll_docs(-doc_scroll_delta),
                ["<C-.>"] = cmp.mapping.scroll_docs(doc_scroll_delta),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
                { name = "lazydev", group_index = 0 },
                { name = "crates" },
                { name = "buffer" },
                { name = "path" },
            }),
        }
    end,

    ---@diagnostic disable-next-line: unused-local
    config = function(_plugin, opts)
        local cmp = require("cmp")

        -- Setup CMP like normal
        cmp.setup(opts)

        -- Setup for dadbod
        cmp.setup.filetype({ "sql" }, {
            { name = "vim-dadbod-completion" },
            { name = "buffer" },
        })
    end,
}
