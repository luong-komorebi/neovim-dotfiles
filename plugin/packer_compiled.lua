-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/eh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/eh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/eh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/eh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/eh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["DAPInstall.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0B\3\2\2'\4\a\0&\3\4\3=\3\t\2B\0\2\1K\0\1\0\22installation_path\1\0\1\29verbosely_call_debuggers\1\17/dapinstall/\tdata\fstdpath\afn\bvim\nsetup\16dap-install\frequire\0" },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { 'require"luong.bufferline"' },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/bufferline.nvim"
  },
  chadtree = {
    commands = { "CHADopen" },
    config = { 'require"luong.chadtree"' },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/chadtree"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/ctrlsf.vim"
  },
  ["diffview.nvim"] = {
    config = { 'require"luong.diffview"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    config = { 'require"luong.galaxyline"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["gitlinker.nvim"] = {
    config = { 'require"luong.gitlinker"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'require"luong.gitsigns"' },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/glow.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  hop = {
    config = { 'require"luong.hop"' },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/hop"
  },
  ["incsearch-easymotion.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/incsearch-easymotion.vim"
  },
  ["incsearch-fuzzy.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/incsearch-fuzzy.vim"
  },
  ["incsearch.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/incsearch.vim"
  },
  ["indent-blankline.nvim"] = {
    config = { 'require"luong.blankline"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { 'require"luong.lspsaga"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neoformat = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/neoformat"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\nt\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\b\0\0\n<C-u>\n<C-d>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require"luong.autopairs"' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20luong.colorizer\frequire\0" },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { 'require"luong.nvim-comment"' },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/nvim-comment"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19luong.nvim-dap\frequire\0" },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-gps"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nicons\1\0\0\1\0\4\18function-name\t \16method-name\t \15class-name\t \19container-name\t \nsetup\rnvim-gps\frequire\0" },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-gps"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { 'require"luong.lspinstall"' },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26luong.nvim-toggleterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require"luong.nvim-treesitter"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    config = { 'require"luong.nvim-ts-rainbow"' },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/project.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require"luong.telescope"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nV\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\29use_lsp_diagnostic_signs\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-agriculture"] = {
    commands = { "RgRaw" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-agriculture"
  },
  ["vim-better-whitespace"] = {
    config = { 'require"luong.better-whitespace"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-better-whitespace"
  },
  ["vim-bundler"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-bundler"
  },
  ["vim-cucumber"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-cucumber"
  },
  ["vim-easy-align"] = {
    config = { 'require"luong.easyalign"' },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-easy-align"
  },
  ["vim-easymotion"] = {
    config = { "require'luong.easymotion'" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-easymotion"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-helm"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-helm"
  },
  ["vim-indentwise"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-indentwise"
  },
  ["vim-jsonnet"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-jsonnet"
  },
  ["vim-markdown"] = {
    config = { "\27LJ\2\n:\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\1\0=\1\2\0K\0\1\0\29markdown_enable_mappings\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-matchup"] = {
    after_files = { "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-move"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-move"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-projectionist"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-projectionist"
  },
  ["vim-rake"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-rake"
  },
  ["vim-rego"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-rego"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-terraform"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-terraform"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-visual-multi"] = {
    config = { 'require"luong.vim-visual-multi"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-visual-star-search"
  },
  ["vim-yaml-folds"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-yaml-folds"
  },
  ["vim-yardoc"] = {
    config = { "\27LJ\2\nd\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0B\1\2\1K\0\1\0000hi link yardGenericTag rubyInstanceVariable\17nvim_command\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-yardoc"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  vimux = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vimux"
  },
  ["vista.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nX\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\1K\0\1\0\nsetup\vconfig\20luong.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
require"luong.galaxyline"
time([[Config for galaxyline.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require"luong.telescope"
time([[Config for telescope.nvim]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
require"luong.gitlinker"
time([[Config for gitlinker.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nV\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\29use_lsp_diagnostic_signs\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require"luong.nvim-treesitter"
time([[Config for nvim-treesitter]], false)
-- Config for: vim-better-whitespace
time([[Config for vim-better-whitespace]], true)
require"luong.better-whitespace"
time([[Config for vim-better-whitespace]], false)
-- Config for: nvim-gps
time([[Config for nvim-gps]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nicons\1\0\0\1\0\4\18function-name\t \16method-name\t \15class-name\t \19container-name\t \nsetup\rnvim-gps\frequire\0", "config", "nvim-gps")
time([[Config for nvim-gps]], false)
-- Config for: vim-visual-multi
time([[Config for vim-visual-multi]], true)
require"luong.vim-visual-multi"
time([[Config for vim-visual-multi]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20luong.colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
require"luong.diffview"
time([[Config for diffview.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
require"luong.lspsaga"
time([[Config for lspsaga.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19luong.nvim-dap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\nt\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\b\0\0\n<C-u>\n<C-d>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: DAPInstall.nvim
time([[Config for DAPInstall.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0B\3\2\2'\4\a\0&\3\4\3=\3\t\2B\0\2\1K\0\1\0\22installation_path\1\0\1\29verbosely_call_debuggers\1\17/dapinstall/\tdata\fstdpath\afn\bvim\nsetup\16dap-install\frequire\0", "config", "DAPInstall.nvim")
time([[Config for DAPInstall.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require"luong.blankline"
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\1K\0\1\0\nsetup\vconfig\19luong.nvim-cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CHADopen lua require("packer.load")({'chadtree'}, { cmd = "CHADopen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RgRaw lua require("packer.load")({'vim-agriculture'}, { cmd = "RgRaw", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType helm ++once lua require("packer.load")({'vim-helm'}, { ft = "helm" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'glow.nvim', 'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType rego ++once lua require("packer.load")({'vim-rego', 'neoformat'}, { ft = "rego" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'vim-projectionist', 'vim-rake', 'vim-yardoc', 'vim-bundler', 'vim-cucumber'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType hcl ++once lua require("packer.load")({'vim-terraform'}, { ft = "hcl" }, _G.packer_plugins)]]
vim.cmd [[au FileType terraform ++once lua require("packer.load")({'vim-terraform'}, { ft = "terraform" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'vim-move', 'vista.vim', 'which-key.nvim', 'bufferline.nvim', 'nvim-toggleterm.lua', 'nvim-ts-rainbow', 'incsearch-easymotion.vim', 'incsearch-fuzzy.vim', 'incsearch.vim', 'hop', 'targets.vim', 'symbols-outline.nvim', 'vim-easy-align', 'vim-easymotion', 'nvim-autopairs'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'lsp_signature.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-comment', 'gitsigns.nvim', 'octo.nvim', 'numb.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-lspinstall'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-rego/ftdetect/rego.vim]], true)
vim.cmd [[source /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-rego/ftdetect/rego.vim]]
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-rego/ftdetect/rego.vim]], false)
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /Users/eh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/eh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /Users/eh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-terraform/ftdetect/hcl.vim]], true)
vim.cmd [[source /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-terraform/ftdetect/hcl.vim]]
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-terraform/ftdetect/hcl.vim]], false)
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-cucumber/ftdetect/cucumber.vim]], true)
vim.cmd [[source /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-cucumber/ftdetect/cucumber.vim]]
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-cucumber/ftdetect/cucumber.vim]], false)
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-helm/ftdetect/helm.vim]], true)
vim.cmd [[source /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-helm/ftdetect/helm.vim]]
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-helm/ftdetect/helm.vim]], false)
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
