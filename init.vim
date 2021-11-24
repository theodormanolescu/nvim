
filetype plugin indent on
set backupdir=~/.local/share/nvim/backup//
lua << EOF
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]
require('plugins')
require('tm')
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
        init_selection = 'gnn',
        node_incremental = 'grn',
        scope_incremental = 'grc',
        node_decremental = 'grm',
    },
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
  },
  textobjects = {
    select = { 
        enable = true,
        lookahead = true,
        keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
        },                                                                                
    },                                                                                
    move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
        },
        goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
        },
        goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
        },
        goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
        },
    },
  },
}

require'lualine'.setup { options = { theme  = 'tokyonight' } }

local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF
