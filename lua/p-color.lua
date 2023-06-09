local status_ok, colorscheme = pcall(require, "catppuccin")
if not status_ok then
  return
end

colorscheme.setup({
  flavour = "macchiato",
  no_italic = true,
  no_bold = true,
  no_underline = true,
})
vim.cmd.colorscheme "catppuccin"

