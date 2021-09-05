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
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/bufferline.nvim"
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
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
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
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/glow.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/hop.nvim"
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
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["numb.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/numb.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/project.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
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
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-easymotion"
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
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-matchup"
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
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vimtex"
  },
  vimux = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vimux"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
