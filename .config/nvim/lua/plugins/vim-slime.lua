return {
    'jpalardy/vim-slime',
    init = function()
        vim.g.slime_no_mappings = 1
        vim.g.slime_cell_delimiter = "# %%"

        vim.g.slime_target = 'tmux'
        vim.g.slime_bracketed_paste = 1
    end,
    keys = {
        { '<leader>s', '<Plug>SlimeRegionSend', mode = 'x'  },
        { '<leader>ss', '<Plug>SlimeLineSend' },
        { '<leader>sc', '<Plug>SlimeSendCell' },
    },
}
