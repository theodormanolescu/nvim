local status_ok, packer = pcall(require, 'null-ls')
if not status_ok then
    return
end

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.black,
    },
})

