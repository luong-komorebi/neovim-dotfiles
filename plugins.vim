" Theme and icons
" ======================
Plug 'navarasu/onedark.vim'
Plug 'ryanoasis/vim-devicons'

" Search and jump around
" ======================
"  note : to paste in easymotion search mode: use ctrl-r and + or "
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nelstrom/vim-visual-star-search'

" Editing and formatting codes
" ======================
Plug 'matze/vim-move'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
" Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'rhysd/clever-f.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree'

" Additional text object
" ======================
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'

" Navigations and files
" ======================
Plug 'psliwka/vim-smoothie'
" You will have to run :CHADdeps when installing / updating
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" Indicators
" ======================
" dependencies for gitsigns
Plug 'nvim-lua/plenary.nvim'
" gitsigns
Plug 'lewis6991/gitsigns.nvim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'

" Passive support
" ======================
Plug 'ntpeters/vim-better-whitespace'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'benmills/vimux'
Plug 'liuchengxu/vista.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'andymass/vim-matchup'

" Testing and autocomplete
" ================================
Plug 'janko-m/vim-test'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'editorconfig/editorconfig-vim'
Plug 'neovim/nvim-lspconfig'

" Miscs
" ======================
Plug 'schickling/vim-bufonly'
Plug 'vim-scripts/git-time-lapse'
" Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'rhysd/git-messenger.vim'
Plug 'kdheepak/lazygit.nvim'

