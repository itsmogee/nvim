return {
  'stevearc/dressing.nvim',
  event = "VeryLazy",
  opts = {
    input = {
      enabled = false,
      title_pos = "center",
      border = "rounded",
      relative = "win",
      -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      prefer_width = 40,
      width = nil,
      -- min_width and max_width can be a list of mixed types.
      -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
      max_width = { 140, 0.9 },
      min_width = { 20, 0.2 },

    },
    -- Options for built-in selector
    builtin = {
      -- Display numbers for options and set up keymaps
      show_numbers = true,
      -- These are passed to nvim_open_win
      border = "rounded",
      -- 'editor' and 'win' will default to being centered
      relative = "win",

      buf_options = {},
      win_options = {
        cursorline = true,
        cursorlineopt = "both",
      },
    }
  },
}
