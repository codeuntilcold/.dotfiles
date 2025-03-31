vim.bo.makeprg = 'forge build'

vim.o.errorformat = table.concat({
    '%.%# --> %f:%l:%c:'
}, ',')
