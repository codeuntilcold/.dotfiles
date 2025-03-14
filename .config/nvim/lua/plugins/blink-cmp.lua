return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = '*',

    opts = {
        keymap = {
            preset = 'default',
            ['<Up>'] = {},
            ['<Down>'] = {},
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
}
