return {
  'rcarriga/nvim-notify',
  opts = {
    background_colour = '#000000',
    vim.keymap.set('n', ';n', ':Telescope notify<CR>'),
    render = 'simple',
    stages = 'fade',
  },
}
