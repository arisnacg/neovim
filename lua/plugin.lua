local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  install = {
    missing = true,
  },
}

require("lazy").setup({
  -- Colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- Icons
  'nvim-tree/nvim-web-devicons',
   -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
  },
  -- Auto pair
  'windwp/nvim-autopairs',
  -- Vim Suround
  'tpope/vim-surround',
  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    opts = {},
  },
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
  },
  -- Tab
  'kdheepak/tabline.nvim',
  -- Comment
  { 'numToStr/Comment.nvim', opts = {} },
}, opts)
