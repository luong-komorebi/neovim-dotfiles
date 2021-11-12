let $FZF_DEFAULT_COMMAND = 'rg --files  --hidden --follow --glob "!{.git, node_modules}"'
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" See `man fzf-tmux` for available options
if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,70%' }
else
  let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.8 } }
endif

" -------
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': []}), <bang>0)
" search for a filename
nnoremap <c-p> <ESC> :Files <CR>
" search in current directory of a file
nnoremap <leader>. :Files <C-r>=expand("%:h")<CR>/<CR>

" -------
" search for some keywords
" delegate search for rg and fzf will now provide a selector for the result
" every time we modify the string, fzf will send it to rg and make the process
" restart so we always get fresh result instead of initiating once
function! FzfAutoRefreshRipgrep(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --smart-case --hidden --color=always --glob "!{.git, node_modules}" -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call FzfAutoRefreshRipgrep(<q-args>, <bang>0)
nnoremap <silent> <leader>rg <ESC>:RG<CR>

" -------
nnoremap <c-o> <ESC>:Tags<CR>
nnoremap <slient> <leader>t <ESC>:BTags<CR>
nnoremap <c-]> <ESC>:call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact +i'})<CR>
nnoremap <silent> <leader>mm <ESC>:Commands<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>b :Buffers<CR>
" currently this is automatically handled by gutentags
" let g:fzf_tags_command = 'ctags --tag-relative -R --sort=yes --exclude=.git --exclude=log --exclude=tmp --exclude=*.html --exclude=tmp --exclude=public --exclude=app/assets . '

" -------
" we have to maintain a different function for visual search because there are
" some differences in the parameters and this can enable us to query on the
" filename after doing a visual grep ( passing no reloading option )
function! FzfVisualSearch(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --color=always --glob "!{.git, node_modules}" -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(), a:fullscreen)
endfunction

function! FzfVisualSearchRange() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  call FzfVisualSearch(selection, 0)
endfunction
nnoremap <silent> E :call FzfVisualSearch(expand('<cword>'), 0)<CR>
vnoremap <silent> E :call FzfVisualSearchRange()<CR>
" nnoremap <silent> <leader>gl :Commits<CR>
" nnoremap <silent> <leader>ga :BCommits<CR>

" -------
" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
