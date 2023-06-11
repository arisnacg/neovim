-- Hightlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Default to vertical split
vim.cmd([[
  augroup custom_autocmds
    autocmd!
    autocmd WinNew * wincmd L
  augroup END
]])


