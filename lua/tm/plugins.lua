vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }}
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }}
  -- nerdtree and plugins
  use { 'preservim/nerdtree' }
  use { 'Xuyuanp/nerdtree-git-plugin', requires = { 'preservim/nerdtree' }}
  use { 'ryanoasis/vim-devicons', requires = { 'preservim/nerdtree' }}
  use { 'folke/tokynight.nvim', branch = 'main'}
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true}}
  use { 'tami5/lspsaga.nvim', requires = { 'neovim/nvim-lspconfig' }}


end)



Plug 'nvim-lua/popup.nvim'



" lsp config
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'https://github.com/onsails/lspkind-nvim.git'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'


