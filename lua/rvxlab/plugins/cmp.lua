return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter', -- Don't load cmp until we actually start coding
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        "hrsh7th/cmp-nvim-lsp",
        {
            "L3MON4D3/LuaSnip",
            version = "^2.0",
        },
    },
    config = function ()
        local cmp = require('cmp')

        cmp.setup({
            snippet = {
                expand = function (args)
                    require('luasnip').expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<Esc>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({
                    select = false,
                }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            }),
        })
    end,
}

