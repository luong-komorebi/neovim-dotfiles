O.plugin.nvimtree = {
  side = "left",
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30,
  },
  ignore = { ".git", "node_modules", ".cache" },
  auto_open = 0,
  auto_close = 1,
  quit_on_open = 0,
  follow = 1,
  hide_dotfiles = 1,
  git_hl = 1,
  root_folder_modifier = ":t",
  tab_open = 0,
  allow_resize = 1,
  lsp_diagnostics = 1,
  auto_ignore_ft = { "startify", "dashboard" },
  icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "",
      staged = "S",
      unmerged = "",
      renamed = "➜",
      deleted = "",
      untracked = "U",
      ignored = "◌",
    },
    folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
    },
  },
}
--
for opt, val in pairs(O.plugin.nvimtree) do
  vim.g["nvim_tree_" .. opt] = val
end

local tree_cb = require("nvim-tree.config").nvim_tree_callback

vim.g.nvim_tree_bindings = {
  { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
  { key = "v", cb = tree_cb "vsplit" },
}
vim.api.nvim_set_keymap("n", "<leader>ls", ":NvimTreeToggle", { silent = true, noremap = true })
