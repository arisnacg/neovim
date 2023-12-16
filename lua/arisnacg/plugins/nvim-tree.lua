return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = { { "-" } },
  config = function()
    local nvimtree = require("nvim-tree")

    local function on_attach(bufnr)
      local api = require('nvim-tree.api')
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)
      -- remove a default
      vim.keymap.del('n', 'W', { buffer = bufnr })
      vim.keymap.del('n', '-', { buffer = bufnr })
      -- override
      vim.keymap.set('n', 'C', api.tree.collapse_all, opts('Collapse'))
    end

    -- configure nvim-tree
    nvimtree.setup({
      on_attach = on_attach,
      disable_netrw = true,
      view = {
        side = "right",
        width = 35
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = false
          }
        },
        root_folder_label = false
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
          quit_on_open = true
        },
      },
      filters = {
        custom = { ".DS_Store", "lazy-lock.json" },
      },
      git = {
        ignore = false,
      },
    })
    -- set keymaps
    local keymap = vim.keymap
    keymap.set("n", "-", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
  end,
}
