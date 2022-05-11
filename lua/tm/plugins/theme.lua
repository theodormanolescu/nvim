local status_ok, nightfox= pcall(require, 'nightfox')
if not status_ok then
    return
end

nightfox.setup({
    palettes =  {
        nightfox = { comment = "#629755" }
    },
    specs = {
        nightfox = {
            syntax = {
                func = "yellow"
            }
        }
    }
})

vim.cmd("colorscheme nightfox")

