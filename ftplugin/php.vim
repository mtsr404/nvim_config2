if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

inoremap <buffer> j- ->

setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab

