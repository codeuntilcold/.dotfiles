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
		end
	},
}
