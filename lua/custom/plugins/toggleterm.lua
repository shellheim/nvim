return {
  'akinsho/toggleterm.nvim',

  config = function()
    local toggleterm = require 'toggleterm'

    toggleterm.setup {
      autochdir = true,
      direction = 'float',

      float_opts = {
        border = 'curved',
      },
      open_mapping = [[<c-/>]],
    }
  end,
}
