local status_ok, fileex = pcall(require, "oil")
if not status_ok then
  return
end
vim.keymap.set("n", "-", fileex.open)
