return {
  'NvChad/nvim-colorizer.lua',
  event = 'BufRead',
  config = function()
    local colorizer = require 'colorizer'
    colorizer.setup {
      filetypes = { 'html', 'css', 'jsx', 'tsx', 'scss', 'sass', 'toml', 'yaml' },
    }
  end,
}
