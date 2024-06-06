return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      sql = { 'sql_formatter' },
      mysql = { 'sql_formatter' },
      -- ['*'] = { 'codespell' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
    formatters = {
      sql_formatter = {
        -- This can be a string or a function that returns a string.
        -- When defining a new formatter, this is the only field that is required
        -- A list of strings, or a function that returns a list of strings
        -- Return a single string instead of a list to run the command in a shell
        inherit = false,
        command = 'sql-formatter',
        args = {
          '-l',
          'mysql',
          '--config',
          vim.fn.expand '~/.config/nvim/sqlformatter.json',
        },
        -- Send file contents to stdin, read new contents from stdout (default true)
        -- When false, will create a temp file (will appear in "$FILENAME" args). The temp
        -- file is assumed to be modified in-place by the format command.
        -- stdin = true,
      },
    },
    vim.keymap.set({ 'n', 'v' }, ',fc', function()
      require('conform').format { async = true, lsp_fallback = false }
    end),
  },
}
