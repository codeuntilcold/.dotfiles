return {
	-- The OG dadbod tool to communicate with databases
	'tpope/vim-dadbod',

	-- The terminal UI tool to run dadbod
	{
		'kristijanhusak/vim-dadbod-ui',
		lazy = true,
		dependencies = {
			{
				'kristijanhusak/vim-dadbod-completion',
				ft = { 'sql', 'mysql', 'plsql' },
				lazy = true,
			},
		},
		cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
		init = function ()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
		config = function()
			require('cmp').setup.filetype({ 'sql' }, {
				sources = {
					{ name = 'vim-dadbod-completion' },
					{ name = 'buffer' },
				},
			})
		end,
	},

	-- The web to render result from dadbod or dadbod-ui queries
	-- {
	-- 	'napisani/nvim-dadbod-bg',
	-- 	build = './install.sh',
	-- 	-- (optional) the default port is 4546
	-- 	-- (optional) the log file will be created in the system's temp directory
	-- 	config = function()
	-- 		vim.cmd([[
	-- 			let g:nvim_dadbod_bg_port = '4546'
	-- 			leg g:nvim_dadbod_bg_log_file = '/tmp/nvim-dadbod-bg.log'
	-- 		]])
	-- 	end
	-- }
}
