local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    spec = LAZY_PLUGIN_SPEC,
    -- spec = {
    --     { import = "tm2.plugins"}
    -- },
    install = {
        colorscheme = { "primer_dark", "habamax" },
    },
    checker = { enabled = true },
    ui = {
        border = "rounded",
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
}
