return {
    -- Transparent background
    {
        'xiyaowong/transparent.nvim',
        opts = {},
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        event = "VimEnter",
        config = function()
            if os.getenv("USER") == "qd" then
                vim.cmd.colorscheme 'catppuccin'
            end
        end
    },

    {
        "zenbones-theme/zenbones.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.zenwritten_compat = 1
            vim.g.zenwritten_lightness = 'dim'
            vim.g.zenwritten_darken_comments = 45
            vim.g.zenwritten_transparent_background = true
            if os.getenv("USER") == "vpn" then
                vim.cmd.set "background=light"
                vim.cmd.colorscheme "zenwritten"
            end
        end
    },

    {
        'NLKNguyen/papercolor-theme',
        event = "VimEnter",
        config = function()
            -- vim.cmd.colorscheme "PaperColor"
        end
    },
}
