local M = {
    "EdenEast/nightfox.nvim",
    lazy = false,  -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
    require("nightfox").setup({
        palettes = {
            nightfox = { comment = "#629755" },
        },
        specs = {
            nightfox = {
                syntax = {
                    func = "yellow",
                },
            },
        },
    })

    vim.cmd.colorscheme "nightfox"
end

return M
