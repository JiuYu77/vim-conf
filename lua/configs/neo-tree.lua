local status, neo_tree = pcall(require, "neo-tree")

if not status then
    return
end

neo_tree.setup({
  close_if_last_window = true,  -- Close Neo-tree if it is the last window left in the tab
  icon = {
    folder_closed = "",
    folder_open = "",
    folder_empty = "󰜌",
    -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
    -- then these will never be used.
    default = "*",
    highlight = "NeoTreeFileIcon"
  },
  window = {
    position = "left",  -- location
    width = 30,  -- window width
  },
})
