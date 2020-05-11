call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" some basics
colorscheme nord
set number relativenumber
set nocompatible 
filetype plugin  on
syntax on 
filetype indent on 
set wildmenu
set nohlsearch
set hidden
set nowrap 
set fdm=manual "enable manual folds
set guiheadroom=0 " fixes terminal emulator issues
set path+=** " searches subfolders
set fillchars=""
highlight Visual cterm=reverse ctermbg=NONE

" plugin config
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:build_dir = '~/Documents/programming/latex'
let g:netrw_banner = 0
let g:netrw_altv = 1

" coc 
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" :<SID>check_back_space() ? "\<TAB>" :coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

let g:coc_global_extensions = [ 'coc-snippers', 'coc-pairs', 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json' ] 

" go to code navigation
nmap <buffer> <leader>gd <Plug>(coc-definition)
nmap <buffer> <leader>gy <Plug>(coc-type-definition)
nmap <buffer> <leader>gi <Plug>(coc-implementation)
nmap <buffer> <leader>gr <Plug>(coc-references)
nnoremap <buffer> <leader>cr :CocRestart

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" sane defaults for vim splits
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

autocmd VimLeave *.tex !texclear %<CR>

" tab settings
set tabstop=8 " copied from some long forgotten stack overflow post 
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" bindings
inoremap jj <ESC>

" move text and maintain formatting, stolen from theprimeagen
vnoremap J :m '>+1<CR>gv=gv 
vnoremap K :m '<-2<CR>gv=gv

" leader commands
let mapleader = " "

map <leader>h <C-w>t<C-w>H
map <leader>k <C-w>t<C-w>K
map <Leader>j :Explore<CR>
map <Leader>tt :vertical :terminal <CR>
map <Leader>p :!compiler %<CR>
map <Leader>v :e ~/.vim/vimrc<CR>
map <Leader>\ :VimtexCompile<CR>
map <leader>t :term zsh<CR>
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader><leader> :Commentary<CR>
