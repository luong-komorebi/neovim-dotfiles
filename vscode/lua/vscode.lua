local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

local util = require "packer.util"

packer.init {
  package_root = util.join_paths(vim.fn.stdpath "data" .. "/site/pack/vscode/"),
  compile_path = util.join_paths("~/.config/nvim", "vscode", "packer_compiled.lua"),
  git = { clone_timeout = 300 },
  max_jobs = 20,
}

packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use { "wellle/targets.vim" }
  use { "michaeljsmith/vim-indent-object" }
  use { "jeetsukumaran/vim-indentwise" }
  -- use { "asvetliakov/vim-easymotion" }
end)
