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
  ale = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  chadtree = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/chadtree"
  },
  ["clever-f.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/clever-f.vim"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/ctrlsf.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["fugitive-gitlab.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/fugitive-gitlab.vim"
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
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/lazygit.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/targets.vim"
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
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-commentary"
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
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-gutentags"
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
  ["vim-smoothie"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-snippets"
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
  ["vim-tmux-focus-events"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-tmux-focus-events"
  },
  ["vim-visual-multi"] = {
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
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vim-yardoc"
  },
  vimux = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vimux"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/Users/eh/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
