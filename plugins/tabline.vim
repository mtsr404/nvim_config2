function! MyTabLabel(n)
    " タブに表示されるファイルのフルパスを取得
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let buffername = bufname(buflist[winnr - 1])

    " ディレクトリ名とファイル名を抽出
    let filename = fnamemodify(buffername, ':t')
	if filename == ''
		let filename = '[No Name]'
	endif
    let dirname = fnamemodify(buffername, ':p:h:t')


	" 通常のバッファの場合、ディレクトリ名を表示
	let current_buftype = getbufvar('%', '&buftype')
	if current_buftype == ''
		" ディレクトリ名とファイル名を結合
		let tabname = dirname . '/' . filename
	else
		let tabname = filename
	endif


	" バッファが変更されたかどうかをチェック
    let modified = getbufvar(buflist[winnr - 1], '&modified')
    if modified
        " let tabname = '+ ' . tabname
        let tabname .= ' +'
    endif

    " これ使うと常にスペースが入る
    " let tabname .= '%M'

	return tabname

endfunction

" カスタムタブラインをセット
set tabline=%!MyTabLine()



function! MyTabLine()
    let s = ' '  " タブの開始部分にパディングを追加

    for i in range(tabpagenr('$'))
        " 各タブのペイン数を取得
        let wincount = tabpagewinnr(i + 1, '$')

        " タブの選択状態に応じてスタイリングを変更
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " タブラベルの前にスペースを追加
        let s .= '%' . (i + 1) . 'T '
        if wincount > 1
            let s .= wincount . ' '
        endif
        " タブラベルの後にパディングを追加
        let s .= MyTabLabel(i + 1) . ' '
    endfor

    " タブの後の部分を追加
    let s .= '%#TabLineFill#%T'
    return s
endfunction
