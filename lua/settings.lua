---  HELPERS  ---
local cmd = vim.cmd
local opt = vim.opt

---  SETTINGS  ---
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

-- load all plugins and configs
require "luong.colorscheme"
require "luong.plugins"
require "luong.autocmds".define_augroups(O.autocommands)

-- TODO: review if we still need this pieces of code since we rely on packer for loading configs now
-- if O.has_sourced then
--   return
-- else
--   for _, mod in ipairs(vim.api.nvim_get_runtime_file('lua/luong/config/**/*.lua', true)) do
--     local ok, msg = pcall(loadfile(mod))
--     if not ok then
--       print("Failed to load: ", mod)
--       print("\t", msg)
--     end
--     O.has_sourced = true
--   end
-- end
