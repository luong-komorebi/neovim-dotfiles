" here's a (what should be a one-line) map
" to help you tell just what syntax highlighting groups the item under the cursor actually is:
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nnoremap <silent> <CR> <ESC>:noh<CR>
" mapping to jump between buffer
noremap <silent><nowait> zh <C-W><C-H>
noremap <silent><nowait> zj <C-W><C-J>
noremap <silent><nowait> zk <C-W><C-K>
noremap <silent><nowait> zl <C-W><C-L>

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <silent> <expr> ^ (v:count == 0 ? 'g^' : '^')
noremap <silent> <expr> $ (v:count == 0 ? 'g$' : '^')

" mapping buffer
nnoremap ,b :buffer <C-z><S-Tab>
nnoremap ,B :sbuffer <C-z><S-Tab>

nnoremap gb :ls<CR>:buffer<Space>
nnoremap gB :ls<CR>:sbuffer<Space>

nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>

" to copy and paste multiple time
xnoremap p pgvy

" bind control e to exit in terminal mode
tnoremap <c-e> <C-\><C-n>

" Jump to reference file under cursor in split window
nnoremap gf :vertical wincmd f<CR>

" Copy file name / relative path / fullpath
nmap <silent> cprp :let @+=expand("%")<CR>
nmap <silent> cpfp :let @+ = expand("%:p")<CR>
nmap <silent> cpfn :let @+ = expand("%:t")<CR>
