require("project_nvim").setup {}
require("telescope").load_extension "projects"
vim.api.nvim_set_keymap("n", "<leader>fp", ":Telescope projects<CR>", {})
