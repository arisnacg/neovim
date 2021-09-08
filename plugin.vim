" Plugins
call plug#begin('C:/Users/Arisna/AppData/Local/nvim/plugged')
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'neovim/nvim-lspconfig'
	Plug 'kabouzeid/nvim-lspinstall'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-lua/completion-nvim'
	" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
	Plug 'morhetz/gruvbox'
	Plug 'hoob3rt/lualine.nvim'
	Plug 'akinsho/bufferline.nvim'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
call plug#end()