nmap <Space>l [lsp]

nmap [lsp]b <Plug>(coc-definition)
nmap [lsp]t <Plug>(coc-type-definition)
nmap [lsp]i <Plug>(coc-implementation)
nmap [lsp]r <Plug>(coc-references)
nmap [lsp]c :CocRestart<CR>

" Remap for rename current word
nmap [lsp]<S-r> <Plug>(coc-rename)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Use K for show documentation in preview window
nnoremap <C-k>  :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if &filetype == 'vim'
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

let g:coc_global_extensions = [
      \'@yaegassy/coc-intelephense',
      \'coc-json', 
      \'coc-tsserver', 
      \'coc-vetur', 
\]
