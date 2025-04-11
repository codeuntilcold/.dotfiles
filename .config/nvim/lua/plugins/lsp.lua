return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        { "j-hui/fidget.nvim", event = "LspAttach", opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        { 'folke/neodev.nvim', opts = {} },
    },
    config = function(_, opts)
        local telescope = require('telescope.builtin')

        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc)
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
            end

            nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap('grr', telescope.lsp_references, '[G]oto [R]eferences') -- grr

            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        local servers = {
            gopls = {},
            pyright = {
                pyright = {
                    disableOrganizeImports = true,
                },
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        typeCheckingMode = 'off',
                        ignore = { '*' }
                    },
                },
            },
            rust_analyzer = {},
            ts_ls = {},
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
            ruff = {},
        }

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = require('blink.cmp').get_lsp_capabilities({}, true)

        -- Setup mason so it can manage external tooling
        require('mason').setup()
        require('mason-lspconfig').setup {
            automatic_installation = false,
            ensure_installed = vim.tbl_keys(servers),
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = servers[server_name],
                    }
                end,
            }
        }

        return opts
    end
}
