nnoremap    [Denite]   <Nop>
nmap <Space>d [Denite]

highlight myDeniteMatchText cterm=NONE guifg=#f6a3a3 guibg=NONE
highlight myDeniteInsert cterm=NONE guifg=NONE guibg=#3d5066
highlight myDeniteNormal cterm=NONE guifg=White guibg=#7b6980


call denite#custom#option('default', 'highlight_matched_char', 'myDeniteMatchText')
call denite#custom#option('default', 'highlight_mode_insert', 'myDeniteInsert')
call denite#custom#option('default', 'highlight_mode_normal', 'myDeniteNormal')
call denite#custom#option('default', 'highlight_matched_range', 'myDeniteMatchText')

call denite#custom#source('_', 'matchers', ['matcher_substring'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', ['.git/', '__pycache__/'])

call denite#custom#option('default', 'split', 'tab')
call denite#custom#option('default', 'smartcase', v:true)

call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nogroup', '-g',''])
call denite#custom#source('file_rec', 'matchers', ['matcher_substring', 'matcher_ignore_globs'])

call denite#custom#alias('source', 'all_file_rec', 'file_rec')
call denite#custom#var('all_file_rec', 'command', ['ag',  '--follow', '--skip-vcs-ignores', '--hidden',  '-g', ''])
call denite#custom#source('all_file_rec', 'matchers', ['matcher_substring'])

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'default_opts', ['--follow','--smart-case', '--ignore=.git', '--ignore=tags','-i', '--vimgrep'])

call denite#custom#alias('source', 'all_grep', 'grep')
call denite#custom#var('all_grep', 'command', ['ag','--skip-vcs-ignores'])
call denite#custom#var('grep', 'default_opts', ['--follow','--smart-case', '--ignore=.git', '--ignore=tags','-i', '--vimgrep'])

"denite時に使用するキーマップ
call denite#custom#map('grep', 'jj', '<denite:enter_mode:normal>','noremap')

call denite#custom#map('insert', '<C-j>', '<denite:enter_mode:normal>', 'noremap')
"ESCキーでdeniteを終了
call denite#custom#map('normal', '<esc>', '<denite:quit>', 'noremap')
"C-N,C-Pで上下移動
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
"splitで開く
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
"削除
call denite#custom#map('insert', '<C-b>', '<denite:delete_char_before_caret>', 'noremap')

call denite#custom#map('normal', 'C', '<denite:do_action:show_columns>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:wincmd:k>', 'noremap')

call denite#custom#option('default', 'use_default_mappings', 'false')

call denite#custom#map('_', '<CR>', '<denite:do_action:default>', 'noremap')
call denite#custom#map('_', '<Tab>', '<denite:choose_action>', 'noremap')

nnoremap <C-e> :DeniteProjectDir file_rec -quit -default-action=tabopen <CR>
nnoremap [Denite]e :DeniteCursorWord -path=`denite#util#path2project_directory(getcwd(),"")`  file_rec -quit -default-action=tabopen <CR>

nnoremap [Denite]<Space> :Denite 

nnoremap [Denite]ae :DeniteProjectDir all_file_rec -quit -default-action=tabopen <CR>

" nnoremap [Denite]s :Denite sql_tables<CR>
nnoremap <silent> [Denite]h :<C-u>Denite curstr/altr/help -default-action=tabopen<CR>
nnoremap [Denite]b :Denite buffer -default-action=tabopen <CR>

nnoremap [Denite]m :Denite file_mru -default-action=tabopen <CR>

nnoremap [Denite]r :Denite -resume <CR>
" Git Diff ---------------------------------------------------------------------------------------------------------------------
nmap <silent> <Space>gDm :Denite git_diffs:origin/master...HEAD -winheight=10 -split=horizontal -mode=insert -buffer-name=difffiles -post-action=quit -auto-resume<CR>
nmap <silent> <Space>gDM :Denite git_diffs:origin/master..HEAD -winheight=10 -split=horizontal -mode=insert -buffer-name=difffiles -post-action=quit -auto-resume<CR>

" for Code Review -----------------------------------------------
function! CodeReviewFunc(targetBranch)
    execute("Denite git_diffs:origin/".a:targetBranch."..HEAD -winheight=10 -split=horizontal -mode=insert -buffer-name=difffiles -post-action=quit -auto-resume")
endfunction
command! -nargs=1 CodeReview call CodeReviewFunc(<q-args>)

nmap <silent> <Space>gR    :Denite -resume -winheight=10 -split=horizontal -mode=insert -buffer-name=difffiles -auto-resume -post-action=quit<CR>
nmap <silent> <Space>gn     :Denite -resume -cursor-pos=+1 -immediately -buffer-name=difffiles -auto-resume -post-action=quit<CR>
nmap <silent> <Space>g<S-n> :Denite -resume -cursor-pos=-1 -immediately -buffer-name=difffiles -auto-resume -post-action=quit<CR>
nmap <Space>gf :set foldmethod=diff<CR>

" nmap gD :Denite git_diffs:master -winheight=`20*winheight(0)/100` -split=horizontal -no-quit -refresh <CR>

function! GinaCompare(targetFileName)
	execute('Gina compare master:'.a:TargetFileName)
endfunction

" Git Branch----------------------------------------------------------------------------------------------------------------
nmap <Space>gb :Denite git_branches<CR>



function! DeniteOutline()
	setlocal splitright
	Denite outline -auto-preview -vertical-preview -mode=normal
	setlocal nosplitright
endfunction
nnoremap [Denite]o :call DeniteOutline()<CR>

"nnoremap <silent> <C-F> :DeniteProjectDir grep -auto-preview <CR>
nnoremap <silent> <C-f> :DeniteProjectDir grep  -default-action=tabopen<CR>
nnoremap <silent> [Denite]f :DeniteCursorWord -path=`denite#util#path2project_directory(getcwd(),"")` grep -default-action=tabopen<CR>
nnoremap <silent> [Denite]af :DeniteCursorWord grep -default-action=tabopen<CR>
nnoremap <silent> [Denite]af :DeniteProjectDir all_grep  <CR>
nnoremap <silent> [Denite]d :Denite dein  <CR>

nnoremap <silent> [Denite]ce :Denite file/rec -quit -default-action=tabopen -path=~/dotfiles/nvim <CR>
nnoremap <silent> [denite]s :<C-u>Denite alias<CR>

nmap [Denite]k :Denite keymap<CR>


" call denite#custom#var('sql_tables', 'baseCommand',  ['mysql -u user_name --password=password database_name -e {0}'])

" test ========================================================================================================================
"command TestSuitMergeable !cd ~/Projects/ekiten-micro && docker-compose exec -T app phpunit --no-coverage --testsuit=mergeable --exclude-group=slow,veryslow --colors --stop-on-failure
function! ExecuteInBottomPane(commandStr)
	setlocal splitbelow
	new 
	execute a:commandStr 
	setlocal nosplitbelow
endfunction

" Usage
" edit =/.execute_in_docker
" nmap <Space>tl :Denite execute_in_docker:"":"cd DockerComposeDirectory":ContainerName<cr>


call denite#custom#action('file', 'qfreplace', {context ->  DeniteQfreplace(context)})
call denite#custom#map('normal', 'r', '<denite:do_action:qfreplace>', 'noremap')
function! DeniteQfreplace(context) abort
    tabnew
    let qflist = []
    for target in a:context['targets']
        if !has_key(target, 'action__line') || !has_key(target, 'action__text')
            continue
        endif
        let dict = {'filename': target['action__path'], 'lnum': target['action__line'], 'text': target['action__text']}
        call add(qflist, dict)
    endfor
    if len(qflist) == 0
        return
    endif
    call setqflist(qflist)
    call qfreplace#start('')
    only
endfunction
