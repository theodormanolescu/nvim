return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- init = function()
      local lsp = {
        function()
          local msg = "No Active Lsp"
          local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = "LSP:",
      }
      opts.sections.lualine_z = opts.sections.lualine_y
      opts.sections.lualine_y = { lsp }
      opts.options.component_separators = { left = "", right = "" }
      opts.options.section_separators = { left = "", right = "" }
      opts.options.extensions = { "quickfix", "man", "fugitive", "lazy", "mason", "neo-tree" }
    end,
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment" },
    },

    init = function()
      require("Comment").setup({
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = { line = "gcc", block = "gbc" },
        opleader = { line = "gc", block = "gb" },
        extra = { above = "gcO", below = "gco", eol = "gcA" },
        mappings = { basic = true, extra = true },
        pre_hook = function(...)
          local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
          if loaded and ts_comment then
            return ts_comment.create_pre_hook()(...)
          end
        end,
        post_hook = nil,
      })
    end,
  },
}
