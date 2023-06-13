local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- On attach
local on_attach = function(_, curbuff)
  -- Keymap
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

  -- Lsp message
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
      virtual_text = true,
      signs = true,
      update_in_insert = false,
    }
  )

  -- Format on save
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
    buffer = curbuff,
    callback = function()
      vim.lsp.buf.format()
    end
  })
end

-- Neovim lua config
require("neodev").setup {}

-- Language server configurations
local ensure_installed = { "yamlls", "lua_ls" }
local server_configs = {
  -- YAML
  yamlls = {},
  -- Lua
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Completion configuration
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Mason configuration
require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup {
  ensure_installed = ensure_installed,
}

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      settings = server_configs[server_name],
      capabilities = capabilities
    }
  end,
}
