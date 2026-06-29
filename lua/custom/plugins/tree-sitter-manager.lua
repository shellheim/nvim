return {
  'romus204/tree-sitter-manager.nvim',
  lazy = false,
  -- tree-sitter cli must be in $PATH
  config = function()
    local treesitter = require 'tree-sitter-manager'
    treesitter.setup {
      auto_install = true,
      ensure_installed = { 'html', 'css', 'javascript', 'java', 'json', 'bash', 'fish', 'rust', 'c', 'cpp', 'lua', 'python', 'markdown', 'comment' },
    }
  end,
}
