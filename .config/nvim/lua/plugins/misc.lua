return {
    -- Undo tree
    {
        'mbbill/undotree',
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "[U]ndoTree" }
        }
    },

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    'tpope/vim-dispatch',

    -- Useful plugin to show you pending keybinds.
    {
        'folke/which-key.nvim',
        event = 'VimEnter',
        opts = {}
    },

    -- Highlight todo, notes, etc in comments
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false }
    },
}
