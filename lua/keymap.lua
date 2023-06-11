local opts = { noremap = true, silent = true }

-- Leader key
vim.g.maplocalleader = ' '
vim.g.mapleader = ' '

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)
keymap("i", "JJ", "<ESC>", opts)

-- Normal --

-- Disable recording
keymap("n", "q", "<Nop>", opts)

-- File explorer
-- keymap("n", "-", ":Ex<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Switching buffer
keymap("n", "<leader>n", ":bnext<CR>", opts)
keymap("n", "<leader>p", ":bprevious<CR>", opts)

-- Delete current buffer
keymap("n", "<leader>q", ":bdelete<CR>", opts)
keymap("n", "<c-w>", ":bdelete<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Easier $ and ^ implementation
keymap("n", "<S-l>", "$", opts)
keymap("n", "<S-h>", "^", opts)

-- Insert newline without insert mode
keymap("n", "go", "O<esc>", opts)

-- Better J
keymap("n", "J", "mzJ`z", opts)

-- Cursor stay in middle during scroll
keymap("n", "<C-d", "<C-d>zz", opts)
keymap("n", "<C-u", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Clear search highlight
keymap("n", "<leader>sc", ":nohl<CR>", opts)

-- Visual --

-- Cursor stay after yank
keymap("x", "y", "ygv<esc>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Copy and Cut to system clipboard
keymap("v", "<c-c>", '"+y', opts)
keymap("v", "<c-x>", '"+y', opts)

-- Visual Block --

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

