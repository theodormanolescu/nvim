local cmd = vim.api.nvim_command
HOME_PATH = "/home/" .. vim.fn.expand("$USER")
local opt = vim.opt
opt.encoding = "utf-8"
opt.showmatch = true -- show matching
opt.winbar = "%=%m %t"
opt.laststatus = 3 -- global status line
opt.shiftwidth = 0 -- width for autoindents
opt.softtabstop = -1 -- If negative, shiftwidth value is used
opt.tabstop = 4 -- number of columns occupied by a tab
opt.cindent = true
opt.syntax = "on" -- syntax highlighting
opt.guifont = "monospace:h17"
opt.backup = false -- Don't use swap or backup
opt.swapfile = false
opt.ttyfast = true -- Speed up scrolling in Vim"
opt.colorcolumn = "99999" -- To fix a neovim bug affecting indent-blankline
opt.pumblend = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
opt.undodir = HOME_PATH .. "/.config/nvim-lazyvim/.undo"
opt.undofile = true
opt.autochdir = true
cmd("filetype plugin indent on")
