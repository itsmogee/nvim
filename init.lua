-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Your custom Kitty autocommands can go here or in lua/config/autocmds.lua
if vim.env.KITTY_WINDOW_ID then
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      vim.fn.system({ "kitty", "@", "set-spacing", "padding=0" })
    end,
  })

  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      vim.fn.system({ "kitty", "@", "set-spacing", "padding=default" })
    end,
  })
end
