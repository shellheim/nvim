-- [[ Basic Keymaps ]]

local key = vim.keymap

key.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move by visual line, not physical line, when wrapped
key.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
key.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Save
key.set({ 'n', 'i' }, '<C-s>', '<cmd>write<cr>', { silent = true, desc = 'Save' })

-- [[ LSP ]]
-- These call bare functions from vim.lsp.buf - they no-op harmlessly if no
-- LSP client is attached to the current buffer, so it's safe to keep them global.
key.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
key.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
key.set('n', 'gi', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation' })
key.set('n', 'td', vim.lsp.buf.type_definition, { desc = '[T]ype [D]efinition' })
key.set('n', '<leader>k', vim.lsp.buf.hover, { desc = 'Hover Symbol Information' })
key.set('n', '<leader>rf', vim.lsp.buf.references, { desc = '[F]ind All Reference[s]' })
key.set('n', '<leader>rs', vim.lsp.buf.rename, { desc = '[R]ename [S]ymbol' })
key.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
key.set('n', '<leader>cf', function()
  require('conform').format { async = true, lsp_fallback = true }
end, { desc = '[C]ode [F]ormat buffer' })

-- Diagnostics
key.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })
key.set('n', ']d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to next diagnostic message' })

key.set('n', '<leader>gl', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
key.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Neo-tree
key.set('n', '<leader>e', '<cmd>Neotree<cr>', { desc = 'Op[e]n Neotree' })
