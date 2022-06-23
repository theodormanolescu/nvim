local opt = vim.opt                 -- to set options
local cmd = vim.api.nvim_command
HOME_PATH = '/home/' .. vim.fn.expand('$USER')

opt.mouse = "a"
opt.relativenumber = true
opt.encoding="utf-8"
opt.showmatch = true                -- show matching
opt.ignorecase  = true              -- case insensitive
opt.hlsearch = true                 -- highlight search
opt.colorcolumn = "90"
opt.showmode = false
opt.incsearch = true                -- incremental search

opt.laststatus=3 -- global status line
opt.winbar="%=%m %f"

-- tabs
opt.expandtab = true                -- converts tabs to white space
opt.shiftwidth = 0                  -- width for autoindents
opt.softtabstop = -1                -- If negative, shiftwidth value is used
opt.autoindent = true               -- indent a new line the same amount as the line just typed
opt.tabstop = 4                     -- number of columns occupied by a tab
opt.number = true                   -- add line numbers
opt.smarttab = true
opt.cindent = true
opt.splitbelow = true                       -- force all horizontal splits to go below current window
opt.splitright = true                       -- force all vertical splits to go to the right of current windo


opt.completeopt = { "menuone", "noselect" }
opt.syntax = 'on'                   -- syntax highlighting
opt.termguicolors = true
opt.clipboard = 'unnamedplus'       -- using system clipboard "
opt.signcolumn = 'yes'
opt.guifont = "monospace:h17"
opt.cursorline = true               -- highlight current cursorline "
opt.backup = false               -- Don't use swap or backup
opt.swapfile = false
opt.ttyfast = true                  -- Speed up scrolling in Vim"
opt.hidden = true                   -- Do not save when switching buffers
opt.scrolloff = 8                   -- Number of screen lines to keep above and below the cursor
opt.colorcolumn = '99999'           -- To fix a neovim bug affecting indent-blankline

opt.undodir = HOME_PATH .. "/.config/nvim/.undo"
opt.undofile = true
opt.undolevels = 100
opt.undoreload = 100

cmd('filetype plugin indent on')
