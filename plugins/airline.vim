let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#readonly#enabled = 0
let g:airline_branch_prefix = '⭠ '
let g:airline#extensions#readonly#symbol = '⭤ '
let g:airline_section_b =
        \ '%{airline#extensions#branch#get_head()}' .
        \ '%{""!=airline#extensions#branch#get_head()?("  " . g:airline_left_alt_sep . " "):""}' .
        \ '%t%( %M%)'
let g:airline_section_c = ''

let g:airline_highlighting_cache=1
