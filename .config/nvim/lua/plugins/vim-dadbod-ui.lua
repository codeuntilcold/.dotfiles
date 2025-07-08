return {
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
    init = function()
        vim.g.db_ui_use_nerd_fonts = 1
    end,
    config = function()
        require('blink.cmp').add_provider('dadbod', {
            name = "Dadbod", module = "vim_dadbod_completion.blink",
        })
    end,
}
