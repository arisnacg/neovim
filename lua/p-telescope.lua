local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local builtin = require("telescope.builtin")
local actions = require "telescope.actions"

telescope.setup{
  defaults = {
    path_display = { "smart" },
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    color_devicons = true,
    file_ignore_patterns = {
      ".git", "node_modules", "build", "dist", "yarn.lock", "lazy.lock.json" 
    },
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
      }
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
  },
}

-- find files func
local function telescope_find_files()
  builtin.find_files({
    winblend = 10,
    previewer = false,
    hidden = true
  })
end

vim.keymap.set('n', '<C-p>', telescope_find_files, {})
vim.keymap.set('n', '<leader>ff', telescope_find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})


