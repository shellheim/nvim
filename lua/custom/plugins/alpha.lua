return {
  'goolord/alpha-nvim',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'shellheim/ashaar.nvim',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local ashaar = require 'ashaar'
    -- Set header
    dashboard.section.header.val = {
      '███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ',
      '███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ',
      '███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ',
      '███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ',
      '███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ',
      '███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ',
      '███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ',
      ' ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ',
    }
    dashboard.section.buttons.val = {
      dashboard.button('n', ' > New File', '<cmd>ene<CR>'),
      dashboard.button('f', '󰱼 > Find Files', '<cmd>Telescope find_files<CR>'),
      dashboard.button('r', ' > Find Recent Files', '<cmd>Telescope oldfiles<CR>'),
      dashboard.button('p', ' > Find Projects', '<cmd>Telescope project<CR>'),
      dashboard.button('c', ' > Configuration', '<cmd>edit ~/.config/nvim/init.lua<CR>'),
      dashboard.button('q', ' > Quit NVIM', '<cmd>qa<CR>'),
    }
    dashboard.section.footer.val = ashaar()
    alpha.setup(dashboard.opts)
    -- To benchmark startup time and lazy loading
    vim.api.nvim_create_autocmd('User', {
      callback = function()
        local stats = require('lazy').stats()
        local ms = math.floor(stats.startuptime * 100) / 100
        dashboard.section.footer.val = '󱐌 Lazy-loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
