" nvim-typescript
" let g:nvim_typescript#vue_support = 1
" let g:nvim_typescript#signature_complete = 1
" let g:nvim_typescript#suggestions_enabled = 1
" let g:nvim_typescript#diagnostics_enable = 1
" let g:nvim_typescript#default_mappings = 1
" let g:nvim_typescript#max_completion_detail = 25
" let g:nvim_typescript#expand_snippet = 1
"
" denite でエラーを吐くことがある
" その場合以下のファイルのBaseのインポートを書き換える
" from .base import Base
" .config/nvim/.cache/dein/repos/github.com/mhartington/nvim-typescript/rplugin/python3/denite/source/*
