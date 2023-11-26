return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      require("nightfox").setup({
        palettes = {
          -- nightfox = { comment = "#629755" },
        },
        specs = {
          nightfox = {
            syntax = { func = "yellow" },
          },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfox",
    },
  },
}
