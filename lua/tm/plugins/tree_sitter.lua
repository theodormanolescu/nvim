local status_ok, packer = pcall(require, 'nvim-treesitter')
if not status_ok then
    return
end

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = true
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
    disable = { "yaml" },
  },
    ensure_installed = "all",
    ignore_install = { "phpdoc" },
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
