return {
  {
    'tpope/vim-dadbod',
    lazy = true,
  },
  {
    'kristijanhusak/vim-dadbod-completion',
    ft = { 'sql', 'mysql' },
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
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
