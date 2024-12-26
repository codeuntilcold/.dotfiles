return {
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
    },

    {
        'hrsh7th/nvim-cmp',
        event = 'VeryLazy',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'SergioRibera/cmp-dotenv',
            'saadparwaiz1/cmp_luasnip',
        },
        opts = function()
            local cmp = require 'cmp'
            local options = {
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert {
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'dotenv' },
                }, {
                    { name = 'buffer' }
                }),
            }

            return options
        end,
    },
}
