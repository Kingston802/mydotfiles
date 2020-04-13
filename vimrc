if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
call plug#end()

" some basics
set number relativenumber
set nocompatible 
filetype plugin  on
syntax on 
filetype indent on 
set wildmenu
set nohlsearch
set hidden
set nowrap 
set clipboard+=unnamedplus
set fdm=manual
set guiheadroom=0 " fixes terminal emulator issues
set path+=** " searches subfolders
set fillchars=""

set viminfo+=n~/.vim/viminfo

" plugin config
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:build_dir = '~/Documents/programming/latex'
let g:netrw_banner = 0
let g:netrw_altv = 1

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" sane defaults for vim splits
set splitbelow splitright

autocmd VimLeave *.tex !texclear %<CR>

" tab settings
set tabstop=8 " copied from some long forgotten stack overflow post 
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" bindings
inoremap jj <ESC>

" leader commands
let mapleader = " "

map <Leader>p :!compiler %<CR>
map <Leader>v :e ~/.vim/vimrc<CR>
map <Leader>j :sp<CR> 
map <Leader>l :vs<CR> 
map <Leader>\ :VimtexCompile<CR>
map <leader>t :term zsh<CR>
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader><leader> :Commentary<CR>

