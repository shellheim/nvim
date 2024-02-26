-- [[ Basic Keymaps ]]

local key = vim.keymap

key.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
key.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
key.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
key.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
key.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
key.set('n', '<leader>gl', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
key.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Ctrl + s to save
key.set({ 'n', 'i' }, '<C-s>', '<Esc>:w<cr>', { noremap = true, silent = true, desc = 'Save' })

-- Neotree
key.set('n', '<leader>e', ':Neotree<cr>', { desc = 'Open Neotree' })

-- Colorschme
key.set({ 'n', 'v' }, '<leader>s', '<Esc>:Telescope colorscheme<cr>', { noremap = true, silent = true, desc = 'Choose a colorschme' })
