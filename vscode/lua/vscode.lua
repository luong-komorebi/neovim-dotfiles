local install_path = vim.fn.stdpath "data" .. "/vscode/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.cmd "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

local util = require "packer.util"

packer.init {
  package_root = util.join_paths(vim.fn.stdpath "data" .. "/vscode/pack/"),
  compile_path = util.join_paths("~/.config/nvim/vscode", "plugin", "packer_compiled.lua"),
  git = { clone_timeout = 300 },
  max_jobs = 20,
}

packer.startup(function(use)
  use { "wbthomason/packer.nvim" }
  use { "wellle/targets.vim" }
  use { "michaeljsmith/vim-indent-object" }
  use { "jeetsukumaran/vim-indentwise" }
  use { "asvetliakov/vim-easymotion" }
end)
