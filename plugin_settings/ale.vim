" ==========
" CONFIG ALE
" ==========
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'ruby': ['rubocop'],
      \ 'javascript': ['prettier'],
      \ 'python': ['black'],
      \ 'go': ['gofmt', 'goimports'],
	    \ 'markdown': ['prettier']
      \}
let g:ale_linters = {
      \   'javascript': ['prettier', 'eslint'],
      \   'ruby': [],
      \   'go': ['golint', 'gofmt'],
      \}
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 0
let g:ale_lint_delay = 300

" python
let g:ale_python_pylint_options = '--load-plugins pylint_django'
highlight SignColumn guibg=255

"===============
" MAPPING ALE
"===============
map <silent> <leader>p <ESC>:ALEFix<CR>


