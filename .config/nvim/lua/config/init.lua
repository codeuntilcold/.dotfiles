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
	-- Undo tree
	'mbbill/undotree',

	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',

	-- Working with db
	-- 'tpope/vim-dadbod',
	-- 'kristijanhusak/vim-dadbod-ui',

	-- Debug startup time of nvim
	-- 'dstein64/vim-startuptime',

	-- Useful plugin to show you pending keybinds.
	{ 'folke/which-key.nvim',     opts = {} },

	-- "gc" to comment visual regions/lines
	{ 'numToStr/Comment.nvim',    opts = {} },

	-- Highlight todo, notes, etc in comments
	{ 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

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
