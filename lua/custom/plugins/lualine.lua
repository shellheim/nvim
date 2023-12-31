return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',

  config = function()
    local lualine = require 'lualine'

    -- Get the table of attached buffers.

    local clients_lsp = function()
      -- gets the current buffer id
      local buffer = vim.api.nvim_get_current_buf()
      -- uses the `buffer` variable as parameter for property `bufner` to get attached lsp clients
      local clients = vim.lsp.get_active_clients { bufnr = buffer }

      if vim.tbl_isempty(clients) then
        return 'LSP Inactive'
      end
      -- Parse the retuned table
      local c = {}

      for _, client in pairs(clients) do
        -- if client.name ~= 'null-ls' then
        --   clients[#clients + 1] = client.name
        -- end

        table.insert(c, '[' .. client.name .. '] ')
        -- local formatters = require 'vim.lsp.null-ls'
      end
      return table.concat(c, '')
    end

    -- Display attached lsp servers
    lualine.setup {
      options = {
        icons_enabled = true,
        theme = 'catppuccin-mocha',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { clients_lsp, 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
