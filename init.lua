vim.g.netrw_home= os.getenv("HOME") .. '/vim'

if require"luong._first_load"() then
  return
end

require"default_config"
require"misc_mappings"
require"settings"

-- legacy
vim.cmd[[runtime misc_augroup.vim]]
vim.cmd[[runtime misc_mappings.vim]]
-- require("lsp").setup_handlers()
