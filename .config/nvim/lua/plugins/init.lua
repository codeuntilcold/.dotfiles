return {
	-- Undo tree
	{
		'mbbill/undotree',
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<CR>" }
		}
	},

	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',

	-- Useful plugin to show you pending keybinds.
	{ 'folke/which-key.nvim',     opts = {} },

	-- Highlight todo, notes, etc in comments
	{ 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
