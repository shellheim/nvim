return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'BufRead',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },

    -- Adds LSP completion capabilities
    { 'hrsh7th/cmp-nvim-lsp' },

    -- Adds a number of user-friendly snippets
    { 'rafamadriz/friendly-snippets' },
    { 'onsails/lspkind.nvim' },
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'

    require('luasnip.loaders.from_vscode').lazy_load()

    luasnip.filetype_extend('astro', { 'html' })
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
      window = {
        completion = {
          border = 'rounded',
          scrollbar = true,
        },
      },
      formatting = {
        format = lspkind.cmp_format {

          -- specifically vscode pictograms
          symbol_map = {
            Text = '󰊄 ',
            Variable = ' ',
            Snippet = ' ',
            Function = '󰊕 ',
            Method = ' ',
            Field = ' ',
            Keyword = ' ',
            File = ' ',
            Folder = ' ',
            Unit = ' ',
            Event = '',
            Module = '󰅩 ',
            Value = ' ',
            Enum = ' ',
            Color = ' ',
            Property = ' ',
            Operator = ' ',
            Struct = ' ',
            Class = ' ',
            Interface = ' ',
            Constant = ' ',
            TypeParameter = ' ',
            Reference = ' ',
          },
          maxwidth = 50,
          ellipsis_char = '...',
        },
      },
    }
  end,
}
