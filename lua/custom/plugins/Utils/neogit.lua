return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  cmd = 'Neogit',
  keys = {
    {
      '<leader>go',
      ':Neogit <CR>',
      desc = "Neogit [O]pen",
    },
    {
      '<leader>gP',
      ':Neogit push<CR>',
      desc = "Neogit [P]ush",
    },
    {
      '<leader>gp',
      ':Neogit pull<CR>',
      desc = "Neogit [P]ull",
    },
    {
      '<leader>gb',
      ':Telescope git_branches<CR>',
      desc = "Git [B]ranches",
    },
  },
  opts = {
    signs = {
      item = { "+", "-" },
      section = { "", "" },
    },
    integrations = {
      diffview = true,
    },
  }
}
