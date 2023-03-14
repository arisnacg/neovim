local telescope = require("telescope")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local actions = require "telescope.actions"

telescope.setup({
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
})

-- Enable telescope fzf native, if installed
pcall(telescope.load_extension, 'fzf')
-- Enable telescope bookmark, if installed
pcall(telescope.load_extension, 'vim_bookmarks')

-- find files func
local function telescope_find_files()
  builtin.find_files(themes.get_dropdown {
    winblend = 10,
    previewer = false,
    hidden = true
  })
end

-- find buffer func
local function telescope_buffers()
  builtin.buffers({ initial_mode = "normal" })
end

-- find bookmarks
local function telescope_bookmarks()
  telescope.extensions.vim_bookmarks.all({ initial_mode = "normal" })
end

-- Keymaps
vim.keymap.set('n', '<C-p>', telescope_find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>ff', telescope_find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader><leader>', telescope_buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find Diagnostics' })
vim.keymap.set('n', 'ma', telescope_bookmarks, { desc = 'All Bookmark' })
