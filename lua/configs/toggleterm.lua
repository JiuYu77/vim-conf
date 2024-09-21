local status, toggleterm = pcall(require, "toggleterm")

if not status then  -- The plugin is not existed
    return
end

toggleterm.setup({
  open_mapping = [[<leader>tt]],
  direction = "horizontal",  -- float  horizontal  vertical
  shade_terminal = true
})
