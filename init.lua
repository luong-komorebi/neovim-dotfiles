vim.g.netrw_home= os.getenv("HOME") .. '/vim'

if require"lv.first_load"() then
  return
end

require"lv"

for _, mod in ipairs(vim.api.nvim_get_runtime_file('lua/lv/plugin/**/*.lua', true)) do
  local ok, msg = pcall(loadfile(mod))

  if not ok then
    print("Failed to load: ", mod)
    print("\t", msg)
  end
end

vim.cmd[[runtime misc_mappings.vim]]
vim.cmd[[runtime general.vim]]
