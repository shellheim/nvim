return {
  'NvChad/nvim-colorizer.lua',
  event = 'VeryLazy',
  config = function()
    local colorizer = require 'colorizer'
    colorizer.setup {
      filetypes = { 'html', 'css', 'jsx', 'tsx', 'scss', 'sass' },
    }
  end,
}
