local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

local previewers = require("telescope.previewers")

local _bad = { ".*%.csv", ".*%.lua", "*%.lock"} -- Put all filetypes that slow you down in this array
local bad_files = function(filepath)
  for _, v in ipairs(_bad) do
    if filepath:match(v) then
      return false
    end
  end

  return true
end
local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}
  if opts.use_ft_detect == nil then opts.use_ft_detect = true end
  opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
        vim.schedule(function()
                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "TOO BIG!" })
        end)
    else previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end



telescope.setup {
    defaults = {
        file_ignore_patterns = { "var/cache", ".git", ".idea", ".undo" },
        buffer_previewer_maker = new_maker,
    },
    pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
          -- find_command = { "fd", "--type=file", "--exclude=.git" },
        },
        live_grep = {
          only_sort_text = true,
        },
    }
}


local status_ok, notify = pcall(require, 'notify')
if not status_ok then
    return
end
vim.notify = notify
telescope.load_extension("notify")
