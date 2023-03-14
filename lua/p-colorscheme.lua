vim.cmd('colorscheme onedark')
-- Lua
require('onedark').setup {
  -- Main options --
  style = 'dark',      -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = false, -- Show/hide background

  code_style = {
    comments = 'none',
  },

  diagnostics = {
    darker = true,     -- darker colors for diagnostic
    undercurl = true,  -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
}
require('onedark').load()
