return {
	{
		'preservim/vimux',
		event = 'VeryLazy',
	},

	{
		'vim-test/vim-test',
		event = 'VeryLazy',
		dependecies = {
			'preservim/vimux'
		},
		config = function()
			vim.g['test#strategy'] = 'vimux' -- 'neovim_sticky'
			-- vim.g['test#javascript#jest#executable'] = 'npm run test:e2e'

			-- For gilder_index project
			vim.api.nvim_create_autocmd('BufEnter', {
				pattern = { '*.e2e-spec.ts' },
				callback = function()
					vim.keymap.set('n', '<leader>tt', '<cmd>TestNearest --config ./apps/api/test/jest-e2e.json<CR>')
					vim.keymap.set('n', '<leader>tl', '<cmd>TestLast --config ./apps/api/test/jest-e2e.json<CR>')
					vim.keymap.set('n', '<leader>tf', '<cmd>TestFile --config ./apps/api/test/jest-e2e.json<CR>')
					vim.keymap.set('n', '<leader>ts', '<cmd>TestSuite --config ./apps/api/test/jest-e2e.json<CR>')
				end
			})
			vim.api.nvim_create_autocmd('BufEnter', {
				pattern = { '*.spec.ts' },
				callback = function()
					vim.keymap.set('n', '<leader>te', '<cmd>TestNearest<CR>')
					vim.keymap.set('n', '<leader>tt', '<cmd>TestNearest<CR>')
					vim.keymap.set('n', '<leader>tl', '<cmd>TestLast<CR>')
					vim.keymap.set('n', '<leader>tf', '<cmd>TestFile<CR>')
					vim.keymap.set('n', '<leader>ts', '<cmd>TestSuite<CR>')
				end
			})
		end
	},
}
