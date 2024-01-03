return {
  'jinh0/eyeliner.nvim',

  config = function()
    local eyeliner = require 'eyeliner'
    eyeliner.setup {
      highlight_on_key = true,
      dim = false,
    }
    vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg = '#faa700', bold = true, underline = true })
    vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg = '#faf600', underline = true })
  end,
}
