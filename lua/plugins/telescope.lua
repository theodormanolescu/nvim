return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      { "<leader>/", false },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { "var/cache", ".git", ".idea", ".undo", "__pycache__" },
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
      },
      pickers = {
        live_grep = {
          only_sort_text = true,
        },
        find_files = {
          hidden = true,
          no_ignore = true,
        },
        colorscheme = {
          enable_preview = true,
        },
      },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      {
        "ahmedkhalf/project.nvim",
        opts = {
          -- manual_mode = true,
          patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml", "composer.json" },
        },
      },
    },
    keys = {
      { "<leader>pn", ":lua require('project_nvim.project').add_project_manually()<CR>", desc = "Project" },
    },
  },
}
