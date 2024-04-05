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

	-- Catppuccin
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
