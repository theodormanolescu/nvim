vim.g.mapleader = " "
local options = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>", options)
map("n", "<Leader>fG", ":Telescope git_files<CR>", options)
map("n", "<Leader>fg", ":Telescope live_grep<CR>", options)
map("n", "<Leader>ft", ":Telescope treesitter<CR>", options)
map("n", "<Leader>fp", ":Telescope projects<CR>", options)
map("n", "<Leader>fb", ":Telescope buffers<CR>", options)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", options)
map("n", "<Leader>gr", ":Lspsaga lsp_finder<CR>", options)
map("n", "<Leader>bd", ":Lspsaga show_buf_diagnostics<CR>", options)
-- map("n", "<Leader>e[", ":Lspsaga diagnostic_jump_prev<CR>", options)
map("n", "<Leader>ca", ":Lspsaga code_action<CR>", options)

map("n", "<Leader>fl", ":lua require('tm.utils').format()<CR>", options)
map("n", "<Leader>cl", ":lua vim.lsp.codelens.run()<CR>", options)

map("n", "<F8>", ":NvimTreeToggle<CR>", options)
map("n", "<F6>", ":TroubleToggle<CR>", options)
map("n", "<F5>", ":e!<CR>", options)

map("n", "<Esc>", "<cmd> :noh <CR>", options)
-- leader j/k/l/h resize active split by 5
map("n", "<Leader>j", "<C-W>5-", options)
map("n", "<Leader>k", "<C-W>5+", options)
map("n", "<Leader>l", "<C-W>5>", options)
map("n", "<Leader>h", "<C-W>5<", options)

-- quit all
map("n", "<Leader>qq", ":qa<CR>", options)
map("n", "<Leader>w", ":wq<CR>", options)

map("n", "<C-s>", ":lua require('tm.utils').save()<CR>", options)
map("i", "<C-s>", "<c-o>:lua require('tm.utils').save()<cr>", options)



-- Move to the next/previous buffer
map("n", "<leader>[", ":bp<CR>", options)
map("n", "<leader>]", ":bn<CR>", options)

map("n", "<C-Down>", ":move .+1<CR>", options)
map("n", "<C-Up>", ":move .-2<CR>", options)
map("v", "p", '"_dP', options)

-- Better window navigationgitsigns
map("n", "<C-h>", "<C-w>h", options)
map("n", "<C-j>", "<C-w>j", options)
map("n", "<C-k>", "<C-w>k", options)
map("n", "<C-l>", "<C-w>l", options)
