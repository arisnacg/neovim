local status_ok, tabline = pcall(require, "tabline")
if not status_ok then
  return
end

tabline.setup{
  options = {
    modified_italic = false,
  }
}

