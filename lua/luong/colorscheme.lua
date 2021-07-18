vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions	= true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "CHADTree" }
local config = require("tokyonight.config")
O.pallete = require("tokyonight.colors").setup(config)
vim.cmd[[ colorscheme tokyonight ]]
