"===============
" CONFIG MATCHUP
"===============
" let b:matchup_matchparen_enabled = 0
" let b:matchup_matchparen_fallback = 1
let g:matchup_matchparen_stopline = 60  " for match highlighting only
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 100
let g:matchup_surround_enabled = 1
let g:matchup_matchparen_insert_timeout = 30
let g:matchup_matchparen_deferred_show_delay = 100
let g:matchup_matchparen_deferred_hide_delay = 700
" nnoremap [op :DoMatchParen<CR>
" nnoremap ]op :NoMatchParen<CR>
" nnoremap cop :<C-R>=exists("b:matchup_matchparen_enabled") ? ( (b:matchup_matchparen_enabled == 1) ? 'NoMatchParen': 'DoMatchParen'): 'DoMatchParen'<CR><CR>

