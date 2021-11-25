vim.cmd[[colorscheme tokyonight]]
local opt = vim.opt                 -- to set options
local cmd = vim.api.nvim_command
opt.mouse = "a"
opt.cmdheight=2
opt.relativenumber = true
opt.encoding="utf-8"
opt.showmatch = true                -- show matching 
opt.ignorecase  = true              -- case insensitive 
opt.hlsearch = true                 -- highlight search 
opt.colorcolumn = "90"
opt.incsearch = true                -- incremental search

-- tabs
opt.expandtab = true                -- converts tabs to white space
opt.shiftwidth = 0                  -- width for autoindents
opt.softtabstop = -1                -- If negative, shiftwidth value is used
opt.autoindent = true               -- indent a new line the same amount as the line just typed
opt.tabstop = 4                     -- number of columns occupied by a tab 
opt.number = true                   -- add line numbers
opt.smarttab = true
opt.cindent = true

opt.syntax = 'on'                   -- syntax highlighting
opt.termguicolors = true
opt.clipboard = 'unnamedplus'       -- using system clipboard "
opt.cursorline = true               -- highlight current cursorline "
opt.ttyfast = true                  -- Speed up scrolling in Vim"
opt.hidden = true                   -- Do not save when switching buffers
opt.scrolloff = 8                   -- Number of screen lines to keep above and below the cursor
opt.colorcolumn = '99999'           -- To fix a neovim bug affecting indent-blankline
cmd('filetype plugin indent on')
