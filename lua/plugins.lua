-- vim.cmd [[packadd packer.nvim]]
local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  -- treesitter and plugins
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- telescope and plugins
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'}}}
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- nerdtree and plugins
  use {'preservim/nerdtree', requires = {{'Xuyuanp/nerdtree-git-plugin'}, {'ryanoasis/vim-devicons'}}}
  use {'folke/tokyonight.nvim'}
  use {'neovim/nvim-lspconfig'}
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  use {'tami5/lspsaga.nvim', requires = {'neovim/nvim-lspconfig'}}
  use {'onsails/lspkind-nvim'}

  -- Completionus 
  use 'norcalli/snippets.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'
  use 'saadparwaiz1/cmp_luasnip'
  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets'}}
end)

