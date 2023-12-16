return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    extra = {
      -- comment and insert at end of line
      eol = "gca",
    },
  }
}
