return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    'BufReadPre '
      .. vim.fn.expand '~'
      .. '/Documents/Obsidian Vault/**.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/Documents/Obsidian Vault/**.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ['<cr>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
      -- Toggle check-boxes.
      ['<leader>oc'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true, desc = 'Toggle checkbox' },
      },
      ['<leader>oo'] = {
        action = '<cmd>ObsidianOpen<CR>',
        opts = { buffer = true, desc = 'Open Obsidian App' },
      },
      ['<leader>ot'] = {
        action = '<cmd>ObsidianTemplate<CR>',
        opts = { buffer = true, desc = 'Insert Obsidian Template' },
      },
      ['<leader>ob'] = {
        action = '<cmd>ObsidianBacklinks<CR>',
        opts = { buffer = true, desc = 'Show Obsidian Backlinks' },
      },
      ['<leader>ol'] = {
        action = '<cmd>ObsidianLinks<CR>',
        opts = { buffer = true, desc = 'Show Obsidian Links' },
      },
      ['<leader>on'] = {
        action = '<cmd>ObsidianNew<CR>',
        opts = { buffer = true, desc = 'Create New Note' },
      },
      ['<leader>os'] = {
        action = '<cmd>ObsidianSearch<CR>',
        opts = { buffer = true, desc = 'Search Obsidian Notes' },
      },
      ['<leader>oq'] = {
        action = '<cmd>ObsidianQuickSwitch<CR>',
        opts = { buffer = true, desc = 'Quick Switch Notes' },
      },
    },
    workspaces = {
      {
        name = 'personal',
        path = '~/Documents/Obsidian Vault/',
      },
    },
    -- see below for full list of options 👇
    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ''
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. '-' .. suffix
    end,

    -- Optional, customize how note file names are generated given the ID, target directory, and title.
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      -- This is equivalent to the default behavior.
      local path = spec.dir / tostring(spec.id)
      return path:with_suffix '.md'
    end,
  },

  completion = {
    nvim_cmp = true,
    -- Trigger completion at 2 chars
    min_chars = 2,
  },
}
