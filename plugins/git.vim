nnoremap    [Git]   <Nop>
nmap <Space>g [Git]
" fugitive =======================================================================================================
nnoremap [Git]s :Git<cr>

nnoremap [Git]d<space> :Gdiff<space>
nnoremap [Git]d<cr> :Gdiff<cr>
nnoremap [Git]dm :Gdiff master<cr>
" nnoremap [Git]B :Gina blame<cr>

nnoremap [Git]a :!git add -A<cr>
nnoremap [Git]p :!git push origin HEAD

" https://github.com/tpope/vim-fugitive/issues/425
function! Get_git_root()
    if exists('*fugitive#repo')
	try
	    return fugitive#repo().tree()
	catch
	endtry
    endif
    let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
    return v:shell_error ? '' : root
endfunction
command! -nargs=1 GDiffBranch call GDiffBranch(<q-args>)

" ----------------------------------------------------------------------------
" DiffRev
" ----------------------------------------------------------------------------
let s:git_status_dictionary = {
            \ "A": "Added",
            \ "B": "Broken",
            \ "C": "Copied",
            \ "D": "Deleted",
            \ "M": "Modified",
            \ "R": "Renamed",
            \ "T": "Changed",
            \ "U": "Unmerged",
            \ "X": "Unknown"
            \ }
function! s:get_diff_files(rev)
  let list = map(split(system(
              \ 'git diff --name-status '.a:rev), '\n'),
              \ '{"filename":matchstr(v:val, "\\S\\+$"),"text":s:git_status_dictionary[matchstr(v:val, "^\\w")]}'
              \ )
  call setqflist(list)
  copen
endfunction

command! -nargs=1 DiffRev call s:get_diff_files(<q-args>)


