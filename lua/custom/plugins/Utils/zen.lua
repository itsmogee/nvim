return -- Lua
{
  'folke/zen-mode.nvim',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    window = {
      backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      width = 70,
    },
    plugins = {
      tmux = true,
    },
  },
  config = function()
    vim.cmd 'autocmd VimEnter * hi ZenBg ctermbg=None guibg=None'
  end,
}
