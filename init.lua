local home_dir = vim.loop.os_homedir()

-- require all global config
-- order is important
require "config.default_config"
require "config.lsp_config"
require "config.lang_config"
require "config.dap_config"
require "misc_mappings"

-- load settings
require "luong.colorscheme"
local opt = vim.opt
opt.shortmess:append "c"
if O.leader_key == " " or O.leader_key == "space" then
  vim.g.mapleader = " "
else
  vim.g.mapleader = O.leader_key
end
for _, plugin in pairs(O.disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
for k, v in pairs(O.default_options) do
  vim.opt[k] = v
end

-- alternative : vim.fn.exists('g:vscode')
-- debugging: nvim --cmd "let g:vscode=v:true"
if vim.g.vscode then
  vim.opt.rtp:remove(home_dir .. "/.config/nvim")
  vim.opt.rtp:append(home_dir .. "/.config/nvim/vscode")
  vim.cmd [[ runtime init.vim ]]
  require "vscode"
  return
end

-- load all plugins and configs
local plugins = require "plugins"
local plugin_loader = require("plugin-loader").init()
plugin_loader:load { plugins }

require("luong.autocmds").define_augroups(O.autocommands)
vim.cmd [[runtime nvr.vim]]

-- lsp config
require("new_lsp").config()
--   for lang, _ in pairs(O.lang) do
--     require("new_lsp").setup(lang)
--   end

local null_status_ok, null_ls = pcall(require, "null-ls")
if null_status_ok then
  null_ls.config {}
  require("lspconfig")["null-ls"].setup(O.lsp.null_ls.setup)
end

-- dap config
-- TODO: move this inside ftplugin
local dap_install_ok, dap_install = pcall(require, "dap-install")
if dap_install_ok then
  for dap_name, dap_conf in pairs(O.dap.lang) do
    dap_install.config(dap_name, dap_conf)
  end
end
