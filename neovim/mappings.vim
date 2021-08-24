" -------------------------------------------------------------------------------------------------
" Key Bindings
" -------------------------------------------------------------------------------------------------

" Quit: close all buffers
nnoremap <C-q> :qall<CR>
vnoremap <C-q> <Esc>:qall<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>l  <Plug>(coc-format-selected)
nmap <leader>l  <Plug>(coc-format-selected)
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Tree/files/searching
nnoremap <silent> <C-n> :NvimTreeToggle<CR>
nnoremap <silent> <leader>r :NvimTreeRefresh<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <C-b> :Buffers<CR>

" Terminal
nnoremap <silent> <leader>t <C-w>n:te<CR>i

nnoremap <leader>q :GoDebugTest<CR>
nnoremap <leader>w :GoDebugContinue<CR>
nnoremap <leader>e :GoDebugStep<CR>
nnoremap <leader>y :GoDebugNext<CR>
nnoremap <leader>b :GoDebugBreakpoint<CR>

nnoremap <leader>vt :call DebugCurrentTest()<CR>

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

