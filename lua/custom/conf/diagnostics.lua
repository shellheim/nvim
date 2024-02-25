vim.diagnostic.config { virtual_text = false }
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    local opts = {
      close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})
