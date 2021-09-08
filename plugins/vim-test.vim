" let test#php#minitest#file_pattern = '*'


" vim-test.vim
function! DockerTransform(cmd) abort
	let l:docker_cmd = a:cmd
	if a:cmd =~ "app/[^ ]*.php"
		let l:docker_cmd = substitute( a:cmd, 'app\/\([^ ]*\).php', 'tests/Unit/\1Test.php','g')
	endif

    return join(['cd ~/Archives/projects/h2/smao-server && docker-compose exec php-fpm ' , 
				\ substitute(l:docker_cmd,'/Users/mtsr404/Archives/projects/h2/smao-server/','/var/www/html/','g')])
endfunction

let test#strategy = 'neovim'
let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#transformation = 'docker'
let g:test#php#phpunit#executable = './vendor/bin/phpunit --no-coverage --stop-on-failure'
let g:test#php#phpunit#file_pattern = '\v.*\.php'


nmap <Space>tt :TestFile<CR>

function! JumpTestFile() abort
	if expand('%') =~ "app"
		execute ":tabnew " .  substitute(expand('%'), 'app\/\([^ ]*\).php', 'tests/Unit/\1Test.php','g')
	elseif expand('%') =~ "tests/Unit"
		execute ":tabnew " .  substitute(expand('%'), 'tests\/Unit/\([^ ]*\)Test.php', 'app/\1.php','g')
	else
		echomsg 'jump target not found'
	endif
endfunction


nnoremap <Space>tj :<C-u>call JumpTestFile()<CR>
nnoremap <Space>ta :TestSuite<CR>

" nmap <Space>tj <Plug>(altr-forward)
