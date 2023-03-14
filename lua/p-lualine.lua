local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "warn", "error" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = false,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch, diff },
    lualine_c = { "filename" },
    lualine_x = { diagnostics },
    lualine_y = { 'filetype' },
  },
  tabline = {},
  extensions = {},
})
