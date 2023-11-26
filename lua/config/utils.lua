local M = {}
local title = "Actions"
function M.save()
  vim.api.nvim_command("write")
  vim.notify("Saved..", vim.log.levels.INFO, {
    title = title,
  })
end

function M.format()
  vim.lsp.buf.format({ async = true })
  vim.notify("Formatted", vim.log.levels.INFO, {
    title = title,
  })
end

return M
