-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("i", "jk", "<Esc>")

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Split windows
map("n", "ss", ":split<CR>")
map("n", "sv", ":vsplit<CR>")

-- Remap exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Window management
map("n", "=", "<cmd>vertical resize +10<cr>", { desc = "Increase window height" })
map("n", "-", "<cmd>vertical resize -10<cr>", { desc = "Decrease window height" })
map("n", "+", "<cmd>horizontal resize +10<cr>", { desc = "Increade window width" })
map("n", "_", "<cmd>horizontal resize -10<cr>", { desc = "Decrease window width" })
map("n", "s=", "<C-w>=", { desc = "Make splits equal size" })
