local status_ok, plugin = pcall(require, 'which-key')
if not status_ok then
    return
end

plugin.setup()

