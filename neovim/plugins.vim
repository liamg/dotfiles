" -------------------------------------------------------------------------------------------------
" Plugins
" -------------------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'hashivim/vim-terraform'
#Plug 'puremourning/vimspector'
Plug 'tpope/vim-fugitive'
Plug 'aquasecurity/vim-tfsec'
call plug#end()


