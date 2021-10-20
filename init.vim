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

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()


" coc settings
set hidden
set updatetime=300
set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif




colo nord
" set fileencodings=utf-8
set encoding=utf-8
" scriptencoding utf-8
" set title
set cmdheight=2
set relativenumber
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
" set wildmode=longest,list   " get bash-like tab completions
" filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard "
" filetype plugin on
set cursorline              " highlight current cursorline "
set ttyfast                 " Speed up scrolling in Vim" 
" set spell                   " enable spell check (may need to download language package)"
set backupdir=~/.cache/nvim  " Directory to store backup files.
" set inccommand=split

" Finding files - Search down into subfolders
set path+=**

runtime ./mappings.vim
