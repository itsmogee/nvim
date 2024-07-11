return {
  {
    -- NOTE: Yes, you can install new plugins here!
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    -- NOTE: And you can specify dependencies as well
    dependencies = {
      -- Creates a beautiful debugger UI
      'rcarriga/nvim-dap-ui',

      -- Required dependency for nvim-dap-ui
      'nvim-neotest/nvim-nio',

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      -- Add your own debuggers here
      'leoluz/nvim-dap-go',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('mason-nvim-dap').setup {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {
          function(config)
            require('mason-nvim-dap').default_setup(config)
          end,
          python = function(config)
            config.adapters = {
              type = 'executable',
              command = '/home/mogee/anaconda3/bin/python3',
              args = {
                '-m',
                'debugpy.adapter',
              },
            }
            require('mason-nvim-dap').default_setup(config)
          end,
        },

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          'delve',
          'python',
          'js',
          'codelldb',
        },
      }

      local map = function(keys, func, desc)
        if desc then
          desc = '[D]ebugger: ' .. desc
        end
        if keys then
          keys = '<leader>d' .. keys
        end
        vim.keymap.set('n', keys, func, { desc = desc })
      end

      -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
      -- vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })
      map('u', function()
        dapui.toggle { reset = true }
      end, 'Toggle [U]I')

      -- Basic debugging keymaps, feel free to change to your liking!
      map('s', dap.continue, '[S]tart/Continue')
      map('i', dap.step_into, 'Step [I]nto')
      map('o', dap.step_out, 'Step [O]ut')
      map('b', dap.toggle_breakpoint, 'Toggle [B]reakpoint')
      map('B', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, 'Debug: Set Breakpoint')

      map('a', function()
        require('dap').continue { before = get_args }
      end, 'Run with Args')
      map('C', function()
        require('dap').run_to_cursor()
      end, 'Run to Cursor')
      map('g', function()
        require('dap').goto_()
      end, 'Go to Line (No Execute)')
      map('j', function()
        require('dap').down()
      end, 'Down')
      map('k', function()
        require('dap').up()
      end, 'Up')
      map('l', function()
        require('dap').run_last()
      end, 'Run Last')
      map('O', function()
        require('dap').step_over()
      end, 'Step Over')
      map('p', function()
        require('dap').pause()
      end, 'Pause')
      map('r', function()
        require('dap').repl.toggle()
      end, 'Toggle REPL')
      map('s', function()
        require('dap').session()
      end, 'Session')
      map('t', function()
        require('dap').terminate()
      end, 'Terminate')
      map('w', function()
        require('dap.ui.widgets').hover()
      end, 'Widgets')

      -- Dap UI setup
      -- For more information, see |:help nvim-dap-ui|
      dapui.setup {
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '',
            play = '',
            step_into = '󰆹',
            step_over = '󰆷',
            step_out = '󰆸',
            step_back = '',
            run_last = '▶▶',
            terminate = '',
            disconnect = '',
          },
        },
      }

      local dapicons = {
        Stopped = { '󰁕 ', 'DiagnosticWarn', 'DapStoppedLine' },
        Breakpoint = ' ',
        BreakpointCondition = ' ',
        BreakpointRejected = { ' ', 'DiagnosticError' },
        LogPoint = '.>',
      }

      for name, sign in pairs(dapicons) do
        sign = type(sign) == 'table' and sign or { sign }
        vim.fn.sign_define('Dap' .. name, { text = sign[1], texthl = sign[2] or 'DiagnosticInfo', linehl = sign[3], numhl = sign[3] })
      end

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      -- Install golang specific config
      require('dap-go').setup {
        delve = {
          -- On Windows delve must be run attached or it crashes.
          -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
          detached = vim.fn.has 'win32' == 0,
        },
      }
      local debuggerPath = vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js'
      local debuggerCmd = { 'js-debug-adapter' }

      if not dap.adapters['pwa-node'] then
        require('dap').adapters['pwa-node'] = {
          type = 'server',
          host = 'localhost',
          port = '${port}',
          executable = {
            command = 'node',
            -- 💀 Make sure to update this path to point to your installation
            args = {
              debuggerPath,
              '${port}',
            },
          },
        }
      end

      if not dap.adapters['node'] then
        dap.adapters['node'] = function(cb, config)
          if config.type == 'node' then
            config.type = 'pwa-node'
          end
          local nativeAdapter = dap.adapters['pwa-node']
          if type(nativeAdapter) == 'function' then
            nativeAdapter(cb, config)
          else
            cb(nativeAdapter)
          end
        end
      end

      local js_filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }
      local vscode = require 'dap.ext.vscode'
      vscode.type_to_filetypes['node'] = js_filetypes
      vscode.type_to_filetypes['pwa-node'] = js_filetypes

      for _, language in ipairs(js_filetypes) do
        if not dap.configurations[language] then
          dap.configurations[language] = {
            {
              type = 'pwa-node',
              request = 'launch',
              name = 'Launch file',
              program = '${file}',
              cwd = '${workspaceFolder}',
            },
            {
              type = 'pwa-node',
              request = 'attach',
              name = 'Attach',
              processId = require('dap.utils').pick_process,
              cwd = '${workspaceFolder}',
            },
          }
        end
      end

      -- C/C++ Debugger
      if not dap.adapters['codelldb'] then
        require('dap').adapters['codelldb'] = {
          type = 'server',
          host = 'localhost',
          port = '${port}',
          executable = {
            command = 'codelldb',
            args = {
              '--port',
              '${port}',
            },
          },
        }
      end
      for _, lang in ipairs { 'c', 'cpp' } do
        dap.configurations[lang] = {
          {
            type = 'codelldb',
            request = 'launch',
            name = 'Launch file',
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
          },
          {
            type = 'codelldb',
            request = 'attach',
            name = 'Attach to process',
            pid = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
          },
        }
      end
    end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    opts = {},
  },
}
