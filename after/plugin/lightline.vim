"=================
" CONFIG LIGHTLINE
"=================
let g:lightline_setting_folder = get(g:, 'lightline_setting_folder', expand('~/.config/nvim/plugin_settings/lightline/'))

set noshowmode
set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ ['mode', 'paste'], ['readonly', 'filename', 'modified', 'vistanearest', 'gutentags'], ['linter_errors', 'linter_warnings', 'linter_ok' ] ],
      \   'right': [ ['lineinfo'], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \    'left': [ ['readonly', 'filename'] ],
      \    'right': []
      \ },
      \ 'tabline': {
      \   'left':  [ [ 'buffers' ]],
      \   'right': [ [ 'gitbranch' ], ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'fugitive#head',
      \   'percent': 'MyLightLinePercent',
      \   'lineinfo': 'MyLightLineLineInfo',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'modified': 'LightlineGitSigns',
      \   'bufferinfo': 'lightline#buffer#bufferinfo',
      \   'vistanearest': 'NearestMethodOrFunction',
      \   'gutentags': 'gutentags#statusline'
      \ },
      \ 'tab_component_function': {
      \   'tabnum': 'LightlineWebDevIcons'
      \ },
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'VL',
      \   "\<C-v>": 'VB',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'SL',
      \   "\<C-s>": 'SB',
      \   't': 'T'
      \ },
      \ 'tabline_separator':  { 'left': '', 'right': '' },
      \ 'tabline_subseparator': { 'left': '', 'right': '' },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \  'buffers': 'lightline#bufferline#buffers'
      \ }
let g:lightline.component_type = {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \   'buffercurrent':   'tabsel',
      \   'bufferbefore':    'raw',
      \   'bufferafter':     'raw',
      \   'buffers':         'tabsel'
      \ }

let g:tcd_blacklist = '\v(cheat40|denite|gundo|help|netrw|peekaboo|quickmenu|unite|vimfiler|vimshell|fzf)'

function! LightlineFileformat()
  return &ft !~# g:tcd_blacklist && winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFiletype()
  return &ft !~# g:tcd_blacklist && winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root && winwidth(0) > 40
    return &filetype !~# g:tcd_blacklist ? path[len(root)+1:] : ''
  elseif path[:len(root)-1] ==# root && winwidth(0) <= 40
    return &filetype !~# g:tcd_blacklist ? expand('%:t') : ''
  endif
  return &filetype !~# g:tcd_blacklist && winwidth(0) > 70 ? expand('%') : &filetype
endfunction

function! MyLightLinePercent()
  if &ft !~# g:tcd_blacklist && winwidth(0) > 70
    return line('.') * 100 / line('$') . '%'
  else
    return ''
  endif
endfunction

function! MyLightLineLineInfo()
  if &ft !~# g:tcd_blacklist
    return line('.').':'. col('.')
  else
    return ''
  endif
endfunction

for f in glob(g:lightline_setting_folder.'*.vim', 1, 1)
  exec 'source' f
endfor
