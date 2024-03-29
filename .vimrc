set nocompatible

syntax on
let g:xml_syntax_folding = 1
set bg=dark

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

set ignorecase
set incsearch
set hlsearch

set nobackup
set nowritebackup
set noswapfile

set nomodeline&

au BufNewFile,BufRead *.bash set filetype=sh
au BufNewFile,BufRead *.config set filetype=xml
au BufNewFile,BufRead *.bas set filetype=basic
au BufNewFile,BufRead *.cls set filetype=basic

au BufNewFile,BufRead *.idl set filetype=thrift
au BufNewFile,BufRead *.json set filetype=javascript

autocmd BufNewFile,BufRead *.pure.erb set filetype=html.eruby

set history=1000

filetype plugin on

nnoremap <leader>; :tabprevious<CR>
nnoremap <leader>' :tabnext<CR>
