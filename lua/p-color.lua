local status_ok, colorscheme = pcall(require, "tokyonight")
if not status_ok then
  return
end

colorscheme.setup{
  transparent = true,
  styles = {
    comments = { italic = false},
    keywords = { italic = false },
  },
}

vim.cmd.colorscheme "tokyonight-night"

