local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip.loaders.from_snipmate").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Esc>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({
            select = false,
        }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),
    experimental = {
        ghost_text = true,
    },
})
