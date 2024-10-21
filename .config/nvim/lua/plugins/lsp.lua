return {
	-- LSP Configuration & Plugins
	'neovim/nvim-lspconfig',
	event = 'VeryLazy',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',

		-- Useful status updates for LSP
		{ "j-hui/fidget.nvim", event = "LspAttach", opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		{ 'folke/neodev.nvim', opts = {} },
	},
	config = function(_, opts)
		local telescope = require('telescope.builtin')

		local on_attach = function(_, bufnr)
			local nmap = function(keys, func, desc)
				vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
			end

			nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
			nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')
			nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
			nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
			nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
			nmap('gr', telescope.lsp_references, '[G]oto [R]eferences')
			nmap('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')

			vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
				vim.lsp.buf.format()
			end, { desc = 'Format current buffer with LSP' })
		end

		local servers = {
			-- clangd = {},
			gopls = {},
			pyright = {
				python = {
					analysis = {
						autoSearchPaths = true,
						typeCheckingMode = 'off',
					},
				},
			},
			rust_analyzer = {},
			ts_ls = {},
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		}

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

		-- Setup mason so it can manage external tooling
		require('mason').setup()
		require('mason-lspconfig').setup {
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name)
					require('lspconfig')[server_name].setup {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name],
					}
				end,
			}
		}

		return opts
	end
}
