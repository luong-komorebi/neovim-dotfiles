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
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["bufferline.nvim"] = {
    config = { 'require"luong.config.bufferline"' },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/bufferline.nvim"
  },
  chadtree = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/chadtree"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/ctrlsf.vim"
  },
  ["diffview.nvim"] = {
    config = { 'require"luong.config.diffview"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["friendly-snippets"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/friendly-snippets"
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
    config = { 'require"luong.config.galaxyline"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["git-time-lapse"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/git-time-lapse"
  },
  ["gitlinker.nvim"] = {
    config = { 'require"luong.config.gitlinker"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'require"luong.config.gitsigns"' },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/glow.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  hop = {
    config = { 'require"luong.config.hop"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/hop"
  },
  ["incsearch-easymotion.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/incsearch-easymotion.vim"
  },
  ["incsearch-fuzzy.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/incsearch-fuzzy.vim"
  },
  ["incsearch.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/incsearch.vim"
  },
  ["indent-blankline.nvim"] = {
    config = { 'require"luong.config.blankline"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { 'require"luong.config.lspsaga"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0" },
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
    config = { 'require"luong.config.autopairs"' },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\27luong.config.colorizer\frequire\0" },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { 'require"luong.config.nvim-comment"' },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/nvim-comment"
  },
  ["nvim-compe"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-dap"] = {
    config = { 'require"luong.config.nvim-dap"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { 'require"luong.config.lspinstall"' },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-lsputils"] = {
    config = { "\27LJ\2\n�\5\0\0\4\0\23\0A6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\t\1=\1\a\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\v\1=\1\n\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\r\1=\1\f\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\15\1=\1\14\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\17\1=\1\16\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\20\1=\1\18\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\22\1=\1\21\0K\0\1\0\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\frequire\28textDocument/codeAction\rhandlers\blsp\bvim\0" },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\nJ\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup!luong.config.nvim-toggleterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require"luong.config.nvim-treesitter"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    config = { 'require"luong.config.nvim-ts-rainbow"' },
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
  popfix = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/popfix"
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
  ["quick-scope"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28luong.config.quickscope\frequire\0" },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["symbols-outline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require"luong.config.telescope"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-agriculture"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-agriculture"
  },
  ["vim-better-whitespace"] = {
    config = { 'require"luong.config.better-whitespace"' },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-better-whitespace"
  },
  ["vim-bundler"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-bundler"
  },
  ["vim-cucumber"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-cucumber"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-easymotion"] = {
    config = { "require'luong.config.easymotion'" },
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-elixir"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-elixir"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-helm"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-helm"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-indent-object"
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
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-matchup"] = {
    after_files = { "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-move"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-projectionist"
  },
  ["vim-rake"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-rake"
  },
  ["vim-rego"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-rego"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-terraform"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-visual-star-search"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vim-yaml-folds"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-yaml-folds"
  },
  ["vim-yardoc"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-yardoc"
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
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\27luong.config.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require"luong.config.telescope"
time([[Config for telescope.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
require"luong.config.galaxyline"
time([[Config for galaxyline.nvim]], false)
-- Config for: vim-better-whitespace
time([[Config for vim-better-whitespace]], true)
require"luong.config.better-whitespace"
time([[Config for vim-better-whitespace]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
require"luong.config.gitlinker"
time([[Config for gitlinker.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\27luong.config.colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
require"luong.config.nvim-compe"
time([[Config for nvim-compe]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: vim-easymotion
time([[Config for vim-easymotion]], true)
require'luong.config.easymotion'
time([[Config for vim-easymotion]], false)
-- Config for: quick-scope
time([[Config for quick-scope]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28luong.config.quickscope\frequire\0", "config", "quick-scope")
time([[Config for quick-scope]], false)
-- Config for: hop
time([[Config for hop]], true)
require"luong.config.hop"
time([[Config for hop]], false)
-- Config for: nvim-lsputils
time([[Config for nvim-lsputils]], true)
try_loadstring("\27LJ\2\n�\5\0\0\4\0\23\0A6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\t\1=\1\a\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\v\1=\1\n\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\r\1=\1\f\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\15\1=\1\14\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\17\1=\1\16\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\20\1=\1\18\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\22\1=\1\21\0K\0\1\0\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\frequire\28textDocument/codeAction\rhandlers\blsp\bvim\0", "config", "nvim-lsputils")
time([[Config for nvim-lsputils]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require"luong.config.blankline"
time([[Config for indent-blankline.nvim]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
require"luong.config.diffview"
time([[Config for diffview.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require"luong.config.nvim-treesitter"
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
require"luong.config.nvim-dap"
time([[Config for nvim-dap]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
require"luong.config.lspsaga"
time([[Config for lspsaga.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
require"luong.config.autopairs"

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typescript.tsx ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "typescript.tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType elixir ++once lua require("packer.load")({'vim-elixir'}, { ft = "elixir" }, _G.packer_plugins)]]
vim.cmd [[au FileType eelixir ++once lua require("packer.load")({'vim-elixir'}, { ft = "eelixir" }, _G.packer_plugins)]]
vim.cmd [[au FileType euphoria3 ++once lua require("packer.load")({'vim-elixir'}, { ft = "euphoria3" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript.jsx ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "javascript.jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au InsertCharPre * ++once lua require("packer.load")({'friendly-snippets'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'numb.nvim', 'nvim-comment', 'octo.nvim', 'gitsigns.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'nvim-toggleterm.lua', 'nvim-ts-rainbow', 'which-key.nvim', 'bufferline.nvim', 'vista.vim', 'symbols-outline.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-lspinstall'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'lsp_signature.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]], true)
vim.cmd [[source /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]]
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]], false)
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/eh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/eh/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
