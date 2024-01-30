return {
	-- Git related
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',

	{ -- Adds git releated signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},

	{
		'f-person/git-blame.nvim',
		opts = {
			delay = 1000,
		},
	},
}
