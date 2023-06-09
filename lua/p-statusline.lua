local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

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
    lualine_a = { "mode"},
    lualine_b = {branch},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = { },
  },
  tabline = {},
  extensions = {},
})
