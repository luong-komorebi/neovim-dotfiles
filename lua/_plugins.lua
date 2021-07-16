local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

vim.cmd([[autocmd BufWritePost _plugins.lua source init.lua | PackerCompile]])
return require('packer').startup(function()
  -- Theme and icons
  -- ======================
  use 'navarasu/onedark.nvim'
  use 'ryanoasis/vim-devicons'

  -- Search and jump around
  -- ======================
  --  note : to paste in easymotion search mode: use ctrl-r and + or "
  use 'easymotion/vim-easymotion'
  use 'haya14busa/incsearch.vim'
  use 'haya14busa/incsearch-easymotion.vim'
  use 'haya14busa/incsearch-fuzzy.vim'
  use 'jesseleite/vim-agriculture'
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'}
  use 'junegunn/fzf.vim'
  use 'nelstrom/vim-visual-star-search'

  -- Editing and formatting codes
  -- ======================
  use 'matze/vim-move'
  use 'tpope/vim-commentary'
  use 'junegunn/vim-easy-align'
  -- use 'jiangmiao/auto-pairs'
  use {'mg979/vim-visual-multi', branch = 'master'}
  use 'AndrewRadev/splitjoin.vim'
  use 'dyng/ctrlsf.vim'
  use 'rhysd/clever-f.vim'
  use 'junegunn/vim-peekaboo'
  use 'ludovicchabant/vim-gutentags'
  use 'mbbill/undotree'

  -- Additional text object
  -- ======================
  use 'wellle/targets.vim'
  use 'michaeljsmith/vim-indent-object'

  -- Navigations and files
  -- ======================
  use 'psliwka/vim-smoothie'
  -- You will have to run :CHADdeps when installing / updating
  use {'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps'}

  -- Indicators
  -- ======================
  -- dependencies for gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  use {
    'glepnir/galaxyline.nvim',
      branch = 'main',
      -- some optional icons
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Passive support
  -- ======================
  use 'ntpeters/vim-better-whitespace'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'benmills/vimux'
  use 'liuchengxu/vista.vim'
  use 'tmux-plugins/vim-tmux-focus-events'
  use 'jeetsukumaran/vim-indentwise'
  use 'andymass/vim-matchup'

  -- Testing and autocomplete
  -- ================================
  use 'janko-m/vim-test'
  use 'dense-analysis/ale'
  use 'honza/vim-snippets'
  use 'editorconfig/editorconfig-vim'
  use 'neovim/nvim-lspconfig'

  -- Miscs
  -- ======================
  use 'schickling/vim-bufonly'
  use 'vim-scripts/git-time-lapse'
  -- use 'kristijanhusak/vim-carbon-now-sh'
  use {"npxbr/glow.nvim", run = "GlowInstall"}
  use 'rhysd/git-messenger.vim'
  use 'kdheepak/lazygit.nvim'

  -- Syntax and language packs
  -- =========================
  -- https://github.com/sheerun/vim-polyglot/issues/309
  -- have to load vim go before vim polygot
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  execute('set regexpengine=1') -- use old engine for ruby, new engine is slow as fuck
  use 'gabrielelana/vim-markdown'
  vim.g.markdown_enable_mappings = false

  use 'noprompt/vim-yardoc'
  execute('hi link yardGenericTag rubyInstanceVariable')
  use 'pedrohdz/vim-yaml-folds'
  use 'tsandall/vim-rego'
  use 'hashivim/vim-terraform'
  use 'sbdchd/neoformat' -- Currently ALE does not support fix rego so we have to use neoformat
  use 'google/vim-jsonnet'

  -- Tpope and his ruby magics
  -- =========================
  use 'tpope/vim-cucumber'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use 'junegunn/gv.vim'
  use 'shumphrey/fugitive-gitlab.vim'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-rake'
  use 'tpope/vim-bundler'
end)
