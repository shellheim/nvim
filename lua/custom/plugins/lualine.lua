return {
  'nvim-lualine/lualine.nvim',
  event = { 'VeryLazy', 'BufEnter', 'BufRead' },

  config = function()
    local lualine = require 'lualine'

    -- Get the table of attached language servers.

    local format_clients = function(clients)
      -- Parse the retuned table
      local c = {}

      for _, client in pairs(clients) do
        table.insert(c, '[' .. client.name .. '] ')
      end
      return table.concat(c, '')
    end

    local lsp_clients = function()
      -- get lsp clients attched to current buffer
      local buffer = vim.api.nvim_get_current_buf()
      local clients = vim.lsp.get_active_clients { bufnr = buffer }

      -- if length of `client` tablie = 0, no clients were found
      if #clients == 0 then
        return 'LSP Inactive'
      end
      return format_clients(clients)
    end

    -- Get the table of attached formatters (could be linters too, e.g. shellcheck) from conform.nvim
    local formatters = function()
      local conform = require 'conform'
      local buffer = vim.api.nvim_get_current_buf()
      local formatters = conform.list_formatters(buffer)

      return format_clients(formatters)
    end

    -- Display attached language servers
    lualine.setup {
      options = {
        icons_enabled = true,
        theme = 'catppuccin-mocha',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          'alpha',
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { lsp_clients, formatters, 'fileformat', { 'filetype', icon_only = true } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
