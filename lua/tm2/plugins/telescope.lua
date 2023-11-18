local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
        'nvim-lua/plenary.nvim',
        "nvim-treesitter/nvim-treesitter",
        "rcarriga/nvim-notify",
    },
    lazy = true,
    cmd = "Telescope",
}

function M.config()
    local actions = require "telescope.actions"
    local previewers = require "telescope.previewers"
    local telescope = require "telescope"
    local _bad = { ".*%.csv", ".*%.lua", "*%.lock" } -- Put all filetypes that slow you down in this array
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
        if opts.use_ft_detect == nil then
            opts.use_ft_detect = true
        end
        opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)

        filepath = vim.fn.expand(filepath)
        vim.loop.fs_stat(filepath, function(_, stat)
            if not stat then
                return
            end
            if stat.size > 100000 then
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "TOO BIG!" })
                end)
            else
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
            end
        end)
    end




    telescope.setup {
        defaults = {
            file_ignore_patterns = { "var/cache", ".git", ".idea", ".undo", "__pycache__" },
            buffer_previewer_maker = new_maker,
            selection_strategy = "reset",
            path_display = { "smart" },
            color_devicons = true,
            set_env = { ["COLORTERM"] = "truecolor" },
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--glob=!.git/",
            },

            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,

                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
                n = {
                    ["<esc>"] = actions.close,
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["q"] = actions.close,
                },
            },
        },
        pickers = {
            live_grep = {
                only_sort_text = true
            },

            find_files = {
                hidden = true,
                no_ignore = true,
            },


            planets = {
                show_pluto = true,
                show_moon = true,
            },

            colorscheme = {
                enable_preview = true,
            },

        },
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            },
        },
    }
    local notify_ok, notify = pcall(require, "notify")
    if not notify_ok then
        return
    end

    notify.setup({
        stages = "fade_in_slide_out",
        minimum_width = 25,
        timeout = 1500,
    })

    vim.notify = notify
    telescope.load_extension("notify")
end

return M
