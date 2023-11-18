local M = {
    "jose-elias-alvarez/null-ls.nvim",
}

function M.config()
    local null_ls = require "null-ls"

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup {
        sources = {
            formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
            formatting.black,
            diagnostics.php,
            code_actions.gitsigns,
            null_ls.builtins.completion.spell,
        },
    }
end

return M
