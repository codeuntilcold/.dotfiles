if os.getenv("USER") == "vpn" then
	vim.cmd.set "background=light"
end

return {
	-- Transparent background
	{
		'xiyaowong/transparent.nvim',
		opts = {},
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		event = "VimEnter",
		config = function()
		-- 	vim.cmd.colorscheme 'catppuccin-latte'
		end
	},

	{
		"zenbones-theme/zenbones.nvim",
		event = "VimEnter",
		config = function()
			-- vim.g.zenbones_compat = 1
			-- vim.cmd.colorscheme "zenbones"
			vim.g.zenwritten_compat = 1
			vim.cmd.colorscheme "zenwritten"
		end
	},

	{
		'NLKNguyen/papercolor-theme',
		event = "VimEnter",
		config = function()
			-- vim.cmd.colorscheme "PaperColor"
		end
	},
}
