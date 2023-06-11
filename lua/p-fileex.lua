local status_ok, fileex = pcall(require, "oil")
if not status_ok then
  return
end

fileex.setup{
  skip_confirm_for_simple_edits = true,
}

vim.keymap.set("n", "-", fileex.open)
