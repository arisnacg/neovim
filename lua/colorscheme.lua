local status_ok, scheme = pcall(require, "tokyonight")
if not status_ok then
  return
end

scheme.setup{
  on_highlights = function(hl, c)
    hl.BufferLineFill = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
}

vim.cmd[[colorscheme tokyonight-night]]

