local status_ok, packer = pcall(require, 'tokyonight')
if not status_ok then
    return
end
vim.cmd[[colorscheme tokyonight]]

local status_ok, packer = pcall(require, 'lualine')
if not status_ok then
    return
end

require('lualine').setup { options = { theme  = 'tokyonight' } }

