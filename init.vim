" Install vim-plug if not found
let config_path = '~/.config/nvim'
if empty(glob(config_path . '/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin(config_path . '/plugged')
" fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" theme
Plug 'arcticicestudio/nord-vim'


" lsp config
Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/nvim-cmp'


" lsp saga
" Plug 'glepnir/lspsaga.nvim'


call plug#end()

colo nord

set cmdheight=2
set relativenumber
scriptencoding utf-8
set nocompatible            " disable compatibiliy to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard "
filetype plugin on
set cursorline              " highlight current cursorline "
set ttyfast                 " Speed up scrolling in Vim" 
set backupdir=~/.cache/nvim  " Directory to store backup files.



" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


lua << EOF
require'lspconfig'.intelephense.setup{}
require'lspconfig'.pyright.setup{}
EOF


