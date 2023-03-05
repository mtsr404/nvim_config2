if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

" syntax sync fromstart

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

" disable deoplete for coc
call deoplete#custom#buffer_option('auto_complete', v:false)
