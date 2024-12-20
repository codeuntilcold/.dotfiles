return {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'VeryLazy',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        {
            'L3MON4D3/LuaSnip',
            dependencies = {
                "rafamadriz/friendly-snippets",
            },
            opts = {},
            config = function(_, opts)
                require('luasnip').config.set_config(opts)
                require('luasnip.loaders.from_vscode').lazy_load()
            end,
        },
        'saadparwaiz1/cmp_luasnip',
        'SergioRibera/cmp-dotenv',
    },
    opts = function()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'
        local options = {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'dotenv' },
            },
        }

        return options
    end,
    config = function(_, opts)
        require('cmp').setup(opts)
    end
}
