return {
    {
        'tpope/vim-fugitive',
        event = 'VeryLazy',
    },

    { -- Adds git releated signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        opts = {},
    },

    -- Blame the shat out of everyone
    {
        'f-person/git-blame.nvim',
        event = 'VeryLazy',
        opts = {
            delay = 1000,
            date_format = '%r',
        },
    },
}
