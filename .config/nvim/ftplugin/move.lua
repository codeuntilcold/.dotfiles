vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Strip color...
vim.o.makeprg = 'NO_COLOR=1 make $*' .. ' \\|& sed \'s/\x1B\\[[0-9;]\\{1,\\}[A-Za-z]//g\'';

vim.o.errorformat = table.concat({
	"%-Gaptos%.%#",
	"%-Gsui%.%#",
	"%-GINCLUDING DEPENDENCY%.%#",
	"%-GCompiling%.%#",
	"%-GBuilding%.%#",
	"%-GFailed to build%.%#",
	"%-Gmake: ***%.%#",
	"%-GRunning Move%.%#",
	"%-G[ PASS %.%#",
	"%-G[ FAIL %.%#",
	"%-GTest failures:%.%#",
	"%-GFailures in %.%#",
	"%-GTest result: %.%#",
	"%-G",

	-- test
	"%E┌── %.%# ──────",
	"%C│ error[E%n]:",
	"%Z└──────────────────",

	-- compiling
	"%Eerror[E%n]: %m",
	"%Eerror: %m",
	"%Wwarning: %m",
	"%Wwarning[W%n]: %m",
	"%-C%.%# %f:%l:%c",
	"%-C%.%#│%p %^%#",
	"%-C%.%#│%p %^%# %m",
	"%-C%.%#│%p -%# %m",
	"%-C%.%#│%p %m",
	"%-C%.%#│ %#%m",
	"%Z",

	"%-A{",
	"%-C%.%#",
	"%-C}",
	"%Z",
}, ',')

local function main()
	vim.lsp.set_log_level('off')

	local move_toml = vim.fs.find({ 'Move.toml' }, { upward = true })[1]
	if not move_toml then return end

	local repo_found = 'aptos'
	for _, line in ipairs(vim.fn.readfile(move_toml)) do
		if line:match("MystenLabs/sui") then
			repo_found = 'sui'
			break
		end
	end

	vim.lsp.start({
		name = repo_found,
		cmd = { vim.fn.exepath(repo_found .. '-move-analyzer') },
		root_dir = vim.fs.dirname(move_toml),
		on_init = function(_, _)
			print(string.upper(repo_found) .. " Move LSP ready")
		end,
		on_error = print,
		on_attach = function(args)
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
end

main()
