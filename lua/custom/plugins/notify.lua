return {
  -- Use nvim-notify for lsp updates
  'mrded/nvim-lsp-notify',
  lazy = false,
  dependencies = {
    'rcarriga/nvim-notify',
    config = function()
      local notify = require 'notify'

      notify.setup {
        background_colour = '#000000',
      }

      vim.notify = notify
    end,
  },
  opts = {},
}
