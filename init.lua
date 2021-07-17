vim.g.netrw_home= os.getenv("HOME") .. '/vim'

if require"luong.first_load"() then
  return
end

-- load all modules and configs
require"default_config"
require"misc_mappings"
require"luong"

for _, mod in ipairs(vim.api.nvim_get_runtime_file('lua/luong/plugin/**/*.lua', true)) do
  local ok, msg = pcall(loadfile(mod))

  if not ok then
    print("Failed to load: ", mod)
    print("\t", msg)
  end
end

require"settings"
vim.cmd[[runtime misc_augroup.vim]]
vim.cmd[[runtime misc_mappings.vim]]

