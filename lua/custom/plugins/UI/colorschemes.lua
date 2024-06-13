return {
  {
    'sainnhe/gruvbox-material',
    lazy = true,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    opts = ...,
    config = function()
      require('gruvbox').setup {
        transparent_mode = true,
        overrides = {
          DiffAdd = { fg = '#b8bb26', bg = 'None' },
          DiffChange = { fg = '#83a598', bg = 'None' },
          DiffDelete = { fg = '#fb4934', bg = 'None' },
          ['@markup.heading.1.markdown'] = { fg = '#fb4934', bg = 'None', bold = true },
          ['@markup.heading.2.markdown'] = { fg = '#fe8019', bg = 'None', bold = true },
          ['@markup.heading.3.markdown'] = { fg = '#d3869b', bg = 'None', bold = true },
          ['@markup.heading.4.markdown'] = { fg = '#8ec07c', bg = 'None', bold = true },
          ['@markup.heading.5.markdown'] = { fg = '#83a598', bg = 'None', bold = true },
          ['@markup.heading.6.markdown'] = { fg = '#b8bb26', bg = 'None', bold = true },
        },
      }
    end,
  },
  {

    -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.o.background = 'dark'
      -- vim.cmd.colorscheme 'gruvbox'

      -- You can configure highlights by doing something like:
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'catppuccin/nvim',
    priority = 1000,
    name = 'catppuccin',
  },
}
