return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'mason-org/mason.nvim',
    'mason-org/mason-lspconfig.nvim',
    --Completions/hover for the Neovim Lua API itself when editing this config
    { 'folke/lazydev.nvim', ft = 'lua' },
  },

  config = function()
    require('mason').setup {
      ui = {
        check_outdated_packages_on_open = true,
        width = 0.9,
        height = 0.9,
        border = 'rounded',
        icons = {
          package_installed = ' ',
          package_pending = ' ',
          package_uninstalled = ' ',
        },
      },
    }

    require('lazydev').setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local servers = {
      ts_ls = {},

      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            -- Silences noisy warnings when a table doesn't declare every field of an annotated type
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },

      emmet_language_server = {
        filetypes = { 'html', 'eruby', 'htmldjango', 'javascriptreact', 'pug', 'typescriptreact', 'astro' },
      },

      cssls = {},

      biome = {
        filetypes = { 'svelte', 'vue', 'astro' },
      },
    }

    -- Install every server listed above if it isn't already.
    -- Hand each server its capabilities/settings/filetypes via vim.lsp.config
    require('mason-lspconfig').setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    for name, server in pairs(servers) do
      vim.lsp.config(name, {
        capabilities = capabilities,
        settings = server.settings,
        filetypes = server.filetypes,
      })
    end
  end,
}
