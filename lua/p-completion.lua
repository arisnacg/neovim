local status_ok, cmp = pcall(require, "cmp")

if not status_ok then
  return
end

local kind_icons = {
  Text = "󰗴ext",
}

cmp.setup {
  mapping = cmp.mapping.preset.insert {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },

  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.menu = ({
      --   nvim_lsp = "[LSP]",
      --   buffer = "[Buff]",
      --   path = "[Path]",
      -- })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "buffer" },
    { name = "path" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = false
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}
