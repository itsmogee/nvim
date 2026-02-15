return {
  {
    -- "Repo"
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = { "ToggleTerm" },
    keys = function(_, keys)
      local function toggleterm()
        local venv = vim.b["virtual_env"]
        local term = require("toggleterm.terminal").Terminal:new({
          env = venv and { VIRTUAL_ENV = venv } or nil,
          count = vim.v.count > 0 and vim.v.count or 1,
        })
        term:toggle()
      end
      local mappings = {
        { "<C-/>", mode = { "n", "t" }, toggleterm, desc = "Toggle Terminal" },
        { "<C-_>", mode = { "n", "t" }, toggleterm, desc = "which_key_ignore" },
      }
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      open_mapping = [[<c-\>]],
      hide_numbers = false, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      direction = "float",
      float_opts = {
        border = "curved",
      },
      -- direction = "horizontal" or "vertical" or "window" or "float",
      close_on_exit = true, -- close the terminal window when the process exits
      shell = "/usr/bin/fish",
    },
  },
}
