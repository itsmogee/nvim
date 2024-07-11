return { -- LSP Configuration & Plugins
  {
    'williamboman/mason.nvim',
    dependencies = 'williamboman/mason-lspconfig.nvim',
    config = function() -- NOTE: Must be loaded before dependants
      -- import mason
      local mason = require 'mason'

      -- import mason-lspconfig
      local mason_lsp

      -- enable mason and configure icons
      mason.setup {
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      }
    end,
  },
  {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls',
          'biome',
          'html',
          'pyright',
          'rust_analyzer',
          'tailwindcss',
          'tsserver',
          'jdtls',
          'cssls',
          'emmet_ls',
          'marksman',
          'sqls',
        },

        -- auto-install configured servers (with lspconfig)
        automatic_installation = true, --not the same as ensure_installed
      }
    end,
  },
}
