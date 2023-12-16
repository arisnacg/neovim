return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local branch = {
        "branch",
        icons_enabled = true,
        icon = "",
      }
      local progress = {
        "progress",
        icons_enabled = true,
        icon = "󰦪",
      }
      local diagnostics = {
        "diagnostics",
        colored = false,
      }
      local buffers = {
        "buffers",
        use_mode_colors = true,
        icons_enabled = false,
        buffers_color = {
          inactive = 'lualine_c_normal',
        },
        symbols = {
          alternate_file = false,
        },
      }
      local filetype = {
        "filetype",
        colored = false
      }
      require("lualine").setup({
        options = {
          theme = "auto",
          globalstatus = true,
          icons_enabled = true,
          disabled_filetypes = { "alpha", "dashboard", "Outline" },
          always_divide_middle = true,
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {},
          lualine_c = { branch, diagnostics },
          lualine_x = { 'searchcount', 'encoding', progress },
          lualine_y = {},
        },
        tabline = {
          lualine_a = { buffers },
          lualine_z = { filetype },
        },
        extensions = {},
      })
    end
  },
}
