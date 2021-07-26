require'hop'.setup()
vim.api.nvim_set_keymap('n', '<Leader><Tab>', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('n', 'ss', "<cmd>lua require'hop'.hint_char2()<cr>", {})
