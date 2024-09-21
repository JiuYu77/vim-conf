local map = vim.api.nvim_set_keymap
local opt = {noremap = true,silent = true}

-- File tree,,Neotree
map("n", "<leader>e", "<Cmd>Neotree toggle<CR>", opt)
-- bufferline
map("n", "gb", "<Cmd>BufferLinePick<CR>", opt)

----- telescope -----
local status, builtin = pcall(require,"telescope.builtin")  -- builtin == require("telescope.builtin")
if status then
    vim.keymap.set("n", "<leader>ff", builtin.find_files,{})
    map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opt)
    map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opt)
    map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opt)
else
    print("Telescope is not found")
end
----- telescope -----
