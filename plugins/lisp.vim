let g:vlime_leader = ","
" let maplocalleader = '.'


" プラグインの読み込みは正常に行われていたが、
" 初期化処理がなぜか起動時に自動で行われなかった
" そのため、関数の読み込みは行われていたが、
" キーがマッピングされなかった
"
" 以下の初期化処理を明示的に呼ぶことで解決
call vlime#plugin#Setup()


" デフォルトでは`start-vlime.lisp`sbclのパスが適切に解決されなかったので、
" sbclの開始コマンドを作る関数を独自で指定している
let g:vlime_cl_impl = "my_sbcl"
function! VlimeBuildServerCommandFor_my_sbcl(vlime_loader, vlime_eval)
  return ["sbcl",
    \ "--load", 
    \ "/Users/mtsr404/.config2/nvim/.cache/dein/repos/github.com/l04m33/vlime/lisp/start-vlime.lisp"]
endfunction

" :call vlime#server#New(v:true, get(g:, "my_sbcl", v:false))

" 括弧を虹色で表示
let lisp_rainbow=1

autocmd FileType lisp setlocal autoindent

let g:vlime_enable_autodoc = v:true
let g:vlime_window_settings = {'sldb': {'pos': 'belowright', 'vertical': v:true}, 'inspector': {'pos': 'belowright', 'vertical': v:true}, 'preview': {'pos': 'belowright', 'size': v:null, 'vertical': v:true}}
