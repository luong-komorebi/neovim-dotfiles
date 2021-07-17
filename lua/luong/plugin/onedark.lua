local execute = vim.api.nvim_command
vim.g.disable_toggle_style = false
vim.g.onedark_terminal_italics=1

require('onedark').setup()
vim.cmd[[colorscheme onedark]]
vim.cmd[[augroup colorextend autocmd! au ColorScheme * call onedark#extend_highlight("Function", { "gui": "italic" }) augroup end ]]
