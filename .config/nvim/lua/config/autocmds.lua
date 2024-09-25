-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.highlight.on_yank() end,
	group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
	pattern = '*',
})

-- Handle a bug where default comment of nvim does not add leading space
vim.api.nvim_create_autocmd({ 'FileType' }, {
	desc = 'Force commentstring to include spaces',
	callback = function(event)
		local cs = vim.bo[event.buf].commentstring
		vim.bo[event.buf].commentstring = cs:gsub('(%S)%%s', '%1 %%s'):gsub('%%s(%S)', '%%s %1')
	end,
})

-- For gilder_index project
vim.api.nvim_create_autocmd('BufEnter', {
	pattern = { '*.e2e-spec.ts' },
	callback = function()
		vim.keymap.set('n', '<leader>tt', '<cmd>TestNearest --config ./apps/api/test/jest-e2e.json<CR>')
		vim.keymap.set('n', '<leader>tl', '<cmd>TestLast --config ./apps/api/test/jest-e2e.json<CR>')
		vim.keymap.set('n', '<leader>tf', '<cmd>TestFile --config ./apps/api/test/jest-e2e.json<CR>')
		vim.keymap.set('n', '<leader>ts', '<cmd>TestSuite --config ./apps/api/test/jest-e2e.json<CR>')
	end
})

vim.api.nvim_create_autocmd('BufEnter', {
	pattern = { '*.spec.ts' },
	callback = function()
		vim.keymap.set('n', '<leader>te', '<cmd>TestNearest<CR>')
		vim.keymap.set('n', '<leader>tt', '<cmd>TestNearest<CR>')
		vim.keymap.set('n', '<leader>tl', '<cmd>TestLast<CR>')
		vim.keymap.set('n', '<leader>tf', '<cmd>TestFile<CR>')
		vim.keymap.set('n', '<leader>ts', '<cmd>TestSuite<CR>')
	end
})
