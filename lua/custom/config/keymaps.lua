local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Noice dismiss notis
keymap.set('n', '<leader>un', ':Noice dismiss<CR>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Split windows
keymap.set('n', 'ss', ':split<CR>')
keymap.set('n', 'sv', ':vsplit<CR>')

--Tab commands
keymap.set('n', 'te', ':tabedit<Return>', opts)
keymap.set('n', '<tab>', ':tabnext<Return>', opts)
keymap.set('n', '<s-tab>', ':tabprev<Return>', opts)
keymap.set('n', 'tx', ':tabclose<Return>', opts)

-- Remap exit insert mode
keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

-- Increment / Decrement
keymap.set('n', '<leader>.', '<C-a>', { desc = 'Increment a number' })
keymap.set('n', '<leader>,', '<C-x>', { desc = 'Decrement a number' })

-- Window management
keymap.set('n', '=', '<cmd>vertical resize +10<cr>', { desc = 'Increase window height' })
keymap.set('n', '-', '<cmd>vertical resize -10<cr>', { desc = 'Decrease window height' })
keymap.set('n', '+', '<cmd>horizontal resize +10<cr>', { desc = 'Increade window width' })
keymap.set('n', '_', '<cmd>horizontal resize -10<cr>', { desc = 'Decrease window width' })
keymap.set('n', 's=', '<C-w>=', { desc = 'Make splits equal size' })

-- Alpha Dashboard
keymap.set('n', '<leader>a', ':Alpha<CR>', { desc = 'Alpha Dashboard' })
