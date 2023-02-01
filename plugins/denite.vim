nnoremap    [Denite]   <Nop>
nmap <Space>d [Denite]

" https://secret-garden.hatenablog.com/entry/2021/05/16/152715

highlight myDeniteMatchText cterm=NONE guifg=#f6a3a3 guibg=NONE
highlight myDeniteInsert cterm=NONE guifg=NONE guibg=#3d5066
highlight myDeniteNormal cterm=NONE guifg=White guibg=#7b6980

let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7

" Change denite default options
call denite#custom#option('default', {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ })


function! MyDeniteReplace(context)
	let qflist = []
	for target in a:context['targets']
		if !has_key(target, 'action__path') | continue | endif
		if !has_key(target, 'action__line') | continue | endif
		if !has_key(target, 'action__text') | continue | endif

		call add(qflist, {
					\ 'filename': target['action__path'],
					\ 'lnum': target['action__line'],
					\ 'text': target['action__text']
					\ })
	endfor
	call setqflist(qflist)
	call qfreplace#start('')
endfunction

call denite#custom#action('file', 'qfreplace', function('MyDeniteReplace'))






" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nnoremap <silent><buffer><expr> <CR>
				\ denite#do_map('do_action')
	nnoremap <silent><buffer><expr> d
				\ denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p
				\ denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> q
				\ denite#do_map('quit')
	nnoremap <silent><buffer><expr> i
				\ denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> <Space>
				\ denite#do_map('toggle_select').'j'

	" deniteバッファでスプリット
	nnoremap <silent><buffer><expr> ss
				\ denite#do_map('do_action','split')
	nnoremap <silent><buffer><expr> sv
				\ denite#do_map('do_action','vsplit')

	nnoremap <silent><buffer><expr> r
				\ denite#do_map('do_action', 'qfreplace')



	" syntax sync fromstart
	" syntax match slash /\//
	" highlight link slash Error

	"  qfreplace ========================================================================================
	" function! DeniteQfreplace(context) abort
	" 	tabnew
	" 	let qflist = []
	" 	for target in a:context['targets']
	" 		if !has_key(target, 'action__line') || !has_key(target, 'action__text')
	" 			continue
	" 		endif
	" 		let dict = {'filename': target['action__path'], 'lnum': target['action__line'], 'text': target['action__text']}
	" 		call add(qflist, dict)
	" 	endfor
	" 	if len(qflist) == 0
	" 		return
	" 	endif
	" 	call setqflist(qflist)
	" 	call qfreplace#start('')
	" 	only
	" endfunction

	" call denite#custom#action('file', 'qfreplace', {context ->  DeniteQfreplace(context)})
	"
	" call denite#custom#action('source/file', 'test',
	"		\ {context -> execute('let g:bar = 1')})
	
	" call denite#custom#action('file', 'qfreplace', {context -> execute('let g:bar = 1')})
	"
	" 
	" nnoremap <silent><buffer><expr> f 
	"			\ denite#do_map('do_action', 'quickfix')


	" call denite#custom#action('file', 'test2',
	"		\{context -> denite#do_action(
	"		\	context, 'open', context['targets'])
	" 		})
	" 
	" 
	" call denite#custom#action('file', 'test', {context -> execute("echo 'testtest'")})
	" nnoremap <silent><buffer><expr> t
	"			\ denite#do_map('do_action','test')



	"  ========================================================================================

endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
	imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)

    augroup ftplugin-my-denite
        autocmd! * <buffer>
       " denite-filter 用のキーマッピング
       " NOTE: このタイミングじゃないとキーマッピングが反映されない
       " フィルタリング中に Enter を押すと選択されている候補のデフォルトアクションを実行する
        autocmd InsertEnter <buffer> imap <silent><buffer> <CR> <ESC><CR><CR>
       " インサートを抜けた時に自動的にフィルタウィンドウを閉じる
        autocmd InsertEnter <buffer> inoremap <silent><buffer> <Esc> <Esc><C-w><C-q>:<C-u>call denite#move_to_parent()<CR>
    augroup END

	" フィルタバッファでは自動補完を無効にしておく
    call deoplete#custom#buffer_option('auto_complete', v:false)


	" フィルタバッファでC-cでDenite終了
	" imap <silent><buffer> <Esc> <Esc>q:call denite#move_to_parent()<CR> 
	imap <silent><buffer> <C-c> <Esc>q:call denite#move_to_parent()<CR>

	" ステータスラインに file/rec(10/100) のような候補数を表示させる
	setlocal statusline=%!denite#get_status('sources')

	"  <C-p><C-n>で候補の選択を移動させる
	inoremap <silent><buffer> <C-n> <Esc>
				\:call denite#move_to_parent()<CR>
				\:call cursor(line('.')+1,0)<CR>
				\:call denite#move_to_filter()<CR>A
	inoremap <silent><buffer> <C-p> <Esc>
				\:call denite#move_to_parent()<CR>
				\:call cursor(line('.')-1,0)<CR>
				\:call denite#move_to_filter()<CR>A


	nnoremap <silent><buffer> <C-n> <Esc>
				\:call denite#move_to_parent()<CR>
				\:call cursor(line('.')+1,0)<CR>
				\:call denite#move_to_filter()<CR>A
	nnoremap <silent><buffer> <C-p> <Esc>
				\:call denite#move_to_parent()<CR>
				\:call cursor(line('.')-1,0)<CR>
				\:call denite#move_to_filter()<CR>A


	inoremap <silent><buffer> <C-d> <Esc>
				\:call denite#move_to_parent()<CR>
				\<C-d>
				\:call denite#move_to_filter()<CR>A
	inoremap <silent><buffer> <C-u> <Esc>
				\:call denite#move_to_parent()<CR>
				\<C-u>
				\:call denite#move_to_filter()<CR>A


	" フィルタバッファで <CR> すると候補を実行する
	inoremap <silent><buffer> <CR> <Esc>
				\:call denite#move_to_parent()<CR>
				\<CR>


	" フィルタバッファからDeniteバッファに移動
	inoremap <silent><buffer> <C-j> <Esc>
				\:call denite#move_to_parent()<CR>


endfunction

" Change file/rec command.
call denite#custom#var('file/rec', 'command',
			\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" For ripgrep
" " Note: rg is faster than ag
" call denite#custom#var('file/rec', 'command',
"			\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
" " For Pt(the platinum searcher)
" " NOTE: It also supports windows.
" call denite#custom#var('file/rec', 'command',
"			\ ['pt', '--follow', '--nocolor', '--nogroup',
"			\  (has('win32') ? '-g:' : '-g='), ''])
" For python script scantree.py
" Read bellow on this file to learn more about scantree.py
call denite#custom#var('file/rec', 'command',
			\ ['scantree.py', '--path', ':directory'])

" Change matchers.
call denite#custom#source(
			\ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source(
			\ 'file/rec', 'matchers', ['matcher/cpsm'])

" Change sorters.
call denite#custom#source(
			\ 'file/rec', 'sorters', ['sorter/sublime'])

" Change default action.
call denite#custom#kind('file', 'default_action', 'split')

" Add custom menus
let s:menus = {}

let s:menus.zsh = {
			\ 'description': 'Edit your import zsh configuration'
			\ }
let s:menus.zsh.file_candidates = [
			\ ['zshrc', '~/.config/zsh/.zshrc'],
			\ ['zshenv', '~/.zshenv'],
			\ ]

let s:menus.my_commands = {
			\ 'description': 'Example commands'
			\ }
let s:menus.my_commands.command_candidates = [
			\ ['Split the window', 'vnew'],
			\ ['Open zsh menu', 'Denite menu:zsh'],
			\ ['Format code', 'FormatCode', 'go,python'],
			\ ]

call denite#custom#var('menu', 'menus', s:menus)

" Ag command on grep source
call denite#custom#var('grep', {
			\ 'command': ['ag'],
			\ 'default_opts': ['-i', '--vimgrep'],
			\ 'recursive_opts': [],
			\ 'pattern_opt': [],
			\ 'separator': ['--'],
			\ 'final_opts': [],
			\ })

" Specify multiple paths in grep source
"call denite#start([{'name': 'grep',
"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])

" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
			\ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/rec/py', 'file/rec')
call denite#custom#var('file/rec/py', 'command',
			\ ['scantree.py', '--path', ':directory'])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
			\ [ '.git/', '.ropeproject/', '__pycache__/',
			\   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])




" Custom action
" Note: denite#custom#action() with lambda parameter is only available
"       in NeoVim; not supported in Vim8.
call denite#custom#action('file', 'test',
			\ {context -> execute('let g:foo = 1')})
call denite#custom#action('file', 'test2',
			\ {context -> denite#do_action(
			\  context, 'open', context['targets'])})
" Source specific action
call denite#custom#action('source/file', 'test',
			\ {context -> execute('let g:bar = 1')})



" :Denite のデフォルトの設定
let s:denite_default_options = {}


" 絞り込んだワードをハイライトする
call extend(s:denite_default_options, {
			\   'highlight_matched_char': 'None',
			\   'highlight_matched_range': 'Underlined',
			\   'match_highlight': v:true,
			\})

" denite を上に持っていく
" call extend(s:denite_default_options, {
"			\   'direction': "top",
"			\   'filter_split_direction': "top",
"			\})

" フィルタのプロンプトを設定
call extend(s:denite_default_options, {
			\   'prompt': '> ',
			\})

" 大文字小文字を区別してフィルタする
call extend(s:denite_default_options, {
			\   'smartcase': v:true,
			\})

" ステータスラインに入力を表示しないようにする
" call extend(s:denite_default_options, {
			"\    'statusline': v:true,
"\})


" デフォルトで絞り込みウィンドウを開く
call extend(s:denite_default_options, {
			\   'start_filter': v:true,
			\})


call denite#custom#option('default', s:denite_default_options)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" kind の設定

" ファイルを開く際のデフォルトアクションを tabswitch にする
call denite#custom#kind('file', 'default_action', 'tabswitch')

let s:ignore_globs = [ '.git/', '.ropeproject/', '__pycache__/',
			\   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', 'node_modules', 'vendor']


call denite#custom#alias('source', 'file/rec/giteco', 'file/rec')
" そもそも ag のレベルで検索対象からはずす
call denite#custom#var('file/rec/giteco', 'command',[
      \ 'ag',
      \ '--follow',
      \ ] + map(deepcopy(s:ignore_globs), { k, v -> '--ignore=' . v }) + [
      \ '--nocolor',
      \ '--nogroup',
      \ '-g',
      \ ''
      \ ])


nnoremap <C-e> :DeniteProjectDir file/rec/giteco<CR>
nnoremap <C-f> :DeniteProjectDir grep<CR>
nnoremap [Denite]ae :DeniteProjectDir file/rec<CR>
nnoremap [Denite]af :DeniteProjectDir grep<CR>

