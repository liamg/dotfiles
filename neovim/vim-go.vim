" ------------------------------------------------------------
" vim-go tweaks
"-------------------------------------------------------------
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" fix for gopls crashing
let g:go_auto_type_info = 0

" highlight same variable across buffer
let g:go_auto_sameids = 0

" go debug layout
let g:go_debug_windows = {
			\ 'vars':       'rightbelow 60vnew',
			\ 'stack':      'rightbelow 10new',
\ }


