vim.g.mapleader = ' '
local function map(mode, key, result, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, key, result, options)
end
-- Telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>fg", ":Telescope live_grep<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map("n", "<Leader>gr", ":Lspsaga lsp_finder<CR>")

-- quit all
map("n", "<Leader>qq", ":qa<CR>")
map("n", "<Leader>w", ":wq<CR>")

-- Move to the next/previous buffer
map('n', '<leader>[', ':bp<CR>')
map('n', '<leader>]', ':bn<CR>')


map('n', '<C-Down>',    ':move .+1<CR>')
map('n', '<C-Up>',      ':move .-2<CR>')
