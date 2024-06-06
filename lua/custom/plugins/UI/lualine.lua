return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'gruvbox-material',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        globalstatus = true,
        disabled_filetypes = {
          statusline = { 'alpha' },
          winbar = { 'alpha' },
        },
      },

      sections = {
        lualine_x = {
          {
            require('noice').api.statusline.mode.get,
            cond = require('noice').api.statusline.mode.has,
            color = { fg = '#ff9e64' },
          },
          -- 'encoding',
          'fileformat',
          'filetype',
        },
      },
    }
  end,
}
