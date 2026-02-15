return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  keys = {
    -- Zen Mode
    {
      "<leader>bz",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
      mode = "n",
    },
    -- Top Pickers & Explorer
    {
      ";f",
      function()
        Snacks.picker.files()
      end,
      desc = "Smart Find Files",
    },
    {
      ";r",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      ";e",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      ";t",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      ";;",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
  },
  opts = {
    image = {
      enabled = true,
    },
    picker = {
      smart = {
        mulit = { "buffers", "files" },
      },
      win = {
        input = {
          keys = {
            -- to close the picker on ESC instead of going to normal mode,
            -- add the following keymap to your config
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            -- I'm used to scrolling like this in LazyGit
            ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
            ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
          },
        },
      },
    },
    zen = {
      enabled = true,
      toggles = {
        dim = true,
        git_signs = false,
        diagnostics = false,
        line_number = false,
        relative_number = false,
        signcolumn = "no",
        indent = false,
      },
    },
  },
}
