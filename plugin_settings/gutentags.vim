"================
" CONFIG GUTENTAGS
"================
let g:gutentags_define_advanced_commands = 1
" enable gtags module
let g:gutentags_modules = ['ctags']

" config project root markers.
let g:gutentags_project_root = ['.git']
let g:gutentags_ctags_tagfile ='tags'
let g:gutentags_file_list_command = $FZF_DEFAULT_COMMAND
" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')
" command to clear cache quickly
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
let g:gutentags_generate_on_new = 0
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ '--sort=yes',
      \ '--recurse=yes',
      \ ]

let g:gutentags_project_info = [
  \ {'type': 'python', 'file': 'setup.py'},
  \ {'type': 'ruby', 'file': 'Gemfile'},
  \ {'type': 'golang', 'file': 'go.mod'}
\ ]
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp', 'tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

