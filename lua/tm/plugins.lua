vim.notify = require 'notify'
require('telescope').setup()
require("telescope").load_extension("notify")
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


