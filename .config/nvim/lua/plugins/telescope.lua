return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')

            telescope.setup {
                defaults = {
                    mappings = {
                        i = {
                            ['<C-u>'] = false,
                            ['<C-d>'] = false,
                        },
                    },
                },
            }

            local dropdown = require('telescope.themes').get_dropdown { winblend = 10, previewer = false }

            local function nmap(key, func, desc)
                vim.keymap.set('n', key, func, { desc = desc })
            end

            nmap('<leader>?', builtin.oldfiles, '[?] Find recently opened files')
            nmap('<leader><space>', builtin.buffers, '[ ] Find existing buffers')
            nmap('<leader>/', function() builtin.current_buffer_fuzzy_find(dropdown) end, '[/] Fuzzily search in current buffer')

            nmap('<leader>sf', function () builtin.find_files(dropdown) end, '[S]earch [F]iles')
            nmap('<leader>sh', builtin.help_tags, '[S]earch [H]elp')
            nmap('<leader>sg', builtin.live_grep, '[S]earch by [G]rep')
            nmap('<leader>sd', builtin.diagnostics, '[S]earch [D]iagnostics')
            nmap('<leader>sr', builtin.resume, '[S]earch [R]esume')

            vim.keymap.set('n', '<leader>gl', function()
                builtin.git_commits({
                    attach_mappings = function(_, map)
                        map('i', '<CR>', function(prompt_bufnr)
                            local selection = require('telescope.actions.state').get_selected_entry()
                            require('telescope.actions').close(prompt_bufnr)
                            local commit_hash = selection.value
                            local Job = require('plenary.job')
                            local output = Job:new({
                                command = "git",
                                args = { "show", "-s", "--format=%B", commit_hash },
                            }):sync()
                            if not output then return end

                            vim.api.nvim_put(output, 'l', false, false)
                        end)
                        return true
                    end
                })
            end, { desc = '[G]o get [L]ast commit' })
        end
    },
}
