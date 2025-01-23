return {
    -- 'nvim-treesitter/nvim-treesitter-context',

    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        event = 'VeryLazy',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })

            local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
            parser_config.move = {
                install_info = {
                    url = (vim.env.DEV_HOME or "~/Desktop/DungNgo") .. "/tree-sitter-move", -- local path or git repo
                    files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
                },
                filetype = "move",
            }

            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vim', 'html', 'javascript', 'json', 'vimdoc', 'move'
                },
                ignore_install = {},

                modules = {},

                auto_install = false,
                sync_install = false,

                highlight = { enable = true },
                indent = { enable = true, disable = { 'python' } },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<c-space>',
                        node_incremental = '<c-space>',
                        scope_incremental = '<c-s>',
                        node_decremental = '<M-space>',
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ['aa'] = '@parameter.outer',
                            ['ia'] = '@parameter.inner',
                            ['af'] = '@function.outer',
                            ['if'] = '@function.inner',
                            ['ac'] = '@class.outer',
                            ['ic'] = '@class.inner',
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            [']m'] = '@function.outer',
                            [']]'] = '@class.outer',
                        },
                        goto_next_end = {
                            [']M'] = '@function.outer',
                            [']['] = '@class.outer',
                        },
                        goto_previous_start = {
                            ['[m'] = '@function.outer',
                            ['[['] = '@class.outer',
                        },
                        goto_previous_end = {
                            ['[M'] = '@function.outer',
                            ['[]'] = '@class.outer',
                        },
                    },
                },
            }
        end,
    },
}
