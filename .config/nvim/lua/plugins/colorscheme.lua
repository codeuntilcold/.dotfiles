return {
	-- Transparent background
	{
		'xiyaowong/transparent.nvim',
		opts = {
			extra_groups = {
				-- "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
			},
		},
	},

	-- Use pywal colors
	'dylanaraps/wal.vim',

	-- Theme inspired by Atom
	'navarasu/onedark.nvim',

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		event = "VimEnter",
		config = function()
			vim.cmd.colorscheme 'catppuccin'
		end
	},

	{
		"AlexvZyl/nordic.nvim",
		priority = 1000,
	},

	{
		"savq/melange-nvim",
		priority = 1000,
	},

	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
	},

	{
		'yorickpeterse/nvim-grey'
	},
}
