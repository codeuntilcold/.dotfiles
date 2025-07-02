local function getcolorscheme()
    if os.getenv("USER") == "qd" or os.getenv("SSH_CONNECTION") ~= nil then
        return
    end
    vim.cmd.set "background=light"
    -- vim.cmd.colorscheme "zenwritten"
end

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
        config = function()
            getcolorscheme()
        end
    },

    {
        "zenbones-theme/zenbones.nvim",
        enable = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.zenwritten_compat = 1
            vim.g.zenwritten_lightness = 'dim'
            vim.g.zenwritten_darken_comments = 45
            vim.g.zenwritten_transparent_background = true
            getcolorscheme()
        end
    },
}
