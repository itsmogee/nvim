return {
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>ut', ':UndotreeToggle<CR>', { desc = 'Undo Tree' })
      vim.opt.undodir = (os.getenv 'HOME') .. '/.config/undoDir'
    end,
  },
  {
    'debugloop/telescope-undo.nvim',
    dependencies = { -- note how they're inverted to above example
      {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
      },
    },
    keys = {
      { -- lazy style key map
        '<leader>uT',
        '<cmd>Telescope undo<cr>',
        desc = 'Telescope Undo history',
      },
    },
    opts = {
      extensions = {
        undo = {
          side_by_side = true,
          layout_strategy = 'horizontal',
          layout_config = {
            height = 0.8,
          },
        },
      },
    },
    config = function(_, opts)
      -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
      -- configs for us. We won't use data, as everything is in it's own namespace (telescope
      -- defaults, as well as each extension).
      require('telescope').setup(opts)
      require('telescope').load_extension 'undo'
    end,
  },
}
