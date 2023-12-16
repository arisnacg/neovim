local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

----------------------------------
-- Insert --
----------------------------------
-- Press jj fast to enter
keymap.set("i", "jj", "<ESC>", opts)
keymap.set("i", "JJ", "<ESC>", opts)

-- Better undo experience
keymap.set("i", ".", ".<c-g>u", opts)
keymap.set("i", " ", " <c-g>u", opts)
keymap.set("i", ",", ",<c-g>u", opts)
keymap.set("i", "=", "=<c-g>u", opts)
keymap.set("i", "(", "(<c-g>u", opts)
keymap.set("i", "[", "[<c-g>u", opts)
keymap.set("i", "{", "{<c-g>u", opts)

----------------------------------
-- Normal --
----------------------------------

-- Select all
keymap.set("n", "<C-a>", "ggVG", opts)

-- Quit
keymap.set("n", "<leader>x", ":q<CR>", opts)

-- Disable recording
keymap.set("n", "q", "<Nop>", opts)

-- File explorer
keymap.set("n", "-", ":Ex<CR>", opts)

-- Close quickfix list
keymap.set("n", "<C-c>", ":cclose<CR>", opts)
keymap.set("n", "<C-c>", ":lclose<CR>", opts)

-- Move to start/end of the line
keymap.set("n", "<leader>l", "$", opts)
keymap.set("n", "<leader>h", "^", opts)

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Switching buffer
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
keymap.set("n", "<S-l>", ":bnext<CR>", opts)

-- Delete current buffer
keymap.set("n", "<leader>q", ":bdelete<CR>", opts)
keymap.set("n", "<leader><S-q>", ":bdelete!<CR>", opts)

-- Resize with arrows
keymap.set("n", "<C-A-k>", ":resize +2<CR>", opts)
keymap.set("n", "<C-A-j>", ":resize -2<CR>", opts)
keymap.set("n", "<C-A-l>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-A-h>", ":vertical resize +2<CR>", opts)

-- Insert newline without insert mode
keymap.set("n", "go", "O<esc>", opts)

-- Better J
keymap.set("n", "J", "mzJ`z", opts)

-- Cursor stay in middle during scroll
keymap.set("n", "<C-d", "<C-d>zz", opts)
keymap.set("n", "<C-u", "<C-u>zz", opts)
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

-- Clear search highlight
keymap.set("n", "<leader>nh", ":nohl<CR>", opts)

----------------------------------
-- Visual --
----------------------------------

-- Cursor stay after yank
-- keymap.set("x", "y", "ygv<esc>", opts)

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move text up and down
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
keymap.set("v", "p", '"_dP', opts)

-- Copy and Cut to system clipboard
keymap.set("v", "<leader>y", '"+y', opts)

----------------------------------
-- Visual Block --
----------------------------------

-- Move text up and down
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
