local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip.loaders.from_snipmate").lazy_load()

local has_words_before = function()
    -- Get the line and column of where the cursor is
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))

    -- If we're at the start of a line it means there can't be a word in front
    if col == 0 then
        return false
    end

    local current_line = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
    local is_non_whitespace = current_line:sub(col, col):match("%s") == nil

    return is_non_whitespace
end

cmp.setup({
    preselect = false,
    snippet = {
        expand = function(args)
            luasnip.expand(args.body)
        end,
    },
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    formatting = {
        format = lspkind.cmp_format(),
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    },
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
