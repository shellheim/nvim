return {
  'nvimtools/none-ls.nvim', -- configure formatters & linters
  -- event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
  -- [[dependencies = {
  --   'jay-babu/mason-null-ls.nvim',
  -- },
  config = function()
    -- local mason_null_ls = require 'mason-null-ls'

    local null_ls = require 'null-ls'

    -- local null_ls_utils = require 'null-ls.utils'

    -- for conciseness
    local formatting = null_ls.builtins.formatting -- to set up formatters
    local diagnostics = null_ls.builtins.diagnostics -- to set up linters

    -- to set up format on save
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    -- configure null_ls
    null_ls.setup {
      -- setup formatters & linters
      sources = {
        formatting.stylua,
        formatting.prettier,
        formatting.shfmt,

        -- diagnostics
        diagnostics.jsonlint.with {
          extra_filetypes = { 'jsonc' },
        },
      },
      -- configure format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format {
                filter = function(client)
                  --  only use null-ls for formatting instead of lsp server
                  return client.name == 'null-ls'
                end,
                bufnr = bufnr,
              }
            end,
          })
        end
      end,
    }
  end,
}
