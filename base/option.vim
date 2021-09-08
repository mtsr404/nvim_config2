set shell=/usr/local/bin/zsh

syntax enable
filetype plugin indent on

set formatoptions-=o    " 改行時の自動コメントアウト無効化
set completeopt=menuone " オムニ補完
set ambiwidth=double    " □や○文字が崩れる問題を解決
set autoread            " 外部で変更されたときに検出

set tabstop=4     " 何個分のスペースで1つのタブとしてカウントするか
set softtabstop=0 " タブとスペースのインデントを使い分けないなら0でok"
set shiftwidth=0  " インデントするときの幅 0でtabstopが使われる
set noexpandtab   " タブをタブとして扱う(スペースに展開しない)

set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に前の行の構文をチェックし次の行のインデントを増減する

set number " 行番号
set cursorline  " カーソル行のハイライト

set noswapfile

set wildmode=list:longest,list:full " コマンド候補の補完

set inccommand=split " 文字列置換をインタラクティブに
set showtabline=2 " タブを常時表示

set nofixendofline            " 最後に改行を自動追加しない
set whichwrap=b,s,h,l,<,>,[,] " 改行を超えて移動

set ignorecase
set smartcase

set diffopt+=vertical " 差分表示

if has('termguicolors')
    set termguicolors
endif

set list                      " 不可視文字を表示する
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" 全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

