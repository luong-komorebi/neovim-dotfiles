vim.g.netrw_home = os.getenv "HOME" .. "/vim"

if require "luong._first_load"() then
  return
end

require "default_config"
require "misc_mappings"
require "settings"

-- legacy
vim.cmd [[runtime nvr.vim]]

-- init lsp soon
-- require("lsp").setup_handlers()
-- for lang, _ in pairs(O.lang) do
--   require("lsp").setup(lang)
-- end

-- local null_status_ok, null_ls = pcall(require, "null-ls")
-- if null_status_ok then
--   null_ls.config {}
--   require("lspconfig")["null-ls"].setup {}
-- end

require("new_lsp").config()
for lang, _ in pairs(O.lang) do
  require("new_lsp").setup(lang)
end

local null_status_ok, null_ls = pcall(require, "null-ls")
if null_status_ok then
  null_ls.config {}
  require("lspconfig")["null-ls"].setup(O.lsp.null_ls.setup)
end
