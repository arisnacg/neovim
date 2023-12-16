return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { 'antosha417/nvim-lsp-file-operations', config = true }
  },
  events = "Lazy",
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local telecope_builtin = require("telescope.builtin")

    -- Mason config
    require("mason").setup()

    -- Neovim lua config
    require("neodev").setup({})

    -- Language server configurations
    local ensure_installed = {
      "lua_ls",
      "tsserver",
      "terraformls"
    }
    local server_configs = {
      -- Lua
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      terraform_ls = {}
    }
    mason_lspconfig.setup({
      ensure_installed = ensure_installed,
    })

    -- Change diagnostic sign
    local signs = {
      { name = "DiagnosticSignError", text = "󰅚" },
      { name = "DiagnosticSignWarn", text = "󰀪" },
      { name = "DiagnosticSignHint", text = "󰌶" },
      { name = "DiagnosticSignInfo", text = "󰋽" },
    }
    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    -- On attach
    local on_attach = function(_, bufnr)
      -- Keymap
      local opts = { noremap = true, silent = true }
      -- move to next/prev diagnostic
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      -- show diagnostic message
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      -- go to definition
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      -- find references
      vim.keymap.set("n", "gr", telecope_builtin.lsp_references, opts)
      -- find implementations
      vim.keymap.set("n", "gi", telecope_builtin.lsp_implementations, opts)
      -- find symbols
      vim.keymap.set("n", "<leader>fs", telecope_builtin.lsp_document_symbols, opts)
      -- find diagnostics in current file
      vim.keymap.set("n", "<leader>fd", ":Telescope diagnostics bufnr=0<CR>", opts)
      -- find diagnostics in working directory
      vim.keymap.set("n", "<leader>fD", ":Telescope diagnostics<CR>", opts)
      -- rename
      vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
      -- hover
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      -- quick action
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

      -- Lsp message
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = false,
        signs = true,
        update_in_insert = false,
      })

      -- Format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end

    -- Completion configuration
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- Setup installed language servers
    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = on_attach,
          settings = server_configs[server_name],
          capabilities = capabilities,
        })
      end,
    })
  end
}
