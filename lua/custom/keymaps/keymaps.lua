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

-- Plugins

--Telescope
vim.keymap.set('n', 'r', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>p', ':lua require"telescope".extensions.project.project{}<CR>', { desc = '[S]earch [P]rojects' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- Neotree
key.set('n', '<leader>e', ':Neotree<cr>', { desc = 'Open Neotree' })

-- Colorschme
key.set({ 'n', 'v' }, '<leader>s', '<Esc>:Telescope colorscheme<cr>', { noremap = true, silent = true, desc = 'Choose a colorschme' })
