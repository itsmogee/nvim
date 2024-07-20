return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    -- Function to check spelling status and determine background color
    local function spell_status()
      if vim.wo.spell then
        return 'Spell: On'
      else
        return 'Spell: Off'
      end
    end

    -- Function to determine the background color based on spelling status
    local function spell_bg_color()
      if vim.wo.spell then
        return '#37f499' -- Green for spell on
      else
        return '#f16c75' -- Red for spell off
      end
    end

    require('lualine').setup {
      options = {
        theme = 'gruvbox-material',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        globalstatus = true,
        disabled_filetypes = {
          statusline = { 'alpha' },
          winbar = { 'alpha' },
        },
      },

      sections = {
        lualine_x = {
          {
            spell_status,
            color = function()
              local fg_color = '#212337' -- Foreground color for the text
              return { fg = fg_color, bg = spell_bg_color(), gui = 'bold' }
            end,
            separator = { left = '', right = '█ ' },
            padding = 0,
          },
          {
            function()
              return '  ' .. require('dap').status()
            end,
            cond = function()
              return package.loaded['dap'] and require('dap').status() ~= ''
            end,
            -- color = function() return LazyVim.ui.fg("Debug") end,
          },
          -- stylua: ignore
        },
        lualine_y = {
          { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
          { 'location', padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return ' ' .. os.date '%R'
          end,
        },
      },
    }
  end,
}
