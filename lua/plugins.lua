local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end


vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
-- Theme and icons
-- ======================
use 'navarasu/onedark.vim'
use 'ryanoasis/vim-devicons'

-- Search and jump around
-- ======================
--  note : to paste in easymotion search mode: use ctrl-r and + or "
use 'easymotion/vim-easymotion'
use 'haya14busa/incsearch.vim'
use 'haya14busa/incsearch-easymotion.vim'
use 'haya14busa/incsearch-fuzzy.vim'
use 'jesseleite/vim-agriculture'
use 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
use 'junegunn/fzf.vim'
use 'nelstrom/vim-visual-star-search'

-- Editing and formatting codes
-- ======================
use 'matze/vim-move'
use 'tpope/vim-commentary'
use 'junegunn/vim-easy-align'
-- use 'jiangmiao/auto-pairs'
use 'mg979/vim-visual-multi', {'branch': 'master'}
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
use 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

-- Indicators
-- ======================
-- dependencies for gitsigns
use 'nvim-lua/plenary.nvim'
-- gitsigns
use 'lewis6991/gitsigns.nvim'
use 'itchyny/lightline.vim'
use 'mengelbrecht/lightline-bufferline'
use 'maximbaz/lightline-ale'

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
use 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
use 'rhysd/git-messenger.vim'
use 'kdheepak/lazygit.nvim'
