return {
  'catppuccin/nvim',
  lazy = false,
  -- so it doesn't show up as 'nvim' in lazy.
  name = 'catppuccin',
  priority = 1000,
  config = function()
    local catppuccin = require 'catppuccin'
    catppuccin.setup {
      flavour = 'latte',
      transparent_background = true,
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
