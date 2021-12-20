local status_ok, packer = pcall(require, 'Comment')
if not status_ok then
    return
end

require('Comment').setup()

