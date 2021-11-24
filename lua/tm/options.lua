vim.cmd[[colorscheme tokyonight]]
local opt = vim.opt -- to set options

opt.mouse = "a"
opt.cmdheight=2
opt.relativenumber = true
opt.encoding="utf-8"
opt.showmatch = true            -- show matching 
opt.ignorecase  = true          -- case insensitive 
opt.hlsearch = true             -- highlight search 
opt.colorcolumn="90"
opt.incsearch = true            -- incremental search
opt.tabstop=4                   -- number of columns occupied by a tab 
opt.softtabstop=4               -- see multiple spaces as tabstops so <BS> does the right thing
opt.expandtab = true            -- converts tabs to white space
opt.shiftwidth=4                -- width for autoindents
opt.autoindent = true           -- indent a new line the same amount as the line just typed
opt.number = true               -- add line numbers
-- set wildmode=longest,list    -- get bash-like tab completions
opt.syntax = "on"               -- syntax highlighting
opt.termguicolors = true
opt.clipboard="unnamedplus"     -- using system clipboard "
opt.cursorline = true           -- highlight current cursorline "
opt.ttyfast = true              -- Speed up scrolling in Vim" 
