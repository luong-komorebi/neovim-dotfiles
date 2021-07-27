local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
  },
  custom_captures = {
    -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
    ['foo.bar'] = 'Identifier',
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
}

vim.api.nvim_command [[ set foldexpr=nvim_treesitter#foldexpr() ]]
vim.api.nvim_command [[ set foldmethod=expr ]]
