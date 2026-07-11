-- Small, low-effort plugins that don't need their own dedicated file.
-- Keeps init.lua limited to bootstrapping lazy.nvim.
return {
  { 'tpope/vim-fugitive', event = 'BufRead' },
  { 'tpope/vim-rhubarb', event = 'BufRead' },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

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
}
