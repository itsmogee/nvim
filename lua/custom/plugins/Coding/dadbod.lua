return {
  {
    'tpope/vim-dadbod',
    lazy = true,
  },
  {
    'kristijanhusak/vim-dadbod-completion',
    ft = { 'sql', 'mysql' },
    lazy = true,
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      {
        { 'tpope/vim-dadbod' },
        { 'kristijanhusak/vim-dadbod-completion' },
      },
    },
    cmd = {
      'DBUI',
      'DBUITOGGLE',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- your dbui configuration
      vim.g.db_ui_show_help = 0
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_use_nvim_notify = 1

      require('which-key').add {
        { '<leader>D', group = '󰆼 Db Tools' },
        { '<leader>Df', '<cmd>DBUIFindBuffer<cr>', desc = ' DB UI Find buffer' },
        { '<leader>Dl', '<cmd>DBUILastQueryInfo<cr>', desc = ' DB UI Last query infos' },
        { '<leader>Dr', '<cmd>DBUIRenameBuffer<cr>', desc = ' DB UI Rename buffer' },
        { '<leader>Ds', ':DBUI<cr>', desc = ' DB UI' },
        { '<leader>Du', ':DBUIToggle<cr>', desc = ' DB UI Toggle' },
      }
    end,
  },
}
