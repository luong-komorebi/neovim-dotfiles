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
  use { "jeetsukumaran/vim-indentwise" }
  use { "wbthomason/packer.nvim" }
  use { "wellle/targets.vim" }
  use { "michaeljsmith/vim-indent-object" }
  use { "asvetliakov/vim-easymotion", event = "BufWinEnter", config = [[require"lvscode.easymotion"]] }
  use { "haya14busa/incsearch.vim", event = "BufWinEnter", requires = { { "haya14busa/incsearch-easymotion.vim" }, { "haya14busa/incsearch-fuzzy.vim" } } }
  use { "junegunn/vim-easy-align", event = "BufWinEnter", config = [[require"lvscode.easyalign"]] }
end)
