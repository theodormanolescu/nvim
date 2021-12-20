local status_ok, _ = pcall(require, 'telescopes`')
if not status_ok then
    return
end

local telescope = require 'telescope'
telescope.setup {}


local status_ok, _ = pcall(require, 'notify')
if not status_ok then
    return
end
vim.notify = require 'notify'
telescope.load_extension("notify")
