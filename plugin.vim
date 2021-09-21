" Plugins
call plug#begin('~/.config/nvim/plugged')
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'neovim/nvim-lspconfig'
	Plug 'kabouzeid/nvim-lspinstall'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	" Plug 'nvim-lua/completion-nvim'
  " Plug 'steelsojka/completion-buffers'
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
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
call plug#end()

" Quick Configuration

let g:coq_settings = { 'auto_start': 'shut-up', 'display.icons.mode': 'long' }

lua << EOF

local nvim_lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol'

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

  -- formatting
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

end

-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
   vim.fn.sign_define("LspDiagnosticsSign" .. name, { text = icon, numhl = "LspDiagnosticsDefaul" .. name })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
   virtual_text = false,
   signs = true,
   underline = true,
   update_in_insert = false, -- update diagnostics insert mode
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
   border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
   border = "single",
})


lspSymbol("Error", "")
lspSymbol("Information", "")
lspSymbol("Hint", "")
lspSymbol("Warning", "")

nvim_lsp.flow.setup {
  on_attach = on_attach
}

require'lspinstall'.setup()
local servers = require'lspinstall'.installed_servers()
local nvim_lsp = require('lspconfig')
local coq = require("coq")
for _, server in pairs(servers) do
  nvim_lsp[server].setup(coq.lsp_ensure_capabilities(
                           vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {debounce_text_changes = 150},
        init_options = config
    }, {})))
end
EOF

" Better escape
let g:better_escape_shortcut = 'jj'

" Nvim autopairs
lua require('nvim-autopairs').setup{}

" Git sign
lua require('gitsigns').setup()

" Comment
lua require('nvim_comment').setup()

