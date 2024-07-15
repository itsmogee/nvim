return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    { 'nvim-telescope/telescope-file-browser.nvim' },
  },
  keys = {
    { ';t', '<cmd> Telescope help_tags <CR>', { desc = '[S]earch [H]elp' } },
    { ';k', '<cmd> Telescope keymaps <CR>', { desc = '[S]earch [K]eymaps' } },
    { ';f', '<cmd> Telescope find_files <CR>', { desc = '[S]earch [F]iles' } },
    { ';h', '<cmd> Telescope highlights <CR>', { desc = '[S]earch [H]ighlights' } },
    { '<leader>ss', '<cmd> Telescope builtin <CR>', { desc = '[S]earch [S]elect Telescope' } },
    { '<leader>sw', '<cmd> Telescope grep_string <CR>', { desc = '[S]earch current [W]ord' } },
    { ';g', '<cmd>Telescope live_grep <CR>', { desc = '[S]earch by [G]rep' } },
    { '<leader>sd', '<cmd>Telescope diagnostics <CR>', { desc = '[S]earch [D]iagnostics' } },
    { ';r', '<cmd>Telescope resume <CR>', { desc = '[S]earch [R]esume' } },
    { ';s.', '<cmd>Telescope oldfiles <CR>', { desc = '[S]earch Recent Files ("." for repeat)' } },
    { ';;', '<cmd>Telescope buffers <CR>', { desc = '[ ] Find existing buffers' } },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    local action_layout = require 'telescope.actions.layout'
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      defaults = {
        wrap_results = false,
        layout_strategy = 'horizontal',
        layout_config = { prompt_position = 'top' },
        sorting_strategy = 'ascending',
        windblend = 0,
        prompt_prefix = '󰆈 ',
        selection_caret = ' ',
        multi_icon = ' ',
        mappings = {
          n = {
            ['<M-p>'] = action_layout.toggle_preview,
          },
          i = {
            ['<M-p>'] = action_layout.toggle_preview,
          },
        },
      },
      pickers = {
        diagnostics = {
          theme = 'ivy',
          initial_mode = 'normal',
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        file_browser = {
          theme = 'dropdown',
          -- disables netw and use telescope file browser in its place
          hijack_netrw = true,
          mappings = {
            ['n'] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'file-browser')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', 'sf', function()
      local telescope = require 'telescope'
      local function telescope_buffer_dir()
        return vim.fn.expand '%:p:h'
      end

      telescope.extensions.file_browser.file_browser {
        path = '%:p:h',
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = true,
        initial_mode = 'normal',
        layout_config = { height = 50 },
      }
    end)

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
