" This file contains some mapping that I dont feel comfortable converting to
" lua

" noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
" noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" noremap <silent> <expr> ^ (v:count == 0 ? 'g^' : '^')
" noremap <silent> <expr> $ (v:count == 0 ? 'g$' : '^')

" Copy file name / relative path / fullpath
if has('nvim') && executable('nvr')
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
