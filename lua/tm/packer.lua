local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    vim.notify("Installing packer close and reopen Neovim...")
    vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end
return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    use 'lunarvim/darkplus.nvim'
    use 'folke/tokyonight.nvim'
    use 'EdenEast/nightfox.nvim'


    use {'nvim-telescope/telescope.nvim',                   requires = {'nvim-lua/plenary.nvim'}}
    use {'kyazdani42/nvim-tree.lua',                        requires = {'kyazdani42/nvim-web-devicons'}}
    use {'lewis6991/gitsigns.nvim',                         requires = {'nvim-lua/plenary.nvim'}}
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'saadparwaiz1/cmp_luasnip'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'rcarriga/nvim-notify'
    use 'folke/which-key.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'tami5/lspsaga.nvim'
    use 'numToStr/Comment.nvim'

    use 'williamboman/nvim-lsp-installer'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-treesitter/nvim-treesitter-textobjects',     requires = {'nvim-treesitter/nvim-treesitter'}}
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)