return {
  {
    -- "Repo"
    'akinsho/toggleterm.nvim',
    lazy = true,
    cmd = { 'ToggleTerm' },
    keys = {
      {
        '<leader>ti',
        '<cmd>ToggleTerm<cr>',
        desc = 'ToggleTerm (float root_dir)',
      },
      {
        '<leader>tn',
        '<cmd>ToggleTermSetName<cr>',
        desc = 'Set term name',
      },
    },
    opts = {
      open_mapping = [[<c-\>]],
      hide_numbers = false, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      direction = 'float',
      -- direction = "horizontal" or "vertical" or "window" or "float",
      close_on_exit = true, -- close the terminal window when the process exits
    },
  },
}
