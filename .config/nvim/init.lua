-- Plugins: kickstart.nvim
-- Structure: https://github.com/ntk148v/neovim-config

if vim.fn.has('nvim-0.8') == 0 then
  error('You need Neovim 0.8+ in order to use this config')
end

for _, cmd in ipairs({ "git", "rg" }) do
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

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
