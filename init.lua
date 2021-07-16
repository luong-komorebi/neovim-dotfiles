vim.g.netrw_home= os.getenv("HOME") .. '/vim'

if require "lv.first_load"() then
  return
end

require"_plugins"
package.path = '/lua/lv/?.lua;'..package.path
