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

      require('which-key').register {
        ['<leader>D'] = {
          name = '󰆼 Db Tools',
          s = { ':DBUI<cr>', ' DB UI' },
          u = { ':DBUIToggle<cr>', ' DB UI Toggle' },
          f = { '<cmd>DBUIFindBuffer<cr>', ' DB UI Find buffer' },
          r = { '<cmd>DBUIRenameBuffer<cr>', ' DB UI Rename buffer' },
          l = { '<cmd>DBUILastQueryInfo<cr>', ' DB UI Last query infos' },
        },
      }
    end,
  },
}
