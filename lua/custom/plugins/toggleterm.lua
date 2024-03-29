return {
  'akinsho/toggleterm.nvim',
  event = { 'BufRead', 'BufEnter' },

  config = function()
    local toggleterm = require 'toggleterm'

    toggleterm.setup {
      autochdir = true,
      direction = 'float',

      float_opts = {
        border = 'curved',
      },
      open_mapping = [[<c-p>]],
    }
  end,
}
