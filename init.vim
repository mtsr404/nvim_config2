scriptencoding utf-8
set nocompatible

" Pythonのパス
let g:python3_host_prog = fnameescape('/usr/local/bin/python3')
let g:python_host_prog  = fnameescape('/usr/bin/python2')

" Nodeのパス
let g:node_host_prog = '/Users/mtsr404/.nodebrew/current/bin/neovim-node-host'

" deinの関連のパス
let dein_path = 'github.com/Shougo/dein.vim'
let dein_url = 'https://' . dein_path

" Neovim設定ディレクトリ
let g:xdg_dir       = '~/.config2/'
let g:nvim_dir      = g:xdg_dir . 'nvim/'
" プラグインをインストールするディレクトリ
let s:dein_dir      = g:xdg_dir . 'nvim/.cache/dein/'
" dein.vim 本体
let s:dein_repo_dir = g:xdg_dir . 'nvim/.cache/dein/repos/' . dein_path


" dein 初期化 ===============================================================
" dein.vimがなければインストールする
if !isdirectory(expand(s:dein_repo_dir))
  execute '!git clone ' . dein_url s:dein_repo_dir 
endif
" dein.vimをruntimepathへ追加
let &runtimepath = s:dein_repo_dir . "," . &runtimepath

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストファイル
  let s:toml = g:nvim_dir . '/plugins.toml'
  let s:lazy_toml = g:nvim_dir . '/plugins_lazy.toml'
  " プラグインリストを読み込みキャッシュする
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" 未インストールのプラグインがある場合はインストール
if dein#check_install()
  call dein#install()
endif
" End Install plugins =======================================================

runtime! base/*.vim
runtime! plugins/*.vim
runtime! local.vim
