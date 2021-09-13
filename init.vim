" Use .vimrc on spesific project
set exrc

" Relative line number
set relativenumber
set nu

" No hightlight search
set nohlsearch

" Hide buffer on background
set hidden

" No error bell/sound
set noerrorbells

" No Wrap
set nowrap

" No swap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Increment search
set incsearch

" Scroll off
set scrolloff=10

" Term GUI Colors
set termguicolors

" Tab
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Leader key
let mapleader = " "

" Mapping insert mode
imap jj <Esc>
imap jj <Esc>

" Mapping visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Import Plugin
runtime ./plugin.vim
