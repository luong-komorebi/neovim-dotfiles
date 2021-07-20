"================
" MAPPING CHADTREE
"================
map <silent> <leader>rev <ESC>:CHADopen --always-focus <CR>
map <silent> <leader>ls <ESC>:CHADopen <CR>
nnoremap <leader>l <cmd>call setqflist([])<cr>

let chadtree_settings = {
  \ 'ignore.path_glob': ['^node_modules'],
  \ 'theme.text_colour_set': 'env',
  \ 'keymap.v_split': ['w', '<c-v>'],
  \ 'keymap.h_split': ['W', '<c-x>'],
  \ }

