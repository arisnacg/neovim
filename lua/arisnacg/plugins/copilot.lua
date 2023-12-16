return {
  "github/copilot.vim",
  event = "VeryLazy",
  config = function()
    vim.keymap.set('i', '<S-CR>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false
    })
    vim.g.copilot_no_tab_map = true
  end
}
