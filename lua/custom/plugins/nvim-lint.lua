return {
  'mfussenegger/nvim-lint',
  event = {
    'BufRead',
    'BufNewFile',
  },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      javascript = { 'biomejs' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    local lint_events = {
      'BufEnter',
      'BufWritePost',
      -- Might not work with all linters
      'InsertLeave',
      'TextChanged',
    }
    vim.api.nvim_create_autocmd(lint_events, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
