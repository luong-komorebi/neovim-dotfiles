set termguicolors
let g:disable_toggle_style = v:true
let g:onedark_terminal_italics=1

" customise this augroup if you wants more
augroup colorextend
  autocmd!
  " Make  in GUI mode
  au ColorScheme * call onedark#extend_highlight("Function", { "gui": "italic" })
augroup end

" let g:onedark_style = 'darker'
colorscheme onedark
