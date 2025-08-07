vim.cmd.set "background=light"

return {
    -- Transparent background
    {
        'xiyaowong/transparent.nvim',
        opts = {},
    },

    {
        "catppuccin/nvim",
        enable = false,
        name = "catppuccin",
        -- config = function()
        --     getcolorscheme()
        -- end
    },

    {
        "zenbones-theme/zenbones.nvim",
        enable = false,
        lazy = false,
        priority = 1000,
        -- config = function()
        --     vim.g.zenwritten_compat = 1
        --     vim.g.zenwritten_lightness = 'dim'
        --     vim.g.zenwritten_darken_comments = 45
        --     vim.g.zenwritten_transparent_background = true
        --     getcolorscheme()
        -- end
    },
}
