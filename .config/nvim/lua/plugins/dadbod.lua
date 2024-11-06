return {
    -- The OG dadbod tool to communicate with databases
    'tpope/vim-dadbod',

    -- The terminal UI tool to run dadbod
    {
        'kristijanhusak/vim-dadbod-ui',
		lazy = true,
        dependencies = {
            {
                'kristijanhusak/vim-dadbod-completion',
                ft = { 'sql', 'mysql', 'plsql' },
				lazy = true,
            },
        },
        cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
        init = function ()
            vim.g.db_ui_use_nerd_fonts = 1
        end,
        config = function()
            require('cmp').setup.filetype({ 'sql' }, {
                sources = {
                    { name = 'vim-dadbod-completion' },
                    { name = 'buffer' },
                },
            })
        end,
    },
}
