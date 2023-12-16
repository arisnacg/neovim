return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  tag = "0.1.3",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>f" }
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        color_devicons = true,
        file_ignore_patterns = {
          ".git/",
          "node_modules/",
          ".vagrant/",
          ".null-ls",
          "%lazy-lock.json",
          "__pycache__/",
          "build/",
          "dist/",
          ".vscode/",
        },
        -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["q"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
          hidden = true,
          -- no_ignore = true,
        },
        lsp_document_symbols = {
          theme = "dropdown",
          previewer = false,
        },
        diagnostics = {
          theme = "dropdown",
          previewer = false,
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
        }
      },
    })

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
  end
}
