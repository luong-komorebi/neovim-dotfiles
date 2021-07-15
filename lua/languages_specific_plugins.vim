" Syntax and language packs
" =========================
" https://github.com/sheerun/vim-polyglot/issues/309
" have to load vim go before vim polygot
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

set regexpengine=1 " use old engine for ruby, new engine is slow as fuck
Plug 'gabrielelana/vim-markdown'
let g:markdown_enable_mappings = 0

Plug 'noprompt/vim-yardoc'
hi link yardGenericTag rubyInstanceVariable
Plug 'pedrohdz/vim-yaml-folds'
Plug 'tsandall/vim-rego'
Plug 'hashivim/vim-terraform'
Plug 'sbdchd/neoformat' "Currently ALE does not support fix rego so we have to use neoformat
Plug 'google/vim-jsonnet'

" Tpope and his ruby magics
" =========================
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
