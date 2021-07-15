"================
" MAPPING EASYMOTION and INCSearch
"================
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

set ignorecase
set smartcase

map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

nmap <silent><tab> <Plug>(easymotion-overwin-w)
nmap s <Plug>(easymotion-s2)

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)


