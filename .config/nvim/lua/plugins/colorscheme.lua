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
		config = function()
			vim.cmd.colorscheme 'catppuccin'
		end
	},

	-- {
	-- 	"AlexvZyl/nordic.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme 'nordic'
	-- 	end
	-- },

	-- {
	-- 	"savq/melange-nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme 'melange'
	-- 	end
	-- },

	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme 'kanagawa'
	-- 	end
	-- },

}
