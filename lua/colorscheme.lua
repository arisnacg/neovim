local status_ok, scheme = pcall(require, "tokyonight")
if not status_ok then
  return
end

vim.cmd[[colorscheme tokyonight-night]]

