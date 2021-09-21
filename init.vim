set exrc
" Use .vimrc on spesific project

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
set wrap

" No swap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Increment search
set incsearch

" Sign column
set signcolumn=yes

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

" Edit my vimrc
nnoremap <leader>rc :e $MYVIMRC<CR>

" Source my vimrc
nnoremap <leader>rv :source %<CR>

" Write file
nnoremap <leader>wf :w<CR>
nnoremap <leader>wq :wq<CR>

" Quit vim
nnoremap <leader>qq :q!<CR>

" Mapping insert mode
inoremap jj <ESC>
inoremap JJ <ESC>

" Yank until the of the line
nnoremap Y y$

" Keep the cursor in center when searching
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J JmzJ`z

" Undo break point
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap } }<c-g>u
inoremap ] ]<c-g>u
inoremap ) )<c-g>u
inoremap : :<c-g>u

" Jumpoint mutation: back the exact line after relative jumping
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving text in every mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==<ins>
inoremap <C-k> <esc>:m .-2<CR>==<ins>
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Mapping visual mode
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Select all
nnoremap <C-a> gg<S-v>G

" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Split window
nnoremap tv :svplit<Return><C-w>w
nnoremap ts :vsplit<Return><C-w>w

" Move window
nnoremap th <C-w>h
nnoremap tk <C-w>k
nnoremap tj <C-w>j
nnoremap tl <C-w>l
" Resize window
nnoremap t<left> <C-w><
nnoremap t<right> <C-w>>
nnoremap t<up> <C-w>+
nnoremap t<down> <C-w>-

" Scrolling
nmap <C-j> <C-d>
nmap <C-k> <C-u>

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Add a line without insert mode
nnoremap <silent><leader>o :set paste<CR>m`O<esc>``:set nopaste<CR>

" Import Plugin
runtime ./plugin.vim

