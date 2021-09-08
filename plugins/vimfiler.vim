nnoremap <silent> <Space>fb :<C-u>call <SID>vimfiler_toggle('VimFilerBufferDir')<CR>
nnoremap <silent> <Space>fp :<C-u>call <SID>vimfiler_toggle('VimFilerCurrentDir')<CR>

call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ })

function! s:vimfiler_toggle(filerCommand) abort
	execute a:filerCommand . ' -no-quit -split -toggle -winwidth=70'
    if &filetype !=? 'vimfiler'
        return
    endif
    let alter_buffer_name = bufname('#')
    if alter_buffer_name ==? ''
        return
    endif
    call search(alter_buffer_name)
endfunction

let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = ['^\.DS_Store$']
let g:vimfiler_force_overwrite_statusline = 0 

let s:close_and_open = {'is_selectable' : 1}
function! s:close_and_open.func(candidates)
	quit
	for candidate in a:candidates
		execute 'tabedit '. candidate.action__path
	endfor
endfunction
call unite#custom_action('file', 'close_and_open', s:close_and_open)
unlet s:close_and_open


let g:vimfiler_no_default_key_mappings = 1 

autocmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings()
    setlocal nonumber
    setlocal sidescrolloff=0
	nnoremap <silent><buffer><expr> <Enter> vimfiler#do_action('close_and_open')
 
    nmap <buffer> o <Plug>(vimfiler_expand_or_edit)
    nmap <buffer> O <Plug>(vimfiler_expand_tree_recursive)
 
    nmap <buffer> j <Plug>(vimfiler_loop_cursor_down)
    nmap <buffer> k <Plug>(vimfiler_loop_cursor_up)
    nmap <buffer> l <Plug>(vimfiler_smart_l)
    nmap <buffer> h <Plug>(vimfiler_smart_h)
 
    nmap <buffer> gg <Plug>(vimfiler_cursor_top)
    nmap <buffer> q <Plug>(vimfiler_exit)
 
    nmap <buffer> a  <Plug>(vimfiler_choose_action)
    nmap <buffer> yp <Plug>(vimfiler_yank_full_path)
	nmap <buffer> t  <Plug>(vimfiler_toggle_safe_mode)
 
    nmap <buffer> sv <Plug>(vimfiler_split_edit_file)
 
    nmap <buffer> dd <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_delete_file)
    nmap <buffer> df <Plug>(vimfiler_delete_file)
    
 
	nmap <buffer> cp <Plug>(vimfiler_copy_file)
 
    nmap <buffer> mv <Plug>(vimfiler_rename_file)
    nmap <buffer> md <Plug>(vimfiler_make_directory)
    nmap <buffer> mf <Plug>(vimfiler_new_file)

	nmap <buffer><nowait> sj <Plug>(vimfiler_toggle_mark_current_line)
	nmap <buffer><nowait> sa <Plug>(vimfiler_toggle_mark_all_lines)

endfunction

 
