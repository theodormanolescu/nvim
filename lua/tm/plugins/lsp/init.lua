local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "tm.plugins.lsp.mason"
require("tm.plugins.lsp.handlers").setup()
require "tm.plugins.lsp.null-ls"
