return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre', 'BufEnter *.*' },
  config = function()
    local conform = require 'conform'

    -- Reduce boilerplate by looping over the langs prettier supports.
    local prettier_langs = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'markdown',
      'css',
      'html',
    }
    local opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        sh = { 'shfmt' },
        json = { 'jq' },
        jsonc = { 'jq' },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = false,
      },
    }
    for _, lang in ipairs(prettier_langs) do
      opts.formatters_by_ft[lang] = { 'prettier' }
    end
    conform.setup(opts)
  end,
}
