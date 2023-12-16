return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  opts = {
    ensure_installed = { "yaml", "dockerfile", "lua", "javascript", "typescript", "terraform" },
    auto_install = false,
    highlight = { enable = true },
    indent = {
      enable = true,
    },
  }
}
