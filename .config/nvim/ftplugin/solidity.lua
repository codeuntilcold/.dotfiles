vim.bo.makeprg = 'forge'

vim.o.errorformat = table.concat({
    '%.%# --> %f:%l:%c:',
    '%-G[PASS%.%#',
    '%-GSuite%.%#',
}, ',')
