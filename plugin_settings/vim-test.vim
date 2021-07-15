"======================
" MAPPING RSPEC VIMTEST
"======================
noremap <Leader>tt :TestFile<CR>
noremap <Leader>ts :TestNearest<CR>
noremap <Leader>tl :TestLast<CR>
noremap <Leader>ta :TestSuite<CR>
noremap <Leader>vq :VimuxCloseRunner<CR>
noremap <Leader>vz :VimuxZoomRunner<CR>
" let test#ruby#rspec#executable = 'rspec'

" Rpsec vimtest config
let test#strategy = "vimux"
let g:VimuxUseNearest = 0
