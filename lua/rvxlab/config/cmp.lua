local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip.loaders.from_snipmate").lazy_load()
luasnip.config.setup({})

local doc_scroll_delta = 4

cmp.setup({
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
        { name = "crates" },
        { name = "buffer" },
        { name = "path" },
    }),
    experimental = {
        -- Ghost text is a little too distracting
        -- ghost_text = true,
    },
})
