local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("mason").setup()
require("mason-lspconfig").setup{
  ensure_installed = {"lua_ls"}
}


local on_attach = function(_, _)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  -- vim.diagnostic.config({virtual_text = false})
end

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},
      },
    },
  },
}

