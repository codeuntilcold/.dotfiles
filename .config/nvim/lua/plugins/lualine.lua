return {
	{ -- Set lualine as statusline
		-- See `:help lualine.txt`
		'nvim-lualine/lualine.nvim',
		event = 'VeryLazy',
		opts = {
			options = {
				icons_enabled = true,
				theme = 'auto',
				component_separators = '|',
				section_separators = '',
			},
			sections = {
			-- 	lualine_c = { { 'filename', path = 1 } },
				lualine_x = { 'filetype' },
			}
		},
	},
}
