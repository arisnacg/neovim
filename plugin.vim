" Plugins
call plug#begin('~/.config/nvim/plugged')
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'neovim/nvim-lspconfig'
	Plug 'kabouzeid/nvim-lspinstall'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-lua/completion-nvim'
  Plug 'steelsojka/completion-buffers'
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
	"Plug 'morhetz/gruvbox'
	Plug 'hoob3rt/lualine.nvim'
	Plug 'akinsho/bufferline.nvim'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'karb94/neoscroll.nvim'
  Plug 'jdhao/better-escape.vim'
  Plug 'terrortylor/nvim-comment'
call plug#end()

" Quick Configuration

" Autcomplete
autocmd BufEnter * lua require'completion'.on_attach()

lua << EOF
vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'buffers' } },
  },
}
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Better escape
let g:better_escape_shortcut = 'jj'

" Nvim autopairs
lua require('nvim-autopairs').setup{}

" Git sign
lua require('gitsigns').setup()

" Comment
lua require('nvim_comment').setup()

