local function is_ssh()
    return os.getenv("SSH_CONNECTION") ~= nil
end

local function getcolorscheme()
    if os.getenv("USER") == "qd" or is_ssh() then
        vim.cmd.colorscheme 'catppuccin'
        return
    end
    vim.cmd.set "background=light"
    vim.cmd.colorscheme "zenwritten"
end

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
            getcolorscheme()
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
            getcolorscheme()
        end
    },

    {
        'NLKNguyen/papercolor-theme',
        event = "VimEnter",
    },
}
