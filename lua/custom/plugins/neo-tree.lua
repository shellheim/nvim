return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    -- Diagnostic signs

    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })

    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })

    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })

    vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

    local neotree = require 'neo-tree'

    neotree.setup {
      close_if_last_window = true,
      window = {
        width = 26,
      },
      popup_border_style = 'rounded',

      -- Git signs
    }
  end,
}
