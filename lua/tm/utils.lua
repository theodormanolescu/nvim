local M = {}
local title = 'Actions'
function M.save()
    vim.api.nvim_command('write')
    vim.notify('Saved..', 'info', {
        title = title
    })
end

function M.format()
    vim.lsp.buf.format { async = true }
    vim.notify('Formatted', "info", {
        title = title
    })
end

return M
