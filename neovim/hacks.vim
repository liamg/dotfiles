
" Tweak the Rg command to exclude vendor and avoid "fuzzy" searching
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg -g '!vendor/' -g '!.git/' -g '!node_modules' --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--exact --delimiter : --nth 4..'}), <bang>0)

