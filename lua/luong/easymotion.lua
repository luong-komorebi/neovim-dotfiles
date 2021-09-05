vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1
vim.api.nvim_set_keymap("n", "/", "<Plug>(easymotion-sn)", {})
vim.api.nvim_set_keymap("o", "/", "<Plug>(easymotion-tn)", {})
vim.api.nvim_set_keymap("n", "<leader><leader>f", "<Plug>(easymotion-bd-f)", {})
vim.api.nvim_set_keymap("n", "<leader><leader>F", "<Plug>(easymotion-overwin-f)", {})
vim.api.nvim_set_keymap("n", "z/", "<Plug>(incsearch-fuzzy-/)", {})
vim.api.nvim_set_keymap("n", "z?", "<Plug>(incsearch-fuzzy-?)", {})
vim.api.nvim_set_keymap("n", "zg/", "<Plug>(incsearch-fuzzy-stay)", {})
