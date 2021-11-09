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
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


" git signs, needs plenary
Plug 'lewis6991/gitsigns.nvim'

" treesitter highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update


"nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" lsp config
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'


" statusline
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" lsp saga
Plug 'glepnir/lspsaga.nvim'
call plug#end()
filetype plugin indent on


lua << EOF
require('tm')
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "python",
    "php",
    "json",
    "yaml",
    "html"
    }
}

require'lualine'.setup { options = { theme  = 'tokyonight' } }

local saga = require 'lspsaga'
saga.init_lsp_saga()

EOF
