vim.g.netrw_home = os.getenv "HOME" .. "/vim"

if require "luong._first_load"() then
  return
end

require "default_config"
require "misc_mappings"
require "settings"

-- legacy
vim.cmd [[runtime misc_mappings.vim]]

-- init lsp soon
require("lsp").setup_handlers()

local null_status_ok, null_ls = pcall(require, "null-ls")
if null_status_ok then
  null_ls.config {}
  require("lspconfig")["null-ls"].setup {}
end
