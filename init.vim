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
set undodir=$HOME/.vim/undodir
set undofile

" Increment search
set incsearch

" Scroll off
set scrolloff=12

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

" Plugins
call plug#begin('C:/Users/Arisna/AppData/Local/nvim/plugged')
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'hoob3rt/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

" Colorscheme
colorscheme gruvbox

" Tokyo Night
" let g:tokyonight_style = "night"
" let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Gruvbox
let g:gruvbox_transp_bg = 1
let g:gruvbox_italicize_strings = 0

lua << EOS
-- Lua config here
require'lualine'.setup {
  options = {theme = 'gruvbox'},
}

-- Bufferline
local colors = {
   white = "#ebdbb2",
   darker_black = "#232323",
   black = "#282828", --  nvim bg
   black2 = "#2e2e2e",
   one_bg = "#353535",
   one_bg2 = "#3f3f3f",
   one_bg3 = "#444444",
   grey = "#464646",
   grey_fg = "#4e4e4e",
   grey_fg2 = "#505050",
   light_grey = "#565656",
   red = "#fb4934",
   baby_pink = "#cc241d",
   pink = "#ff75a0",
   line = "#2c2f30", -- for lines like vertsplit
   green = "#b8bb26",
   vibrant_green = "#a9b665",
   nord_blue = "#83a598",
   blue = "#458588",
   yellow = "#d79921",
   sun = "#fabd2f",
   purple = "#b4bbc8",
   dark_purple = "#d3869b",
   teal = "#749689",
   orange = "#e78a4e",
   cyan = "#82b3a8",
   statusline_bg = "#2c2c2c",
   lightbg = "#353535",
   lightbg2 = "#303030",
   pmenu_bg = "#83a598",
   folder_bg = "#83a598",
}
local bufferline = require("bufferline")
bufferline.setup {
   options = {
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      buffer_close_icon = "",
      modified_icon = "",
      -- close_icon = "%@NvChad_bufferline_quitvim@%X",
      close_icon = "",
      show_close_icon = true,
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = "thin",
      always_show_bufferline = true,
      diagnostics = false, -- "or nvim_lsp"
      custom_filter = function(buf_number)
         -- Func to filter out our managed/persistent split terms
         local present_type, type = pcall(function()
            return vim.api.nvim_buf_get_var(buf_number, "term_type")
         end)

         if present_type then
            if type == "vert" then
               return false
            elseif type == "hori" then
               return false
            else
               return true
            end
         else
            return true
         end
      end,
   },

   highlights = {
      background = {
         guifg = colors.grey_fg,
         guibg = colors.black2,
      },

      -- buffers
      buffer_selected = {
         guifg = colors.white,
         guibg = colors.black,
         gui = "bold",
      },
      buffer_visible = {
         guifg = colors.light_grey,
         guibg = colors.black2,
      },

      -- for diagnostics = "nvim_lsp"
      error = {
         guifg = colors.light_grey,
         guibg = colors.black2,
      },
      error_diagnostic = {
         guifg = colors.light_grey,
         guibg = colors.black2,
      },

      -- close buttons
      close_button = {
         guifg = colors.light_grey,
         guibg = colors.black2,
      },
      close_button_visible = {
         guifg = colors.light_grey,
         guibg = colors.black2,
      },
      close_button_selected = {
         guifg = colors.red,
         guibg = colors.black,
      },
      fill = {
         guifg = colors.grey_fg,
         guibg = colors.black2,
      },
      indicator_selected = {
         guifg = colors.black,
         guibg = colors.black,
      },

      -- modified
      modified = {
         guifg = colors.red,
         guibg = colors.black2,
      },
      modified_visible = {
         guifg = colors.red,
         guibg = colors.black2,
      },
      modified_selected = {
         guifg = colors.green,
         guibg = colors.black,
      },

      -- separators
      separator = {
         guifg = colors.black2,
         guibg = colors.black2,
      },
      separator_visible = {
         guifg = colors.black2,
         guibg = colors.black2,
      },
      separator_selected = {
         guifg = colors.black2,
         guibg = colors.black2,
      },
      -- tabs
      tab = {
         guifg = colors.light_grey,
         guibg = colors.one_bg3,
      },
      tab_selected = {
         guifg = colors.black2,
         guibg = colors.nord_blue,
      },
      tab_close = {
         guifg = colors.red,
         guibg = colors.black,
      },
   },
}

-- Treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "javascript",
    "json",
    "yaml",
    "dockerfile",
  },
}

-- Nvimtree
local tree_c = require("nvim-tree.config")
local tree_cb = tree_c.nvim_tree_callback
local g = vim.g

g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_allow_resize = 1
g.nvim_tree_auto_close = 0 -- closes tree when it's the last window
g.nvim_tree_auto_ignore_ft = { "dashboard" } -- don't open tree on specific fiypes.
g.nvim_tree_auto_open = 0
g.nvim_tree_disable_netrw = 1
g.nvim_tree_follow = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_gitignore = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_hijack_netrw = 0
g.nvim_tree_indent_markers = 1
g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
g.nvim_tree_side = "left"
g.nvim_tree_tab_open = 0
g.nvim_tree_update_cwd = 1
g.nvim_tree_width = 25
g.nvim_tree_lsp_diagnostics = 0

g.nvim_tree_show_icons = {
   folders = 1,
   -- folder_arrows= 1
   files = 1,
   git = 1,
}

g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "✗",
      untracked = "★",
   },
   folder = {
      -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
      -- arrow_open = "",
      -- arrow_closed = "",
      default = "",
      empty = "", -- 
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
   },
}

g.nvim_tree_bindings = {
   { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb "edit" },
   { key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb "cd" },
   { key = "<C-v>", cb = tree_cb "vsplit" },
   { key = "<C-x>", cb = tree_cb "split" },
   { key = "<C-t>", cb = tree_cb "tabnew" },
   { key = "<", cb = tree_cb "prev_sibling" },
   { key = ">", cb = tree_cb "next_sibling" },
   { key = "P", cb = tree_cb "parent_node" },
   { key = "<BS>", cb = tree_cb "close_node" },
   { key = "<S-CR>", cb = tree_cb "close_node" },
   { key = "<Tab>", cb = tree_cb "preview" },
   { key = "K", cb = tree_cb "first_sibling" },
   { key = "J", cb = tree_cb "last_sibling" },
   { key = "I", cb = tree_cb "toggle_ignored" },
   { key = "H", cb = tree_cb "toggle_dotfiles" },
   { key = "R", cb = tree_cb "refresh" },
   { key = "a", cb = tree_cb "create" },
   { key = "d", cb = tree_cb "remove" },
   { key = "r", cb = tree_cb "rename" },
   { key = "<C->", cb = tree_cb "full_rename" },
   { key = "x", cb = tree_cb "cut" },
   { key = "c", cb = tree_cb "copy" },
   { key = "p", cb = tree_cb "paste" },
   { key = "y", cb = tree_cb "copy_name" },
   { key = "Y", cb = tree_cb "copy_path" },
   { key = "gy", cb = tree_cb "copy_absolute_path" },
   { key = "[c", cb = tree_cb "prev_git_item" },
   { key = "}c", cb = tree_cb "next_git_item" },
   { key = "-", cb = tree_cb "dir_up" },
   { key = "q", cb = tree_cb "close" },
   { key = "g?", cb = tree_cb "toggle_help" },
}

EOS
