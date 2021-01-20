set expandtab
set tabstop=4

syntax on

filetype off
filetype plugin indent off
au BufRead,BufNewFile *.go set filetype=go
filetype plugin indent on
syntax on

set noswapfile

set colorcolumn=80
highlight ColorColumn ctermbg=DarkGray
set number
