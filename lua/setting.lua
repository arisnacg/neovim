vim.opt.backup = false -- creates a backup file
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.modifiable = true
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
-- vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
-- vim.opt.cursorline = true -- line highlight
-- vim.opt.guicursor = "" -- cursor stay block in insert mode
vim.opt.foldenable = false
vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Disable vim default next line comment behavior
vim.cmd "autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
-- Disable underline on matching bracket
vim.cmd "highlight MatchParen gui=none"
-- Dsable italic
vim.cmd "highlight Normal gui=none"
vim.cmd "highlight Comment gui=none"
