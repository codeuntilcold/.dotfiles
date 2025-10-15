local enabled = false

vim.api.nvim_create_augroup('IBusHandler', { clear = true })

local function magic()
    vim.api.nvim_create_autocmd('InsertEnter', {
        pattern = { '*.md' },
        group = 'IBusHandler',
        callback = function ()
            vim.fn.execute([[ !ibus engine Bamboo ]], 'silent!')
        end,
    })

    vim.api.nvim_create_autocmd('InsertLeave', {
        pattern = { '*.md' },
        group = 'IBusHandler',
        callback = function ()
            vim.fn.execute([[ !ibus engine BambooUs ]], 'silent!')
        end,
    })
end

vim.api.nvim_create_user_command('Bamboo', function()
    enabled = not enabled
    if enabled then
        magic()
    else
        vim.api.nvim_clear_autocmds({ group = 'IBusHandler' })
    end
end, {})

