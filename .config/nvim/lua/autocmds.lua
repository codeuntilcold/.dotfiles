-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
    pattern = '*',
})

-- Handle a bug where default comment of nvim does not add leading space
vim.api.nvim_create_autocmd({ 'FileType' }, {
    desc = 'Force commentstring to include spaces',
    callback = function(event)
        local cs = vim.bo[event.buf].commentstring
        vim.bo[event.buf].commentstring = cs:gsub('(%S)%%s', '%1 %%s'):gsub('%%s(%S)', '%%s %1')
    end,
})
