vim.g.netrw_home = os.getenv "HOME" .. "/vim"

if vim.g.vscode then
  return
end

if require "luong._first_load"() then
  return
end

-- require all global config
-- order is important
require "default_config"
require "lsp_config"
require "lang_config"
require "dap_config"

require "misc_mappings"
require "luong"

-- legacy
vim.cmd [[runtime nvr.vim]]

-- lsp config
require("new_lsp").config()
for lang, _ in pairs(O.lang) do
  require("new_lsp").setup(lang)
end

local null_status_ok, null_ls = pcall(require, "null-ls")
if null_status_ok then
  null_ls.config {}
  require("lspconfig")["null-ls"].setup(O.lsp.null_ls.setup)
end

-- dap config
local dap_install_ok, dap_install = pcall(require, "dap-install")
if dap_install_ok then
  for dap_name, dap_conf in pairs(O.dap.lang) do
    dap_install.config(dap_name, dap_conf)
  end
end
