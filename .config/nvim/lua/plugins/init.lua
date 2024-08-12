return {
	-- Undo tree
	{
		'mbbill/undotree',
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "[U]ndoTree" }
		}
	},

	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',

	-- Useful plugin to show you pending keybinds.
	{
		'folke/which-key.nvim',
		event = 'VimEnter',
		opts = {}
	},

	-- Highlight todo, notes, etc in comments
	{
		'folke/todo-comments.nvim',
		event = 'VimEnter',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = { signs = false }
	},

	{
		"leath-dub/snipe.nvim",
		keys = {
			{
				"<leader>ss",
				function() require("snipe").open_buffer_menu({
					max_path_width = 1
				}) end,
				desc = "Open [S]nipe buffer menu"
			}
		},
		opts = {
			ui = { position = 'cursor' },
		}
	}
}
