return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    local neotree = require 'neo-tree'

    neotree.setup {
      close_if_last_window = true,
      window = {
        width = 26,
      },
      popup_border_style = 'rounded',
    }
  end,
}
