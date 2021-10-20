call plug#begin('~/.config/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'dense-analysis/ale'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'glepnir/lspsaga.nvim'

" git collors
Plug 'kristijanhusak/defx-git'
Plug 'folke/lsp-colors.nvim'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
" Icons
Plug 'kyazdani42/nvim-web-devicons'

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
set spell                   " enable spell check (may need to download language package)"
set backupdir=~/.cache/nvim  " Directory to store backup files.
set inccommand=split

" Finding files - Search down into subfolders
set path+=**

au BufNewFile,BufRead *.py setf python
runtime ./plugins.vim
runtime ./mappings.vim

