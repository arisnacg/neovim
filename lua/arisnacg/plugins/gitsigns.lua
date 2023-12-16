return {
  "lewis6991/gitsigns.nvim",
  events = "VeryLazy",
  config = function()
    require('gitsigns').setup()
  end
}
