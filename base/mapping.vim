inoremap jj <ESC>
tnoremap jj <C-\><C-n>

nnoremap <C-h> ^
nnoremap <C-l> $
vnoremap <C-h> ^
vnoremap <C-l> $
onoremap <C-h> ^
onoremap <C-l> $

noremap ; :
"nnoremap : ; 

noremap x "_x

noremap <C-n> :noh<CR>

noremap! <C-v> <C-r>+

if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" Pane  ------------------------------------------------------
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H


nnoremap so :only<cr>
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>
nnoremap sr <C-w>r " paneを逆順に

call submode#enter_with('pane_size', 'n', '', 's>', '<C-w>>')
call submode#enter_with('pane_size', 'n', '', 's<', '<C-w><')
call submode#enter_with('pane_size', 'n', '', 's+', '<C-w>+')
call submode#enter_with('pane_size', 'n', '', 's-', '<C-w>-')
call submode#map('pane_size', 'n', '', '>', '<C-w>>')
call submode#map('pane_size', 'n', '', '<', '<C-w><')
call submode#map('pane_size', 'n', '', '+', '<C-w>+')
call submode#map('pane_size', 'n', '', '-', '<C-w>-')

" Tab ------------------------------------------------------
nnoremap    [Tab]   <Nop>
nmap    t [Tab]

noremap [Tab]n :tabm +1

" Tab jump
" t1 で1番左のタブ、t2 で左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tab]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc 新しいタブを一番右に作る
map <silent> [Tab]c :tablast <bar> tabnew<CR>

call submode#enter_with('tab', 'n', '', '[Tab]n', ':tabnext<CR>')
call submode#enter_with('tab', 'n', '', '[Tab]p', ':tabprevious<CR>')
call submode#map('tab', 'n', '', 'n', ':tabnext<CR>')
call submode#map('tab', 'n', '', 'p', ':tabprevious<CR>')

call submode#enter_with('tabm', 'n', '', 'Tn', ':tabm +1<CR>')
call submode#enter_with('tabm', 'n', '', 'Tp', ':tabm -1<CR>')
call submode#map('tabm', 'n', '', 'n', ':tabm +1<CR>')
call submode#map('tabm', 'n', '', 'p', ':tabm -1<CR>')

" tq タブを閉じる、閉じたら左に移動
map <silent> [Tab]q :<C-u>call <SID>tabclose_c()<CR>
function! s:tabclose_c() abort
    if tabpagenr('$') == 1
        qa
    endif
    if tabpagenr() <= 1
        tabclose
    else
        " close current tab and open left tab
        tabprevious
        +tabclose
    endif
endfunction
nnoremap <silent> <Plug>(tabclose_c) :<C-u>call <SID>tabclose_c()<CR>



" clipboard ----------------------------------------------
set clipboard=unnamedplus

" move in command
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <C-b>



" Substitute ---------------------------------------------
nnoremap [substitute] <Nop>
nmap <Space>s [substitute]
vnoremap [substitute] <Nop>
vmap <Space>s [substitute]

let s:CURSOR_KEY = '{cursor}'
let s:REGISTER_KEY = '{register}'
let s:WORD_KEY = '{word}'
function! s:generate_cmd(cmd_pattern, is_visual) abort
    let word = expand('<cword>')
    let replaced_word = substitute(a:cmd_pattern, s:WORD_KEY, word, 'g')
    let register = @"
    let alter_register = repeat('x', len(register))
    let alter_replaced_register = substitute(replaced_word, s:REGISTER_KEY, alter_register, 'g')
    let cursor_pos = matchend(alter_replaced_register, s:CURSOR_KEY)
    let deleted_cursor = substitute(replaced_word, s:CURSOR_KEY, '', '')
    let result = substitute(deleted_cursor, s:REGISTER_KEY, register, 'g') . repeat("\<Left>", len(alter_replaced_register) - cursor_pos)
    " a\<BS> is for inccommand
    let result = substitute(result, "\n", '\\n', 'g') . "a\<BS>"
    return a:is_visual ? result : substitute(result, ':\zs', "\<C-u>", '')
endfunction

nnoremap <expr> [substitute]f <SID>generate_cmd(':%s/\v{cursor}', 0)
vnoremap <expr> [substitute]f <SID>generate_cmd(':s/\v%V{cursor}%V', 1)
vnoremap [substitute]c :s/\%V_\(.\)\%V/\u\1/g

