
set number! relativenumber!
set tabstop=4
set shiftwidth=4
set fcs=eob:\ 
set noswapfile

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

filetype plugin on

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/colours.vim
source ~/.config/nvim/vim-go.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/startify.vim
source ~/.config/nvim/tree.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/snippets.vim
source ~/.config/nvim/vimspector.vim


