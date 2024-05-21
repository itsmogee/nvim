-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

--NOTE: Load vim options before loading lazy
require 'custom.config.options'
require 'custom.config.keymaps'

-- NOTE: Here is where you can install your plugins.
require('lazy').setup({
  { import = 'custom.plugins' },
  { import = 'kickstart.plugins.indent_line' },
  { import = 'kickstart.plugins.debug' },
  -- { import = 'kickstart.plugins.lint' },
  { import = 'kickstart.plugins.autopairs' },
  { import = 'kickstart.plugins.neo-tree' },
  { import = 'kickstart.plugins.gitsigns' },
  -- NOTE: Use `opts = {}` to force a plugin to be loaded.
  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  -- For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
}, {})

-- NOTE: Set the Theme here
vim.cmd 'colorscheme gruvbox'
