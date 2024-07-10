return {
  'echasnovski/mini.icons',
  opts = {
    file = {
      ['.eslintrc.js'] = { glyph = '󰱺', hl = 'MiniIconsYellow' },
      ['.node-version'] = { glyph = '', hl = 'MiniIconsGreen' },
      ['.prettierrc'] = { glyph = '', hl = 'MiniIconsPurple' },
      ['.yarnrc.yml'] = { glyph = '', hl = 'MiniIconsBlue' },
      ['eslint.config.js'] = { glyph = '󰱺', hl = 'MiniIconsYellow' },
      ['package.json'] = { glyph = '', hl = 'MiniIconsGreen' },
      ['tsconfig.json'] = { glyph = '', hl = 'MiniIconsAzure' },
      ['tsconfig.build.json'] = { glyph = '', hl = 'MiniIconsAzure' },
      ['yarn.lock'] = { glyph = '', hl = 'MiniIconsBlue' },
    },
  },
  lazy = true,
  specs = {
    { 'nvim-tree/nvim-web-devicons', enabled = false, optional = true },
  },
  init = function()
    package.preload['nvim-web-devicons'] = function()
      require('mini.icons').mock_nvim_web_devicons()
      return package.loaded['nvim-web-devicons']
    end
  end,
}
