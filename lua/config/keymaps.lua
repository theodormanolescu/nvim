local options = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
map("n", "<C-s>", ":lua require('config.utils').save()<CR>", options)
map("i", "<C-s>", "<c-o>:lua require('config.utils').save()<cr>", options)
map("n", "<C-Down>", ":move .+1<CR>", options)
map("n", "<C-Up>", ":move .-2<CR>", options)
map("v", "p", '"_dP', options)

-- map("n", "<leader>pn", ":lua require('project_nvim.project').add_project_manually()<CR>", options)
