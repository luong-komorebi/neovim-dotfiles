let g:vim_home = get(g:, 'vim_home', expand('~/.config/nvim/'))
let g:netrw_home=$HOME.'/vim'
lua require"init"

" some old vim configs
let config_list = [
      \ 'general.vim',
      \ 'visual.vim',
      \ 'misc_mappings.vim',
      \]

for files in config_list
  for f in glob(g:vim_home.files, 1, 1)
    exec 'source' f
  endfor
endfor

" Set at the end to work around 'exrc'
set secure
