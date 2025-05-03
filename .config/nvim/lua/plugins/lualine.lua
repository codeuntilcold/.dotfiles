return {
    'nvim-lualine/lualine.nvim',
    event = 'UIEnter',
    opts = {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = '|',
            section_separators = '',
        },
        sections = {
            -- lualine_c = { { 'filename', path = 1 } },
            lualine_x = { 'filetype' },
        }
    },
}
