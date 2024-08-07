-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'
vim.keymap.set('v', '<leader>y', '\"+y', { desc = '[Y]ank to system' })

-- Magic keymap
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set('n', '<leader>-', '<CMD>Explore<CR>')
vim.keymap.set('n', '<leader>-', '<CMD>Oil<CR>')


-- Since Telescope is too smart
vim.keymap.set('n', '<leader>ee', '<CMD>new .env<CR>', { desc = '[E]dit [E]nv' })
vim.keymap.set('n', '<leader>ej', '<CMD>new .envs/.local/.django<CR>', { desc = '[E]dit D[J]ango env' })

-- No need for vim surround
vim.keymap.set('v', "<leader>'", "<ESC>gv<ESC>a'<ESC>gvo<ESC>i'<ESC>gv", { desc = 'Surround with [\']' })
vim.keymap.set('v', "<leader>r'", "<ESC>gv<ESC>lr'gvo<ESC>hr'", { desc = '[R]eplace surround with [\']' })
vim.keymap.set('v', '<leader>"', '<ESC>gv<ESC>a"<ESC>gvo<ESC>i"<ESC>gv', { desc = 'Surround with ["]' })
vim.keymap.set('v', '<leader>r"', '<ESC>gv<ESC>lr"gvo<ESC>hr"', { desc = '[R]eplace surround with ["]' })
vim.keymap.set('v', '<leader>`', '<ESC>gv<ESC>a`<ESC>gvo<ESC>i`<ESC>gv', { desc = 'Surround with [`]' })
vim.keymap.set('v', '<leader>r`', '<ESC>gv<ESC>lr`gvo<ESC>hr`', { desc = '[R]eplace surround with [`]' })

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostic [E]dit' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic [Q]uick fix' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>')

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
