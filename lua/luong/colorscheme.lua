-- on first load the theme may not be available yet
local status_ok, _ = pcall(require, "tokyonight")
if not status_ok then
  -- this signals that no packages are installed
  -- so we can either install if packer is there or just return
  local packer_loaded, _ = pcall(require, "packer")
  if packer_loaded then
    require("packer").install()
  else
    return
  end
end

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "CHADTree", "DiffviewFiles" }
local config = require "tokyonight.config"
O.pallete = require("tokyonight.colors").setup(config)

vim.cmd [[ colorscheme tokyonight ]]
