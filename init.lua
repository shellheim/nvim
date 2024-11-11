-- Set <space> as the leader key.int
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
-- This list only contains trivial (to setup) plugins
local plugins = {
  { 'tpope/vim-fugitive', event = 'BufRead' },
  { 'tpope/vim-rhubarb', event = 'BufRead' },
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Highlight TODOs
  { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = {} },
  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>g', group = '[G]it' },
        { '<leader>h', group = 'More git' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
      }
    end,
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      -- disable scope
      scope = {
        show_start = false,
        show_end = false,
      },
    },
  },

  -- Add rainbow brackets
  {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'
      ---@type rainbow_delimiters.config
      vim.g.rainbow_delimiters = {
        blacklist = { 'html' },
      }
    end,
    event = { 'BufRead', 'Bufenter *.*' },
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    event = 'BufRead',
    opts = {
      toggler = {
        line = '<c-/>',
      },
      opleader = {
        line = '<c-/>',
      },
    },
  },

  -- Import the user-installed plugins
  { import = 'custom/plugins' },
}

local lazy_settings = {
  defaults = {
    lazy = true,
  },
  ui = {
    size = { width = 0.9, height = 0.9 },
    wrap = true, -- wrap the lines in the ui
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = 'rounded',
  },
  performance = {
    cache = {
      enabled = true,
      -- Once one of the following events triggers, caching will be disabled.
      -- To cache all modules, set this to `{}`, but that is not recommended.
      disable_events = { 'UIEnter', 'BufReadPre' },
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and the config directory
    },
  },
}

-- Addtional Configuration before lazy cause nvim-notify is weird
require 'custom.conf'

require('lazy').setup(plugins, lazy_settings)

-- Keymaps
require 'custom.keymaps.keymaps'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
