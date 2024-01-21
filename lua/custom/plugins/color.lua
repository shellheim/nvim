return {
  -- 'navarasu/onedark.nvim',
  'catppuccin/nvim',
  -- so it doesn't show up as 'nvim' in lazy.
  name = 'catppuccin',
  config = function()
    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

    local catppuccin = require 'catppuccin'
    catppuccin.setup {
      flavour = 'mocha',
      transparent_background = true,
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
