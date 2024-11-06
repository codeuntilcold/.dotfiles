-- For better coding guide
vim.o.colorcolumn = "100"

-- Vim dadbod config
vim.g.db_ui_winwidth = 30

-- Set default tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.complete = vim.o.complete .. ',i,kspell'
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.opt.splitright = true
-- Not sure if I like this
-- vim.opt.splitbelow = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
