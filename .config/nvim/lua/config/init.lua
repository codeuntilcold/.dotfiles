-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',

	-- Working with db
	-- 'tpope/vim-dadbod',
	-- 'kristijanhusak/vim-dadbod-ui',

	-- Debug startup time of nvim
	-- 'dstein64/vim-startuptime',

	-- Useful plugin to show you pending keybinds.
	'folke/which-key.nvim',

	{ -- Set lualine as statusline
		'nvim-lualine/lualine.nvim',
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				theme = 'onedark',
				component_separators = '|',
				section_separators = '',
			},
		},
	},

	{ -- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {
			debounce = 100,
			indent = { char = "┊" },
			whitespace = { highlight = { "Whitespace", "NonText" } },
			scope = { exclude = { language = { "lua" } } },
		},
		config = function(_, opts)
			require('ibl').setup(opts)
		end,
	},

	-- "gc" to comment visual regions/lines
	{ 'numToStr/Comment.nvim', opts = {} },

	{ import = 'plugins' },
}, {})


local modules = {
	"config.autocmds",
	"config.options",
	"config.keymaps",
	"config.custom",
}

for _, mod in ipairs(modules) do
	local ok, err = pcall(require, mod)
	-- config.custom may be empty. It's a optional module
	if not ok and not mod == "config/custom" then
		error(("Error loading %s...\n\n%s"):format(mod, err))
	end
end
