set nocompatible " We're running Vim, not Vi!
syntax on
filetype on
filetype indent on
filetype plugin on

set ai
set autoread
set hidden
set hlsearch
set ruler
set linespace=1
set wrap linebreak nolist
set breakindent
set nofoldenable
" set tags=./tags;,tags;
set number

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
set showbreak=↪\
set listchars=lead:·,tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list

set autoindent
set clipboard+=unnamedplus

set splitright
set splitbelow
set lazyredraw
set laststatus=2
set encoding=utf8
set background=dark
" set textwith is for hard tab https://stackoverflow.com/questions/36950231/auto-wrap-lines-in-vim-without-inserting-newlines
" set textwidth=80
set textwidth=0
set wrapmargin=0
set cc=80
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

set expandtab
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
set bs=2 tabstop=2 shiftwidth=2 softtabstop=2
set backupcopy=yes

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Tip: histogram-based diffs using modern Vim integration with git's xdiff
set diffopt=filler,internal,algorithm:histogram,indent-heuristic

"================
" AUGROUP
"================
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
