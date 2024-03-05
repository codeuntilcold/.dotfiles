-- Plugins: kickstart.nvim
-- Structure: https://github.com/ntk148v/neovim-config

if vim.fn.has('nvim-0.8') == 0 then
  error('You need Neovim 0.8+ in order to use this config')
end

local binaries = { "git", "rg" }

for _, cmd in ipairs(binaries) do
  local name = type(cmd) == "string" and cmd or vim.inspect(cmd)
  local commands = type(cmd) == "string" and { cmd } or cmd
  ---@cast commands string[]
  local found = false

  for _, c in ipairs(commands) do
    if vim.fn.executable(c) == 1 then
      name = c
      found = true
    end
  end

  if not found then
    error(("`%s` is not installed"):format(name))
  end
end

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config")


-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function(_)
--     vim.lsp.start({
--       name = 'sui',
--       cmd = { '/Users/vpn/.cargo/bin/sui-move-analyzer' },
--       root_dir = vim.fs.dirname(vim.fs.find({ 'Move.toml' }, { upward = true })[1]),
--     })
--   end
-- })

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(args)
--     print('somehow this is in')
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
--   end,
-- })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
