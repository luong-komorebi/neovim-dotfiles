vim.g.disable_toggle_style = false
vim.g.onedark_terminal_italics=1

vim.cmd([[
augroup colorextend
  autocmd!
  au ColorScheme * call onedark#extend_highlight("Function", { "gui": "italic" })
augroup end
]])

vim.g.onedark_style = 'default'
require('onedark').setup()
