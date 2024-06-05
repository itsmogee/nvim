-- statuslline
local ICONS = {
  misc = {
    dots = '󰇘',
  },
  dap = {
    Stopped = { '󰁕 ', 'DiagnosticWarn', 'DapStoppedLine' },
    Breakpoint = ' ',
    BreakpointCondition = ' ',
    BreakpointRejected = { ' ', 'DiagnosticError' },
    LogPoint = '.>',
  },
  diagnostics = {
    Error = ' ',
    Warn = ' ',
    Hint = ' ',
    Info = ' ',
  },
  git = {
    added = ' ',
    modified = ' ',
    removed = ' ',
  },
  kinds = {
    Array = ' ',
    Boolean = '󰨙 ',
    Class = ' ',
    Codeium = '󰘦 ',
    Color = ' ',
    Control = ' ',
    Collapsed = ' ',
    Constant = '󰏿 ',
    Constructor = ' ',
    Copilot = ' ',
    Enum = ' ',
    EnumMember = ' ',
    Event = ' ',
    Field = ' ',
    File = ' ',
    Folder = ' ',
    Function = '󰊕 ',
    Interface = ' ',
    Key = ' ',
    Keyword = ' ',
    Method = '󰊕 ',
    Module = ' ',
    Namespace = '󰦮 ',
    Null = ' ',
    Number = '󰎠 ',
    Object = ' ',
    Operator = ' ',
    Package = ' ',
    Property = ' ',
    Reference = ' ',
    Snippet = ' ',
    String = ' ',
    Struct = '󰆼 ',
    TabNine = '󰏚 ',
    Text = ' ',
    TypeParameter = ' ',
    Unit = ' ',
    Value = ' ',
    Variable = '󰀫 ',
  },
}

return {
  {
    'b0o/incline.nvim',
    event = 'BufReadPre',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    priority = 1300,
    config = function()
      local colors = require('gruvbox').palette
      require('incline').setup {
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.dark0_hard, guifg = colors.light0 },
            InclineNormalNC = { guibg = 'None', guifg = colors.light0 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          local ft_icon, ft_color = require('nvim-web-devicons').get_icon_color(filename)
          local modified = vim.bo[props.buf].modified and 'bold,italic' or 'bold'
          if vim.bo[props.buf].modified then
            filename = '[+]' .. filename
          end
          -- local modified = vim.api.nvim_get_option_value('modified', { buf = props.buf }) and 'bold,italic' or 'bold'

          local function get_git_diff()
            local icons = { removed = ICONS.git.removed, changed = ICONS.git.modified, added = ICONS.git.added }
            icons['changed'] = ICONS.git.modified
            local signs = vim.b[props.buf].gitsigns_status_dict
            local labels = {}
            if signs == nil then
              return labels
            end
            for name, icon in pairs(icons) do
              if tonumber(signs[name]) and signs[name] > 0 then
                table.insert(labels, { icon .. signs[name] .. ' ', group = 'Diff' .. name })
              end
            end
            if #labels > 0 then
              table.insert(labels, { '󰇝 ', guifg = colors.light0 })
            end

            -- if #labels > 0 then
            --   table.insert(labels, { ' 󰊢 ' .. signs.n_ranges .. ' ┊' })
            -- end
            return labels
          end

          local function get_diagnostic_label()
            local icons = { error = '', warn = '', info = '', hint = '' }
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              if n > 0 then
                table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
              end
            end
            if #label > 0 then
              table.insert(label, { '󰇝 ', guifg = colors.light0 })
            end
            return label
          end

          local buffer = {
            { get_diagnostic_label() },
            { get_git_diff() },
            -- { get_mini_diff() },
            { (ft_icon or '') .. ' ', guifg = colors.bright_yellow, guibg = 'none' },
            { filename .. ' ', gui = modified, guifg = colors.bright_yellow },
            { '󰇝 ', guifg = colors.light0 },
            { ' ' .. vim.api.nvim_win_get_number(props.win), guifg = colors.bright_purple },
          }
          return buffer
        end,
      }
    end,
  },
}
