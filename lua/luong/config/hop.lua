require'hop'.setup()
vim.api.nvim_set_keymap('n', '<Tab>', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('n', '/', "<cmd>lua require'hop'.hint_patterns()<cr>", {})
vim.api.nvim_set_keymap('n', 's', "<cmd>lua require'hop'.hint_char2()<cr>", {})
