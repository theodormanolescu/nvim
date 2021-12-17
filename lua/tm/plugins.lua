vim.notify = require 'notify'


local telescope = require 'telescope'
local actions = require "telescope.actions"

telescope.setup {}
telescope.load_extension("notify")
require('Comment').setup()
require('lualine').setup { options = { theme  = 'tokyonight' } }
require("which-key").setup {}
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.black,
    },
})

local saga = require('lspsaga')
saga.init_lsp_saga()


