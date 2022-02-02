local M = {}

function M.save()
    vim.api.nvim_command('write')
    vim.notify('Saved..')
end
return M
