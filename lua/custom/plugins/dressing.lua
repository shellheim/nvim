return {
  'stevearc/dressing.nvim',
  event = 'BufRead',
  config = function()
    local dressing = require 'dressing'
    dressing.setup {
      input = {
        relative = 'win',
      },
    }
  end,
}
