vim.g.mapleader = ' '
local options = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
-- Telescope
map('n', '<Leader>ff', ':Telescope find_files<CR>', options)
map('n', '<Leader>fg', ':Telescope live_grep<CR>', options)
map('n', '<Leader>ft', ':Telescope treesitter<CR>', options)
map('n', '<Leader>fb', ':Telescope buffers<CR>', options)
map('n', '<Leader>fh', ':Telescope help_tags<CR>', options)
map('n', '<Leader>gr', ':Lspsaga lsp_finder<CR>', options)
map('n', '<Leader>e]', ':Lspsaga diagnostic_jump_next<CR>', options)
map('n', '<Leader>e[', ':Lspsaga diagnostic_jump_prev<CR>', options)
map('n', '<Leader>ca', ':Lspsaga code_action<CR>', options)
map('n', '<Leader>fl', ':lua vim.lsp.buf.formatting()<CR>', options)


map('n', '<F8>', ':NvimTreeToggle<CR>', options)
map('n', '<F5>', ':e!<CR>', options)

-- quit all
map('n', '<Leader>qq', ':qa<CR>', options)
map('n', '<Leader>w', ':wq<CR>', options)

-- Move to the next/previous buffer
map('n', '<leader>[', ':bp<CR>', options)
map('n', '<leader>]', ':bn<CR>', options)


map('n', '<C-Down>',    ':move .+1<CR>', options)
map('n', '<C-Up>',      ':move .-2<CR>', options)
map("v", "p", '"_dP', options)

-- Better window navigationgitsigns
map("n", "<C-h>", "<C-w>h", options)
map("n", "<C-j>", "<C-w>j", options)
map("n", "<C-k>", "<C-w>k", options)
map("n", "<C-l>", "<C-w>l", options)
