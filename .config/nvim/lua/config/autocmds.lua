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

-- For move projects
local lsp_started = false

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { '*.move' },
	callback = function()
		if lsp_started then return end

		vim.lsp.set_log_level('off')

		local move_toml = vim.fs.find({ 'Move.toml' }, { upward = true })[1]
		if not move_toml then
			print("No Move.toml found")
			return
		end

		local content = vim.fn.readfile(move_toml)
		local repo_found = ''
		for _, line in ipairs(content) do
			if line:match("MystenLabs/sui") then
				repo_found = 'sui'
				break
			end
			if line:match("AptosFramework") then
				repo_found = 'aptos'
				break
			end
		end

		local lsp_config = {
			sui = { cmd = "move-analyzer" },
			aptos = { cmd = "aptos-move-analyzer" }
		}

		if lsp_config[repo_found] then
			local cmd = vim.fn.exepath(lsp_config[repo_found].cmd)
			if cmd == "" then
				print(string.format("%s not found in PATH", lsp_config[repo_found].cmd))
				return
			end

			vim.lsp.stop_client(vim.lsp.get_active_clients())
			vim.lsp.start({
				name = repo_found,
				cmd = { cmd },
				root_dir = vim.fs.dirname(move_toml),
			})

			lsp_started = true
			print(string.format("%s LSP started", repo_found))
		else
			print("Unknown Move project type")
		end
	end
})

-- Enable lsp keymaps
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local nmap = function(keys, func, desc)
			if desc then
				desc = 'LSP: ' .. desc
			end
			vim.keymap.set('n', keys, func, { buffer = args.buf, desc = desc })
		end
		nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
		nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
		nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
		nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	end,
})
