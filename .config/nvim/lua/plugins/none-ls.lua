return {
    'nvimtools/none-ls.nvim',
    event = 'VeryLazy',
    keys = {
        { '<leader>gf', vim.lsp.buf.format, desc = '[G]o and [F]ormat the code' }
    },
    config = function()
        require('null-ls').setup {
            sources = {
                require('null-ls').builtins.formatting.prettier,
            },
        }
    end,
}
