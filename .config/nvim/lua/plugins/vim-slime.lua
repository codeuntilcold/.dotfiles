return {
    'jpalardy/vim-slime',
    init = function()
        vim.g.slime_no_mappings = 1
        vim.g.slime_cell_delimiter = "# %%"

        vim.g.slime_target = 'tmux'
        -- vim.g.slime_python_ipython = 1
        vim.g.slime_bracketed_paste = 1
    end,
    config = function()
        vim.keymap.set('x', '<leader>s', '<Plug>SlimeRegionSend')
        vim.keymap.set('n', '<leader>ss', '<Plug>SlimeLineSend')
        vim.keymap.set('n', '<leader>sc', '<Plug>SlimeSendCell', { noremap = false, silent = true })
    end
}
