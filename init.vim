" Autoinstall vim-plug
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" load plugin list
let g:vim_home = get(g:, 'vim_home', expand('~/.config/nvim/'))

" https://github.com/dense-analysis/ale#5iii-how-can-i-use-ale-and-cocnvim-together
let g:ale_disable_lsp = 1
let g:netrw_home=$HOME.'/vim'

call plug#begin('~/.local/share/nvim/plugged')
  exec 'source' g:vim_home.'plugins.vim'
  exec 'source' g:vim_home.'languages_specific_plugins.vim'
call plug#end()

let config_list = [
      \ 'general.vim',
      \ 'visual.vim',
      \ 'misc_mappings.vim',
      \ 'plugin_settings/*.vim',
      \ 'plugin_settings/*.lua'
      \]

for files in config_list
  for f in glob(g:vim_home.files, 1, 1)
    exec 'source' f
  endfor
endfor

" Set at the end to work around 'exrc'
set secure

""================
"" CONFIG CARBON
""================
"vnoremap <F5> :CarbonNowSh<CR>
"let g:carbon_now_sh_browser = 'open'
"let g:carbon_now_sh_options =
"\ { 'ln': 'true',
"  \ 'fm': 'Hack' }

"================
" CONFIG VIM-WOKRSPACE
"================
" let g:workspace_session_directory = $HOME . '/.vim/sessions/'
" let g:workspace_autosave_always = 1
" let g:workspace_persist_undo_history = 0

