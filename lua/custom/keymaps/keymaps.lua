-- [[ Basic Keymaps ]]

local key = vim.keymap

key.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
key.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
key.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- LSP

-- find
key.set('n', '<leader>fs', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = '[F]ind All Reference[s]' })
key.set('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = 'Hover Symbol Information' })

key.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = '[G]oto [D]efinition' })
key.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = '[G]oto [D]eclration' })
key.set('n', 'td', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { desc = '[T]ype [D]efinition' })
key.set('n', 'gi', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { desc = '[G]oto [I]mplementation' })

key.set('n', '<leader>rs', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = '[R]ename [S]ymbol' })

key.set('n', '<leader>ca', 'vim.lsp.buf.code_action', { desc = '[C]ode [A]ction' })

-- Diagnostic keymaps
key.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
key.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
key.set('n', '<leader>gl', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
key.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Ctrl + s to save
key.set({ 'n', 'i' }, '<C-s>', '<cmd>write<cr>', { noremap = true, silent = true, desc = 'Save' })

-- Neotree
key.set('n', '<leader>e', '<cmd>Neotree<cr>', { desc = 'Op[e]n Neotree' })

-- nvim-notify

key.set('n', '<leader>nf', '<cmd>Telescope notify<cr>', { desc = '[N]oti[f]y History' })

-- Colorschme

key.set({ 'n', 'v' }, '<leader>s', '<cmd>Telescope colorscheme<cr>', { noremap = true, silent = true, desc = 'Choose a colorschme' })
