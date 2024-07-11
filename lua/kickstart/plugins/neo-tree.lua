-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    'echasnovski/mini.icons',
  },
  cmd = 'Neotree',
  keys = {
    { '<C-n>', ':Neotree toggle<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    close_if_last_window = true,
    enable_diagnostics = false,
    enable_git_status = false,
    use_popups_for_input = false, -- force use vim.input
    sort_case_insensitive = true,
    window = {
      mappings = {
        -- Disable neotree's fuzzy finder on `/`, it's annoying when I just want to jump to something I see
        ['/'] = 'noop',
        ['#'] = 'noop',
        -- Re-enable neotree's fuzzy finder using shifted letters so I can spam shift `/` + shift
        -- `f` to activate it, but still do shift `/` + `bla` to search `bla` with vim's search.
        ['/F'] = 'fuzzy_finder',
        ['//'] = 'fuzzy_finder', -- alt mapping, nicer?
        ['/D'] = 'fuzzy_finder_directory', -- only directories
      },
      fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
        ['<C-j>'] = 'move_cursor_down',
        ['<C-k>'] = 'move_cursor_up',
      },
    },
    git_status = {
      bind_to_cwd = false,
    },
    buffers = {
      bind_to_cwd = false,
    },
    filesystem = {
      use_libuv_file_watcher = true,
      bind_to_cwd = false,
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          'node_modules',
        },
      },
    },
  },
  -- config = {
  --   popup_border_style = 'rounded',
  --
  -- },
}
