return {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    main = 'ibl',
    opts = {
        debounce = 100,
        indent = { char = "┊" },
        whitespace = { highlight = { "Whitespace", "NonText" } },
        scope = { exclude = { language = { "lua" } } },
    },
}
