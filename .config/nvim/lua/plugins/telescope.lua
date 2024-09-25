-- Fuzzy Finder (files, lsp, etc)
return {
	{
		'nvim-telescope/telescope.nvim',
		event = 'VeryLazy',
		version = '*',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
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

			-- Enable telescope fzf native, if installed
			pcall(telescope.load_extension, 'fzf')

			-- See `:help telescope.builtin`
			vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
			vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
			vim.keymap.set('n', '<leader>/', function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end, { desc = '[/] Fuzzily search in current buffer' })

			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
			vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
			vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
			vim.keymap.set('n', '<leader>sn', function()
				builtin.find_files { cwd = vim.fn.stdpath 'config' }
			end, { desc = '[S]earch [N]eovim files' })

			local actions = require('telescope.actions')
			local action_state = require('telescope.actions.state')

			vim.keymap.set('n', '<leader>gl', function()
				builtin.git_commits({
					attach_mappings = function(_, map)
						map('i', '<CR>', function(prompt_bufnr)
							local selection = action_state.get_selected_entry()
							actions.close(prompt_bufnr)
							local commit_hash = selection.value
							local Job = require('plenary.job')
							local output = Job:new({
								command = "git",
								args = { "show", "-s", "--format=%B", commit_hash },
							}):sync()
							vim.api.nvim_put(output, 'l', false, false)
						end)
						return true
					end
				})
			end, { desc = '[G]o get [L]ast commit' })
		end
	},

	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	},
}
