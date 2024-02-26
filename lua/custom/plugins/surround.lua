return {
  'kylechui/nvim-surround',
  event = 'InsertEnter',
  config = function()
    local surround = require 'nvim-surround'
    surround.setup {}
  end,
}
